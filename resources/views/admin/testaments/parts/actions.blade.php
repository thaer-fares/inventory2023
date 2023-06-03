@if(auth()->user()->can('admin.testaments.edit')  || auth()->user()->can('admin.testaments.delete'))
    @can('admin.testaments.edit')
        <a href="{{ route('admin.testaments.edit', ['id' => $id]) }}" class="btn btn-outline-success btn-elevate-hover btn-circle btn-icon btn-sm" title="تعديل">
            <i class="la la-edit"></i>
        </a>
    @endcan

    @can('admin.testaments.delete')
        <a href="javascript:;" data-url="{{ route('admin.testaments.delete', ['id' => $id]) }}" class="btn btn-outline-danger btn-elevate-hover btn-circle btn-icon btn-sm delete_btn" title="حذف">
            <i class="la la-trash"></i>
        </a>
    @endcan
@endif
