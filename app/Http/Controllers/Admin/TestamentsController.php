<?php

namespace App\Http\Controllers\Admin;

use App\Models\Item;
use App\Models\Store;
use App\Models\Testament;
use App\Models\Unit;
use App\Models\User;
use App\Repositories\Interfaces\TestamentRepositoryInterface;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Yajra\DataTables\Facades\DataTables;

class TestamentsController extends AdminController
{

    /**
     * TestamentsController constructor.
     * @param TestamentRepositoryInterface $testament_repo
     */
    public function __construct(TestamentRepositoryInterface $testament_repo)
    {
        parent::__construct();
        $this->testament_repo = $testament_repo;
        parent::$data['active_menu'] = 'testaments';
    }

    ////////////////////////////////
    public function getIndex()
    {
        parent::$data['users'] = User::all();
        return view('admin.testaments.view', parent::$data);
    }
    ////////////////////////////////

    /**
     * @param Request $request
     * @return mixed
     * @throws \Exception
     */
    public function getList(Request $request)
    {
        $info = $this->testament_repo->allDataTable($request->all());
        $count = $this->testament_repo->countDataTable($request->all());
        $dataTable = Datatables::of($info)->setTotalRecords($count);


        $dataTable->addColumn('user_id', function ($row) {
            return $row->user->name;
        });
        $dataTable->addColumn('testament', function ($row) {
            return $row->item->name;
        });
        $dataTable->addColumn('unit', function ($row) {
            return $row->unit->name;
        });
        $dataTable->addColumn('testament_status', function ($row) {
            $data['testament_status'] = $row->testament_status;

            return view('admin.testaments.parts.testament_status', $data)->render();
        });
        $dataTable->addColumn('actions', function ($row) {
            $data['id'] = $row->id;

            return view('admin.testaments.parts.actions', $data)->render();
        });
        $dataTable->escapeColumns(['*']);
        return $dataTable->make(true);
    }
    ////////////////////////////////

