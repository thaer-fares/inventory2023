@if(auth()->user()->can('admin.items.edit')  || auth()->user()->can('admin.items.delete'))
    @can('admin.items.edit')
        <a href="{{ route('admin.items.edit', ['id' => $id]) }}" class="btn btn-outline-success btn-elevate-hover btn-circle btn-icon btn-sm" title="تعديل">
            <i class="la la-edit"></i>
        </a>
    @endcan

    @can('admin.items.delete')
        <a href="javascript:;" data-url="{{ route('admin.items.delete', ['id' => $id]) }}" class="btn btn-outline-danger btn-elevate-hover btn-circle btn-icon btn-sm delete_btn" title="حذف">
            <i class="la la-trash"></i>
        </a>
    @endcan
@endif
