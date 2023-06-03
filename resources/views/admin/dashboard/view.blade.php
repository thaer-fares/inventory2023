@extends('admin.layout.master')

@section('title')
    الرئيسية
@stop

@section('css')
    <style>
        .card-scroll {
            max-height: 150px;
            overflow: auto;
        }

        ::-webkit-scrollbar {
            display: none;
        }
    </style>
@stop

@section('subheader')

@stop


@section('content')
    @php
        $notifications = $user->notifications->where('opened',0);
        $testaments = $user->testaments;
    @endphp
    <div class="row mb-3">
        <div class="col-md-6">
            <!--begin::Stats Widget 29-->
            <div class="card card-custom kt-bg-primary text-white card-stretch gutter-b"
                 style="background-position: right top; background-size: 30% auto; background-image: url('assets/media/svg/shapes/abstract-1.svg')">
                <!--begin::Body-->
                <div class="card-body">
                        <span class="svg-icon svg-icon-2x svg-icon-info">
                            <!--begin::Svg Icon | path:assets/media/svg/icons/Communication/Mail-opened.svg-->
                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                                 width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                    <rect x="0" y="0" width="24" height="24"></rect>
                                    <path
                                        d="M6,2 L18,2 C18.5522847,2 19,2.44771525 19,3 L19,12 C19,12.5522847 18.5522847,13 18,13 L6,13 C5.44771525,13 5,12.5522847 5,12 L5,3 C5,2.44771525 5.44771525,2 6,2 Z M7.5,5 C7.22385763,5 7,5.22385763 7,5.5 C7,5.77614237 7.22385763,6 7.5,6 L13.5,6 C13.7761424,6 14,5.77614237 14,5.5 C14,5.22385763 13.7761424,5 13.5,5 L7.5,5 Z M7.5,7 C7.22385763,7 7,7.22385763 7,7.5 C7,7.77614237 7.22385763,8 7.5,8 L10.5,8 C10.7761424,8 11,7.77614237 11,7.5 C11,7.22385763 10.7761424,7 10.5,7 L7.5,7 Z"
                                        fill="#000000" opacity="0.3"></path>
                                    <path
                                        d="M3.79274528,6.57253826 L12,12.5 L20.2072547,6.57253826 C20.4311176,6.4108595 20.7436609,6.46126971 20.9053396,6.68513259 C20.9668779,6.77033951 21,6.87277228 21,6.97787787 L21,17 C21,18.1045695 20.1045695,19 19,19 L5,19 C3.8954305,19 3,18.1045695 3,17 L3,6.97787787 C3,6.70173549 3.22385763,6.47787787 3.5,6.47787787 C3.60510559,6.47787787 3.70753836,6.51099993 3.79274528,6.57253826 Z"
                                        fill="#000000"></path>
                                </g>
                            </svg>
                            <!--end::Svg Icon-->
                        </span>
                    <span class="font-weight-bold text-white font-size-sm">العُهد</span>
                    <span
                        class="card-title font-weight-bolder text-dark-75 font-size-h2 my-6 d-block">{{ count($testaments) }}</span>
                </div>
                <!--end::Body-->
            </div>
            <!--end::Stats Widget 29-->
        </div>
        <div class="col-md-6">
            <!--begin::Stats Widget 30-->
            <div class="card card-custom kt-bg-dark card-stretch gutter-b">
                <!--begin::Body-->
                <div class="card-body">
                    <span class="svg-icon svg-icon-primary svg-icon-2x"><!--begin::Svg Icon | path:C:\wamp64\www\keenthemes\legacy\metronic\theme\html\demo1\dist/../src/media/svg/icons\General\Notifications1.svg--><svg
                            xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
                            height="24px" viewBox="0 0 24 24" version="1.1">
    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
        <path
            d="M17,12 L18.5,12 C19.3284271,12 20,12.6715729 20,13.5 C20,14.3284271 19.3284271,15 18.5,15 L5.5,15 C4.67157288,15 4,14.3284271 4,13.5 C4,12.6715729 4.67157288,12 5.5,12 L7,12 L7.5582739,6.97553494 C7.80974924,4.71225688 9.72279394,3 12,3 C14.2772061,3 16.1902508,4.71225688 16.4417261,6.97553494 L17,12 Z"
            fill="#000000"/>
        <rect fill="#000000" opacity="0.3" x="10" y="16" width="4" height="4" rx="2"/>
    </g>
