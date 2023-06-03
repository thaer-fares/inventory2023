@if(auth()->user()->can('admin.stores.edit')  || auth()->user()->can('admin.stores.delete'))
    @can('admin.stores.edit')
        <a href="{{ route('admin.stores.edit', ['id' => $id]) }}" class="btn btn-outline-success btn-elevate-hover btn-circle btn-icon btn-sm" title="تعديل">
            <i class="la la-edit"></i>
        </a>
    @endcan
    &nbsp;
    @can('admin.stores.delete')
        <a href="javascript:;" data-url="{{ route('admin.stores.delete', ['id' => $id]) }}" class="btn btn-outline-danger btn-elevate-hover btn-circle btn-icon btn-sm delete_btn" title="حذف">
            <i class="la la-trash"></i>
        </a>
    @endcan
@endif
