@if($item_status == 1)
    <span class="btn-sm btn btn-label-success">ممتاز</span>
@elseif($item_status == 2)
    <span class="btn-sm btn btn-label-warning">متوسط</span>
@elseif($item_status == 3)
    <span class="btn-sm btn btn-label-danger">رديئ</span>
@endif
