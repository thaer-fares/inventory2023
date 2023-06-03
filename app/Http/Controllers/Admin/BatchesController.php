<?php

namespace App\Http\Controllers\Admin;

use App\Models\Batch;
use App\Models\Testament;
use App\Repositories\Interfaces\BatchRepositoryInterface;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Yajra\DataTables\Facades\DataTables;

class BatchesController extends AdminController
{
    /**
     * BatchesController constructor.
     * @param BatchRepositoryInterface $batch_repo
     */
    public function __construct(BatchRepositoryInterface $batch_repo)
    {
        parent::__construct();
        $this->batch_repo = $batch_repo;
        parent::$data['active_menu'] = 'batches';
    }

    ////////////////////////////////
    public function getIndex()
    {
        return view('admin.batches.view', parent::$data);
    }
    ////////////////////////////////

    /**
     * @param Request $request
     * @return mixed
     * @throws \Exception
     */
    public function getList(Request $request)
    {
        $info = $this->batch_repo->allDataTable($request->all());
        $count = $this->batch_repo->countDataTable($request->all());
        $dataTable = Datatables::of($info)->setTotalRecords($count);


        $dataTable->addColumn('is_active', function ($row) {
            $data['is_active'] = $row->is_active;

            return view('admin.batches.parts.is_active', $data)->render();
        });
        $dataTable->addColumn('actions', function ($row) {
            $data['id'] = $row->id;

            return view('admin.batches.parts.actions', $data)->render();
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
        parent::$data['info'] = null;
        parent::$data['batches'] = Batch::all();
        return view('admin.batches.add', parent::$data);
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function postAdd(Request $request)
    {
        $data = [
            'name' => $request->get('name'),
            'receive_date' => $request->get('receive_date'),
        ];
        $validator = Validator::make($data, [
//            'name' => 'required|unique:batches,name',
//            'parent_id' => 'nullable|exists:batches,id',
//            'description' => 'required',
//            'is_active' => 'boolean',
        ]);
        ////////////////////////
        if ($validator->fails()) {
            return $this->generalResponse('false', 400, trans('title.warning'), $validator->messages()->first(), null);
        }
        ///////////////////
        $testament_number = $request->testament_number;
        $item_id = $request->item_id;
        $description = $request->description;
        $item_quantity = $request->item_quantity;
        $unit_id = $request->unit_id;
        $testament_status = $request->testament_status;
        $return_testament_date = $request->return_testament_date;


        try {
            DB::beginTransaction();

            $add = $this->batch_repo->store($request->all());

            $testaments = $request->only('testaments_repeater');

            foreach ($testaments as $testament) {
                $testament->testaments()->create([
                    'testament_number' => $testament['testament_number'],
                    'batch_id' => $add->id,
                    'item_id' => $testament['item_id'],
                    'description' => $testament['description'],
                    'item_quantity' => $testament['item_quantity'],
                    'unit_id' => $testament['unit_id'],
                    'testament_status' => $testament['testament_status'],
                    'return_testament_date' => $testament['return_testament_date'],
                ]);
            }
            DB::commit();

            return $this->generalResponse('true', 200, trans('title.success'), trans('messages.added'), $add);
        } catch (\Exception $e) {
            DB::rollBack();

            return $e;
//            return $this->generalResponse('false', 500, trans('title.error'), trans('messages.error'), null);
        }
    }


    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector|\Illuminate\View\View
     */
    public function getEdit(Request $request, $id)
    {
        parent::$data['batches'] = Batch::all();
        $info = $this->batch_repo->get($id);
        if (!$info) {
            $request->session()->flash('data', ['title' => trans('title.info'), 'code' => 300, 'message' => trans('messages.not_found')]);
            return redirect(route('admin.batches.view'));
        }
        parent::$data['info'] = $info;
        return view('admin.batches.edit', parent::$data);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse|\Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function postEdit(Request $request, $id)
    {
        $info = $this->batch_repo->get($id);
        if (!$info) {
            $request->session()->flash('data', ['title' => trans('title.info'), 'code' => 300, 'message' => trans('messages.not_found')]);
            return redirect(route('admin.batches.view'));
        }
        $data = [
            'name' => $request->get('name'),
            'parent_id' => $request->get('parent_id'),
            'description' => $request->get('description'),
            'is_active' => $request->get('is_active') == '0' ? false : true,
        ];
        $validator = Validator::make($data, [
            'name' => 'required|unique:batches,name,' . $id,
            'parent_id' => 'nullable|exists:batches,id|not_in:' . $id,
            'description' => 'required',
            'is_active' => 'boolean',
        ]);

        ////////////////////////
        if ($validator->fails()) {
            return $this->generalResponse('false', 400, trans('title.warning'), $validator->messages()->first(), null);
        }
        $update = $this->batch_repo->update($id, $data);
        if (!$update) {
            return $this->generalResponse('false', 500, trans('title.error'), trans('messages.error'), null);
        }
        //////////////////////////////////////////////
        return $this->generalResponse('true', 200, trans('title.success'), trans('messages.updated'), $update);
    }

    public function getDelete($id)
    {
        ///////////////////
        $info = $this->batch_repo->get($id);
        if (!$info) {
            return $this->generalResponse('false', 300, trans('title.info'), trans('messages.not_found'), null);
        }
        $delete = $this->batch_repo->delete($id);
        if (!$delete) {
            return $this->generalResponse('false', 500, trans('title.error'), trans('messages.error'), null);
        }
        return $this->generalResponse('true', 200, trans('title.success'), trans('messages.deleted'), null);
    }
    /////////////////////////////////////////

}