</svg><!--end::Svg Icon--></span>
                    <span class="font-weight-bold text-white font-size-sm">الإشعارات</span>

                    <span
                        class="card-title font-weight-bolder text-white font-size-h2 my-6 d-block">{{ count($notifications)  }}</span>
                </div>
                <!--end::Body-->
            </div>
            <!--end::Stats Widget 30-->
        </div>
    </div>
    <div class="row mb-3">
        <div class="col-md-6">
            <div class="card card-custom" data-card="true" id="kt_card_1">
                <div class="card-header">
                    <div class="card-title">
                        <h3 class="card-label">العُهد</h3>
                    </div>
                    <div class="card-toolbar">
                        <a href="#" class="btn btn-icon btn-sm btn-hover-info card-collapse"
                        >
                            <i class="fa fa-angle-down kt-font-lg"></i>
                        </a>
                    </div>
                </div>
                <div class="card-body">
                    @if(count($testaments))
                        <div class="card-scroll">
                            @foreach($testaments as $testament)
                                <div class=" alert alert-info mb-3 d-flex justify-content-between">
                                                <span
                                                    class="d-inline-block font-weight-bold font-size-sm">{{ $testament->item->name }}</span>
                                    <span
                                        class="d-inline-block font-weight-bold font-size-sm">{{ $testament->unit->name }}: {{ $testament->quantity }}</span>
                                </div>
                            @endforeach

                        </div>
                    @else
                        <div class="text-center"> لا يوجد عُهد على ذمتك</div>
                    @endif
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card card-custom" data-card="true" id="kt_card_1">
                <div class="card-header">
                    <div class="card-title">
                        <h3 class="card-label">الإشعارات</h3>
                    </div>
                    <div class="card-toolbar">
                        <a href="#" class="btn btn-icon btn-sm btn-hover-dark card-collapse">
                            <i class="fa fa-angle-down kt-font-lg"></i>
                        </a>
                    </div>
                </div>
                <div class="card-body">
                    @if(count($notifications))
                        <div class="card-scroll">
                            @foreach($notifications as $note)
                                <div class="card bg-secondary py-2">
                                    <!--begin::Body-->
                                    <a href="{{ $note->url }}" class="card-body py-2 text-dark">
                                        <span class="font-weight-bold font-size-sm">{{ $note->body }}</span>
                                        <div class="d-flex justify-content-end">
                                            <span
                                                class="card-title text-muted kt-font-sm d-block">{{ $note->created_at->diffForHumans() }}</span>
                                        </div>
                                    </a>
                                </div>
                            @endforeach
                        </div>
                    @else
                        <div class="text-center"> لا توجد إشعارات جديدة</div>
                    @endif
                    <!--end::Body-->
                </div>
                @if(count($notifications))
                    <div class="card-footer">
                        <a href="{{ route('admin.notifications.readAll') }}" class="d-block text-muted text-center">تعيين
                            الكل كمقروء</a>
                    </div>
                @endif
            </div>
        </div>
    </div>
@stop

@section('js')
    <script type="text/javascript">
        $(".card-collapse").on('click', function (e) {
            e.preventDefault();
            $(this).toggleClass('closed');
            const cardBody = $(this).parents('.card').find('.card-body').first();
            const cardFooter = $(this).parents('.card').find('.card-footer').first();
            const icon = $(this).find('i').first();
            if ($(this).hasClass('closed')) {
                icon.css({'transform': 'rotate(180deg)', 'transition': 'transform 0.5s ease'});
            } else {
                icon.css({'transform': 'rotate(0deg)', 'transition': 'transform 0.5s ease'});
            }
            cardBody.slideToggle();
            cardFooter.slideToggle();

        });
    </script>
@stop
