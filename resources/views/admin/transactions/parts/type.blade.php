@if($type == 1)
    <span class="kt-label-font-color-1">مخزن إلى شخص</span>
@elseif($type == 2)
    <span class="kt-label-font-color-2">شخص إلى شخص</span>
@elseif($type == 3)
    <span class="kt-label-font-color-3">شخص إلى مخزن</span>
@elseif($type ==4)
    <span class="kt-label-font-color-4">مخزن إلى مخزن</span>
@endif
