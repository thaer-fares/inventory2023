@if(auth()->user()->can('admin.vendors.edit')  || auth()->user()->can('admin.vendors.delete'))
    @can('admin.vendors.edit')
        <a href="{{ route('admin.vendors.edit', ['id' => $id]) }}" class="btn btn-outline-success btn-elevate-hover btn-circle btn-icon btn-sm" title="تعديل">
            <i class="la la-edit"></i>
        </a>
    @endcan
    &nbsp
    @can('admin.vendors.delete')
        <a href="javascript:;" data-url="{{ route('admin.vendors.delete', ['id' => $id]) }}" class="btn btn-outline-danger btn-elevate-hover btn-circle btn-icon btn-sm delete_btn" title="حذف">
            <i class="la la-trash"></i>
        </a>
    @endcan
@endif
