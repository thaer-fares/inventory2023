<?php

namespace App\Http\Controllers\Admin;

use App\Models\Batch;
use App\Models\Category;
use App\Models\Item;
use App\Models\Store;
use App\Repositories\Interfaces\ItemRepositoryInterface;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Yajra\DataTables\Facades\DataTables;

class ItemsController extends AdminController
{
    /**
     * ItemsController constructor.
     * @param ItemRepositoryInterface $item_repo
     */
    public function __construct(ItemRepositoryInterface $item_repo)
    {
        parent::__construct();
        $this->item_repo = $item_repo;
        parent::$data['active_menu'] = 'items';
    }

    ////////////////////////////////
    public function getIndex()
    {
        parent::$data['categories'] = Category::all();
        parent::$data['stores'] = Store::all();

        return view('admin.items.view', parent::$data);
    }
    ////////////////////////////////

    /**
     * @param Request $request
     * @return mixed
     * @throws \Exception
     */
    public function getList(Request $request)
    {
        $info = $this->item_repo->allDataTable($request->all());
        $count = $this->item_repo->countDataTable($request->all());
        $dataTable = Datatables::of($info)->setTotalRecords($count);


        $dataTable->addColumn('category', function ($row) {
            return $row->category_id ? $row->category->get()->first()->name : "<span class='text-warning'>هذا الصنف غير مصنف</span>";
        });
        $dataTable->addColumn('item_status', function ($row) {
            $data['item_status'] = $row->item_status;

            return view('admin.items.parts.item_status', $data)->render();
        });
        $dataTable->addColumn('actions', function ($row) {
            $data['id'] = $row->id;

            return view('admin.items.parts.actions', $data)->render();
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
        parent::$data['categories'] = Category::all();
        return view('admin.items.add', parent::$data);
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function postAdd(Request $request)
    {

        $data = [
            'name' => $request->input('name'),
            'item_number' => $request->input('category') + 1000,
            'category_id' => $request->input('category'),
            'description' => $request->input('description'),
            'store_id' => 1,
            'total_quantity' => $request->input('total_quantity'),
            'available_quantity' => $request->input('total_quantity'),
            'item_status' => 1,
        ];
        $validator = Validator::make($data, [
            'name' => 'required|unique:items,name',
            'item_number' => 'required|numeric|unique:items,item_number',
            'store_id' => 'required|exists:stores,id',
            'total_quantity' => 'required|numeric',
            'item_status' => 'required|numeric|in:[0,1,2,3,4]',
        ]);
        ////////////////////////
        if ($validator->fails()) {
            return $this->generalResponse('false', 400, trans('title.warning'), $validator->messages()->first(), null);
        }
        ///////////////////
        $add = $this->item_repo->store($data);
        if (!$add) {
            return $this->generalResponse('false', 500, trans('title.error'), trans('messages.error'), null);
        }
        /////////////////////////////////////
        return $this->generalResponse('true', 200, trans('title.success'), trans('messages.added'), $add);
    }
////////////////////////////////

    /**
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function getAddItems()
    {
        parent::$data['info'] = null;
        parent::$data['items'] = Item::all();
        parent::$data['categories'] = Category::all();
        return view('admin.items.addItems', parent::$data);
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function postAddItems(Request $request)
    {
        $items = $request->get('items');
        $batch = new Batch();
        $all_data = array();
        $today = Carbon::now();
        foreach ($items as $key => $item):
            $itemData = Item::findOrFail($item['item']);
            $quantity = !empty($item['quantity']) ? (int)$item['quantity'] : 0;
            $itemData->total_quantity += $quantity;
            $itemData->available_quantity += $quantity;
            $itemData->save();
           $all_data[] = [
                        'item_id'=>$itemData->id,
                        'quantity'=>$quantity,
                        'receive_date'=>$today,
           ];
            ////////////////////////
        endforeach;
        if (count($all_data) === 0) return $this->generalResponse('false', 500, trans('title.error'), trans('messages.error'), null);
        $add = $batch->insert($all_data);
        if (!$add) return $this->generalResponse('false', 500, trans('title.error'), trans('messages.error'), null);

        /////////////////////////////////////
        return $this->generalResponse('true', 200, trans('title.success'), trans('messages.added'), $all_data);
    }


    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector|\Illuminate\View\View
     */
    public function getEdit(Request $request, $id)
    {
        $info = $this->item_repo->get($id);
        parent::$data['categories'] = Category::all();
        parent::$data['stores'] = Store::all();
        if (!$info) {
            $request->session()->flash('data', ['title' => trans('title.info'), 'code' => 300, 'message' => trans('messages.not_found')]);
            return redirect(route('admin.items.view'));
        }
        parent::$data['info'] = $info;
        return view('admin.items.edit', parent::$data);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse|\Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function postEdit(Request $request, $id)
    {
        $info = $this->item_repo->get($id);
        if (!$info) {
            $request->session()->flash('data', ['title' => trans('title.info'), 'code' => 300, 'message' => trans('messages.not_found')]);
            return redirect(route('admin.items.view'));
        }
        $quantity = (int)$request->input('total_quantity');
        $data = [
            'name' => $request->input('name'),
            'description' => $request->input('description'),
            'item_number' => $request->input('item_number'),
            'category_id' => $request->input('category_id'),
            'store_id' => $request->input('store_id'),
            'total_quantity' => $quantity,
            'item_status' => $request->input('item_status'),
        ];
        $validator = Validator::make($data, [
            'name' => 'required',
            'item_number' => 'required|numeric|unique:items,item_number,' . $id,
            'category_id' => 'nullable|exists:categories,id',
            'store_id' => 'required|exists:stores,id',
            'total_quantity' => 'required|numeric',
            'item_status' => 'required|numeric|in:[0,1,2,3,4]',
        ]);
        ////////////////////////
        if ($validator->fails()) {
            return $this->generalResponse('false', 400, trans('title.warning'), $validator->messages()->first(), null);
        }
        if ($quantity < (int)$info->total_quantity) {
            $result = (int)$info->total_quantity - $quantity;
            $data['available_quantity'] = (int)$info->available_quantity - $result;
        }
        if ($quantity > (int)$info->total_quantity) {
            $result = $quantity - (int)$info->total_quantity;
            $data['available_quantity'] = (int)$info->available_quantity + $result;
        }
        $update = $this->item_repo->update($id, $data);
        if (!$update) {
            return $this->generalResponse('false', 500, trans('title.error'), trans('messages.error'), null);
        }
        //////////////////////////////////////////////
        return $this->generalResponse('true', 200, trans('title.success'), trans('messages.updated'), $update);
    }

    public function getDelete($id)
    {
        ///////////////////
        $info = $this->item_repo->get($id);
        if (!$info) {
            return $this->generalResponse('false', 300, trans('title.info'), trans('messages.not_found'), null);
        }
        $delete = $this->item_repo->delete($id);
        if (!$delete) {
            return $this->generalResponse('false', 500, trans('title.error'), trans('messages.error'), null);
        }
        return $this->generalResponse('true', 200, trans('title.success'), trans('messages.deleted'), null);
    }
    /////////////////////////////////////////

}
