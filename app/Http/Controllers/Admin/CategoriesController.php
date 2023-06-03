<?php

namespace App\Http\Controllers\Admin;

use App\Models\Category;
use App\Repositories\Interfaces\CategoryRepositoryInterface;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Yajra\DataTables\Facades\DataTables;

class CategoriesController extends AdminController
{
    /**
     * CategoriesController constructor.
     * @param CategoryRepositoryInterface $category_repo
     */
    public function __construct(CategoryRepositoryInterface $category_repo)
    {
        parent::__construct();
        $this->category_repo = $category_repo;
        parent::$data['active_menu'] = 'categories';
    }

    ////////////////////////////////
    public function getIndex()
    {
        $all_cats = Category::whereNotNull('parent_id')->pluck('parent_id')->toArray();

        $all_cats = array_unique($all_cats);

        parent::$data['parents_categories'] = Category::whereIn('id', $all_cats)->get();

        return view('admin.categories.view', parent::$data);
    }
    ////////////////////////////////

    /**
     * @param Request $request
     * @return mixed
     * @throws \Exception
     */
    public function getList(Request $request)
    {
        $info = $this->category_repo->allDataTable($request->all());
        $count = $this->category_repo->countDataTable($request->all());
        $dataTable = Datatables::of($info)->setTotalRecords($count);


        $dataTable->addColumn('is_active', function ($row) {
            $data['is_active'] = $row->is_active;

            return view('admin.categories.parts.is_active', $data)->render();
        });
        $dataTable->addColumn('name', function ($row) {
            if($row->parent_id == null || $row->parent_id == 0)
                return $row->name;
            else
                return $row->name . " ---------> ".$this->category_repo->get($row->parent_id)->name ;

        });
        $dataTable->addColumn('actions', function ($row) {
            $data['id'] = $row->id;

            return view('admin.categories.parts.actions', $data)->render();
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
        parent::$data['categories'] = Category::all();
        return view('admin.categories.add', parent::$data);
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function postAdd(Request $request)
    {
        $data = [
            'name' => $request->get('name'),
            'parent_id' => $request->get('parent_id'),
            'description' => $request->get('description'),
            'is_active' => $request->get('is_active') == '0' ? false : true,
        ];
        $validator = Validator::make($data, [
            'name' => 'required|unique:categories,name',
            'parent_id' => 'nullable|exists:categories,id',
            'description' => 'required',
            'is_active' => 'boolean',
        ]);
        ////////////////////////
        if ($validator->fails()) {
            return $this->generalResponse('false', 400, trans('title.warning'), $validator->messages()->first(), null);
        }
        ///////////////////
        $add = $this->category_repo->store($request->all());
        if (!$add) {
            return $this->generalResponse('false', 500, trans('title.error'), trans('messages.error'), null);
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
        parent::$data['categories'] = Category::all();
        $info = $this->category_repo->get($id);
        if (!$info) {
            $request->session()->flash('data', ['title' => trans('title.info'), 'code' => 300, 'message' => trans('messages.not_found')]);
            return redirect(route('admin.categories.view'));
        }
        parent::$data['info'] = $info;
        return view('admin.categories.edit', parent::$data);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse|\Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function postEdit(Request $request, $id)
    {
        $info = $this->category_repo->get($id);
        if (!$info) {
            $request->session()->flash('data', ['title' => trans('title.info'), 'code' => 300, 'message' => trans('messages.not_found')]);
            return redirect(route('admin.categories.view'));
        }
        $data = [
            'name' => $request->get('name'),
            'parent_id' => $request->get('parent_id'),
            'description' => $request->get('description'),
            'is_active' => $request->get('is_active') == '0' ? false : true,
        ];
        $validator = Validator::make($data, [
            'name' => 'required|unique:categories,name,'.$id,
            'parent_id' => 'nullable|exists:categories,id|not_in:'.$id,
            'description' => 'required',
            'is_active' => 'boolean',
        ]);

        ////////////////////////
        if ($validator->fails()) {
            return $this->generalResponse('false', 400, trans('title.warning'), $validator->messages()->first(), null);
        }
        $update = $this->category_repo->update($id, $data);
        if (!$update) {
            return $this->generalResponse('false', 500, trans('title.error'), trans('messages.error'), null);
        }
        //////////////////////////////////////////////
        return $this->generalResponse('true', 200, trans('title.success'), trans('messages.updated'), $update);
    }

    public function getDelete($id)
    {
        ///////////////////
        $info = $this->category_repo->get($id);
        if (!$info) {
            return $this->generalResponse('false', 300, trans('title.info'), trans('messages.not_found'), null);
        }
        $delete = $this->category_repo->delete($id);
        if (!$delete) {
            return $this->generalResponse('false', 500, trans('title.error'), trans('messages.error'), null);
        }
        return $this->generalResponse('true', 200, trans('title.success'), trans('messages.deleted'), null);
    }
    /////////////////////////////////////////

}
