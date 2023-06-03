<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Store;
use App\Repositories\Interfaces\StoreRepositoryInterface;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Validator;
use Yajra\DataTables\Facades\DataTables;

class StoresController extends AdminController
{
    /**
     * StoresController constructor.
     * @param StoreRepositoryInterface $store_repo
     */
    public function __construct(StoreRepositoryInterface $store_repo)
    {
        parent::__construct();
        $this->store_repo = $store_repo;
        parent::$data['active_menu'] = 'stores';
    }
    ////////////////////////////////
    public function getIndex()
    {
        return view('admin.stores.view', parent::$data);
    }
    ////////////////////////////////
    /**
     * @param Request $request
     * @return mixed
     * @throws \Exception
     */
    public function getList(Request $request)
    {
        $info = $this->store_repo->allDataTable($request->all());
        $count =  $this->store_repo->countDataTable($request->all());
        $dataTable = Datatables::of($info)->setTotalRecords($count);

        $dataTable->addColumn('actions', function ($row)
        {
            $data['id'] = $row->id;

            return view('admin.stores.parts.actions', $data)->render();
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
        parent::$data['stores'] = Store::all();
        return view('admin.stores.add', parent::$data);
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function postAdd(Request $request)
    {
        $data = [
            'name' => $request->get('name'),
            'store_number' => $request->get('store_number'),
        ];
        $validator = Validator::make($data,[
            'name' => 'required',
            'store_number' => 'required|unique:stores,store_number',
        ]);
        ////////////////////////
        if ($validator->fails())
        {
            return $this->generalResponse('false',400, trans('title.warning'), $validator->messages()->first(),null);
        }
        ///////////////////
        $add = $this->store_repo->store($request->all());
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
        $info = $this->store_repo->get($id);
        if (!$info)
        {
            $request->session()->flash('data', ['title' => trans('title.info'),  'code' => 300, 'message' => trans('messages.not_found')]);
            return redirect(route('admin.stores.view'));
        }
        parent::$data['info'] = $info;
        return view('admin.stores.edit', parent::$data);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse|\Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function postEdit(Request $request, $id)
    {
        $info = $this->store_repo->get($id);
        if (!$info)
        {
            $request->session()->flash('data', ['title' => trans('title.info'),  'code' => 300, 'message' => trans('messages.not_found')]);
            return redirect(route('admin.stores.view'));
        }

        $data = [
            'name' => $request->get('name'),
            'store_number' => $request->get('store_number'),
        ];
        $validator = Validator::make($data,[
            'name' => 'required',
            'store_number' => 'required|unique:stores,store_number,'.$id,
        ]);
        ////////////////////////
        if ($validator->fails())
        {
            return $this->generalResponse('false',400, trans('title.warning'), $validator->messages()->first(),null);
        }
        $update = $this->store_repo->update($id, $data);
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
        $info = $this->store_repo->get($id);
        if (!$info)
        {
            return $this->generalResponse('false',300, trans('title.info'), trans('messages.not_found'),null);
        }
        $delete = $this->store_repo->delete($id);
        if (!$delete)
        {
            return $this->generalResponse('false',500, trans('title.error'), trans('messages.error'),null);
        }
        return $this->generalResponse('true',200, trans('title.success'), trans('messages.deleted'),null);
    }
    /////////////////////////////////////////

}
