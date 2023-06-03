@if(auth()->user()->can('admin.categories.edit')  || auth()->user()->can('admin.categories.delete'))
    @can('admin.categories.edit')
        <a href="{{ route('admin.categories.edit', ['id' => $id]) }}" class="btn btn-outline-success btn-elevate-hover btn-circle btn-icon btn-sm" title="تعديل">
            <i class="la la-edit"></i>
        </a>
    @endcan

    @can('admin.categories.delete')
        <a href="javascript:;" data-url="{{ route('admin.categories.delete', ['id' => $id]) }}" class="btn btn-outline-danger btn-elevate-hover btn-circle btn-icon btn-sm delete_btn" title="حذف">
            <i class="la la-trash"></i>
        </a>
    @endcan
@endif