    /**
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function getAdd()
    {
        parent::$data['users'] = User::all();
        parent::$data['items'] = Item::all();
        parent::$data['units'] = Unit::all();
        return view('admin.testaments.add', parent::$data);
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function postAdd(Request $request)
    {
        $quantity = $request->input('quantity');
        $data = [
            'item_id' => $request->input('item'),
            'quantity' => $quantity,
            'unit_id' => $request->input('unit'),
            'user_id' => $request->input('user'),
            'testament_status' => $request->input('testament_status'),
            'description' => $request->input('description'),
            'return_testament_date' => $request->input('testament_status') == 2 ? $request->get('return_testament_date') : null,
        ];
        $validator = Validator::make($data, [
            'item_id' => 'required|exists:items,id',
            'user_id' => 'required|exists:users,id',
            'unit_id' => 'required|exists:units,id',
            'testament_status' => 'required|numeric|in:1,2',
            'quantity' => 'required|numeric|min:1',
            'return_testament_date' => 'nullable|date',
        ]);
        ////////////////////////
        if ($validator->fails()) {
            return $this->generalResponse('false', 400, trans('title.warning'), $validator->messages()->first(), null);
        }

        $item = Item::findOrFail($request->input('item'));

        $data['store_id'] = $item->store_id;

        if ($item->available_quantity < $quantity) {
            return $this->generalResponse('false', 400, trans('title.warning'), "الكمية المدخلة أكبر من الكمية المتاحة لهذا الصنف", null);
        }

        if ($request->get('testament_status') == 2 && $request->get('return_testament_date') === null)
            return $this->generalResponse('false', 400, trans('title.warning'), "يرجى إضافة تاريخ إرجاع لهذه العُهدة أو تغييرها لدائمة", null);

        ///////////////////
        $testament = Testament::where([
            'item_id' => $request->input('item'),
            'user_id' => $request->input('user'),
            'unit_id' => $request->input('unit')
        ])->first();

        if ($testament) {
            $testament->quantity += $quantity;
            if ($item->available_quantity > 0) {
                $item->available_quantity -= $quantity;
                $item->save();
            }
            $testament->save();
            return $this->generalResponse('true', 200, trans('title.success'), trans('messages.added'), $testament);
        }
        $add = $this->testament_repo->store($data);
        if (!$add) {
            return $this->generalResponse('false', 500, trans('title.error'), trans('messages.error'), null);
        }

        if ($item->available_quantity > 0) {
            $item->available_quantity -= $quantity;
            $item->save();
        }

        /////////////////////////////////////
        return $this->generalResponse('true', 200, trans('title.success'), trans('messages.added'), $add);
    }


    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector|\Illuminate\View\View
     */
    public function getEdit(Request $request, $id)
    {
        parent::$data['units'] = Unit::all();
        $info = $this->testament_repo->get($id);
        if (!$info) {
            $request->session()->flash('data', ['title' => trans('title.info'), 'code' => 300, 'message' => trans('messages.not_found')]);
            return redirect(route('admin.testaments.view'));
        }
        parent::$data['info'] = $info;
        return view('admin.testaments.edit', parent::$data);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse|\Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function postEdit(Request $request, $id)
    {
        $info = $this->testament_repo->get($id);
        if (!$info) {
            $request->session()->flash('data', ['title' => trans('title.info'), 'code' => 300, 'message' => trans('messages.not_found')]);
            return redirect(route('admin.testaments.view'));
        }
        $quantity = (int)$request->input("quantity");
        $data = [
            'quantity' => $quantity,
            'unit_id' => $request->input('unit'),
            'testament_status' => $request->input('testament_status'),
            'description' => $request->input('description'),
            'return_testament_date' => $request->input('testament_status') == 2 ? $request->get('return_testament_date') : null,
        ];
        $validator = Validator::make($data, [
            'unit_id' => 'required|exists:units,id',
            'testament_status' => 'required|numeric|in:1,2',
            'quantity' => 'required|numeric|min:1',
            'return_testament_date' => 'nullable|date',
        ]);

        ////////////////////////
        if ($validator->fails()) {
            return $this->generalResponse('false', 400, trans('title.warning'), $validator->messages()->first(), null);
        }
        $item = Item::findOrFail($info->item_id);
        $data['store_id'] = $item->store_id;
        if ($info->quantity != $quantity) {
            if ($item->available_quantity < abs($info->quanitity - $quantity)) {
                return $this->generalResponse('false', 400, trans('title.warning'), "الكمية المدخلة أكبر من الكمية المتاحة لهذا الصنف", null);
            }
        }
        if ($request->get('testament_status') == 2 && $request->get('return_testament_date') === null)
            return $this->generalResponse('false', 400, trans('title.warning'), "يرجى إضافة تاريخ إرجاع لهذه العُهدة أو تغييرها لدائمة", null);
        $update = $this->testament_repo->update($id, $data);

        if (!$update) {
            return $this->generalResponse('false', 500, trans('title.error'), trans('messages.error'), null);
        }
        if ($quantity < $info->quantity) {
            $result = $info->quantity - $quantity;
            $item->available_quantity += abs($result);
            $item->save();
        } elseif ($quantity > $info->quantity) {
            if ($item->available_quantity > 0) {
                $item->available_quantity -= abs($info->quantity - $quantity);
                $item->save();
            }
        }
        //////////////////////////////////////////////
        return $this->generalResponse('true', 200, trans('title.success'), trans('messages.updated'), $update);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector|\Illuminate\View\View
     */
    public function getPersonToPerson(Request $request)
    {
        parent::$data['testaments'] = $this->testament_repo->all();
        parent::$data['users'] = User::all();
        return view('admin.testaments.convert.person_to_person', parent::$data);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse|\Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function postPersonToPerson(Request $request)
    {
        $id = $request->input('testament');
        $info = $this->testament_repo->get($id);
        if (!$info) {
            $request->session()->flash('data', ['title' => trans('title.info'), 'code' => 300, 'message' => trans('messages.not_found')]);
            return redirect(route('admin.testaments.view'));
        }
        $data = [
            'user_id' => $request->input('user'),
            'testament_status' => $request->input('testament_status'),
            'return_testament_date' => $request->input('testament_status') == 2 ? $request->get('return_testament_date') : null,
        ];

        $validator = Validator::make($data, [
            'user_id' => 'required|exists:users,id|not_in:' . $info->user_id,
            'testament_status' => 'required|numeric|in:1,2',
            'return_testament_date' => 'nullable|date',
        ]);


        ////////////////////////
        if ($validator->fails()) {
            return $this->generalResponse('false', 400, trans('title.warning'), $validator->messages()->first(), null);
        }
        if ($request->get('testament_status') == 2 && $request->get('return_testament_date') === null)
            return $this->generalResponse('false', 400, trans('title.warning'), "يرجى إضافة تاريخ إرجاع لهذه العُهدة أو تغييرها لدائمة", null);

        $update = $this->testament_repo->update($id, $data);

        if (!$update) {
            return $this->generalResponse('false', 500, trans('title.error'), trans('messages.error'), null);
        }
        //////////////////////////////////////////////
        return $this->generalResponse('true', 200, trans('title.success'), trans('messages.updated'), $update);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector|\Illuminate\View\View
     */
    public function getPersonToStore(Request $request)
    {
        parent::$data['testaments'] = Testament::all();
        parent::$data['stores'] = Store::all();
        return view('admin.testaments.convert.person_to_store', parent::$data);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse|\Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function postPersonToStore(Request $request)
    {
        $id = $request->input('testament');
        $info = $this->testament_repo->get($id);
        if (!$info) {
            $request->session()->flash('data', ['title' => trans('title.info'), 'code' => 300, 'message' => trans('messages.not_found')]);
            return redirect(route('admin.testaments.view'));
        }
        $data = [
            'store_id' => $request->input('store'),
        ];
        $validator = Validator::make($data, [
            'store_id' => 'required|exists:stores,id',
        ]);

        ////////////////////////
        if ($validator->fails()) {
            return $this->generalResponse('false', 400, trans('title.warning'), $validator->messages()->first(), null);
        }

        $item = Item::findOrFail($info->item_id);
        $delete = $this->testament_repo->delete($id);

        if (!$delete) {
            return $this->generalResponse('false', 500, trans('title.error'), trans('messages.error'), null);
        }
        if ((int)$data['store_id'] === $item->store_id) {
            $item->available_quantity += $info->quantity;
            $item->save();
        } else {
            $item->total_quantity -= $info->quantity;
            $item->save();
            $create = Item::create([
                'name' => $item->name,
                'description' => $item->description,
                'item_number' => $item->item_number,
                'category_id' => $item->category_id,
                'store_id' => $data['store_id'],
                'total_quantity' => $info->quantity,
                'available_quantity' => $info->quantity,
                'item_status' => $item->item_status,
            ]);
            if (!$create) {
                return $this->generalResponse('false', 500, trans('title.error'), trans('messages.error'), null);
            }
        }

        //////////////////////////////////////////////
        return $this->generalResponse('true', 200, trans('title.success'), trans('messages.updated'), null);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector|\Illuminate\View\View
     */
    public function getStoreToStore(Request $request)
    {
        parent::$data['testaments'] = Testament::all();
        parent::$data['stores'] = Store::all();

        return view('admin.testaments.convert.store_to_store', parent::$data);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse|\Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function postStoreToStore(Request $request)
    {
        $id = $request->input('testament');
        $info = $this->testament_repo->get($id);
        if (!$info) {
            $request->session()->flash('data', ['title' => trans('title.info'), 'code' => 300, 'message' => trans('messages.not_found')]);
            return redirect(route('admin.testaments.view'));
        }
        $data = [
            'store_id' => $request->input('store'),
        ];
        $validator = Validator::make($data, [
            'store_id' => 'required|exists:stores,id|different:' . $info->store_id,
        ]);

        ////////////////////////
        if ($validator->fails()) {
            return $this->generalResponse('false', 400, trans('title.warning'), $validator->messages()->first(), null);
        }
        $update = $this->testament_repo->update($id, $data);

        if (!$update) {
            return $this->generalResponse('false', 500, trans('title.error'), trans('messages.error'), null);
        }
        //////////////////////////////////////////////
        return $this->generalResponse('true', 200, trans('title.success'), trans('messages.updated'), $update);

    }

    public function getDelete($id)
    {
        ///////////////////
        $info = $this->testament_repo->get($id);
        if (!$info) {
            return $this->generalResponse('false', 300, trans('title.info'), trans('messages.not_found'), null);
        }
        $delete = $this->testament_repo->delete($id);
        if (!$delete) {
            return $this->generalResponse('false', 500, trans('title.error'), trans('messages.error'), null);
        }
        return $this->generalResponse('true', 200, trans('title.success'), trans('messages.deleted'), null);
    }
    /////////////////////////////////////////

}
