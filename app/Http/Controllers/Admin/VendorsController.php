<?php

namespace App\Http\Controllers\Admin;

use App\Models\Vendor;
use App\Repositories\Interfaces\VendorRepositoryInterface;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Yajra\DataTables\Facades\DataTables;

class VendorsController extends AdminController
{
    /**
     * vendorsController constructor.
     * @param VendorRepositoryInterface $vendor_repo
     */
    public function __construct(VendorRepositoryInterface $vendor_repo)
    {
        parent::__construct();
        $this->vendor_repo = $vendor_repo;
        parent::$data['active_menu'] = 'vendors';
    }
    ////////////////////////////////
    public function getIndex()
    {
        return view('admin.vendors.view', parent::$data);
    }
    ////////////////////////////////
    /**
     * @param Request $request
     * @return mixed
     * @throws \Exception
     */
    public function getList(Request $request)
    {
        $info = $this->vendor_repo->allDataTable($request->all());
        $count =  $this->vendor_repo->countDataTable($request->all());
        $dataTable = Datatables::of($info)->setTotalRecords($count);


        $dataTable->addColumn('actions', function ($row)
        {
            $data['id'] = $row->id;

            return view('admin.vendors.parts.actions', $data)->render();
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
        parent::$data['vendors'] = Vendor::all();
        return view('admin.vendors.add', parent::$data);
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function postAdd(Request $request)
    {
        $data = [
            'name' => $request->get('name'),
            'vendor_number' => $request->get('vendor_number'),
        ];
        $validator = Validator::make($data,[
            'name' => 'required',
            'vendor_number' => 'required|unique:vendors,vendor_number',
        ]);
        ////////////////////////
        if ($validator->fails())
        {
            return $this->generalResponse('false',400, trans('title.warning'), $validator->messages()->first(),null);
        }
        ///////////////////
        $add = $this->vendor_repo->store($request->all());
        if (!$add)
        {
            return $this->generalResponse('false',500, trans('title.error'), trans('messages.error'),null);
        }
        /////////////////////////////////////
        return $this->generalResponse('true',200, trans('title.success'), trans('messages.added'),$add);
    }


    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector|\Illuminate\View\View
     */
    public function getEdit(Request $request, $id)
    {
        $info = $this->vendor_repo->get($id);
        if (!$info)
        {
            $request->session()->flash('data', ['title' => trans('title.info'),  'code' => 300, 'message' => trans('messages.not_found')]);
            return redirect(route('admin.vendors.view'));
        }
        parent::$data['info'] = $info;
        return view('admin.vendors.edit', parent::$data);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse|\Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function postEdit(Request $request, $id)
    {
        $info = $this->vendor_repo->get($id);
        if (!$info)
        {
            $request->session()->flash('data', ['title' => trans('title.info'),  'code' => 300, 'message' => trans('messages.not_found')]);
            return redirect(route('admin.vendors.view'));
        }

        $data = [
            'name' => $request->get('name'),
            'vendor_number' => $request->get('vendor_number'),
        ];
        $validator = Validator::make($data,[
            'name' => 'required',
            'vendor_number' => 'required|unique:vendors,vendor_number,'.$id,
        ]);
        ////////////////////////
        if ($validator->fails())
        {
            return $this->generalResponse('false',400, trans('title.warning'), $validator->messages()->first(),null);
        }
        $update = $this->vendor_repo->update($id, $data);
        if (!$update)
        {
            return $this->generalResponse('false',500, trans('title.error'), trans('messages.error'),null);
        }
        //////////////////////////////////////////////
        return $this->generalResponse('true',200, trans('title.success'), trans('messages.updated'),$update);
    }

    public function getDelete($id)
    {
        ///////////////////
        $info = $this->vendor_repo->get($id);
        if (!$info)
        {
            return $this->generalResponse('false',300, trans('title.info'), trans('messages.not_found'),null);
        }
        $delete = $this->vendor_repo->delete($id);
        if (!$delete)
        {
            return $this->generalResponse('false',500, trans('title.error'), trans('messages.error'),null);
        }
        return $this->generalResponse('true',200, trans('title.success'), trans('messages.deleted'),null);
    }
    /////////////////////////////////////////

}
