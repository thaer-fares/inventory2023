@extends('admin.layout.master')

@section('title')
    تحويل العُهدة من شخص لشخص
@stop

@section('css')

@stop

@section('subheader')
    <div class="kt-subheader   kt-grid__item" id="kt_subheader">
        <div class="kt-container  kt-container--fluid ">
            <div class="kt-subheader__main">
                <h3 class="kt-subheader__title">
                    وزارة الأوقاف والشؤون الدينية </h3>
                <span class="kt-subheader__separator kt-hidden"></span>
                <div class="kt-subheader__breadcrumbs">
                    <a href="{{ route('admin.dashboard.view') }}" class="kt-subheader__breadcrumbs-home"><i
                            class="flaticon2-shelter"></i></a>
                    <span class="kt-subheader__breadcrumbs-separator"></span>
                    <a href="{{ route('admin.dashboard.view') }}" class="kt-subheader__breadcrumbs-link">
                        الرئيسية
                    </a>
                    <span class="kt-subheader__breadcrumbs-separator"></span>
                    <a href="{{ route('admin.testaments.view') }}" class="kt-subheader__breadcrumbs-link">
                        العُهد
                    </a>
                    <span class="kt-subheader__breadcrumbs-separator"></span>
                    <a href="{{ route('admin.testaments.convert.person_to_person') }}"
                       class="kt-subheader__breadcrumbs-link">
                        تحويل العُهدة من شخص لشخص
                    </a>
                </div>
            </div>
        </div>
    </div>
@stop


@section('content')
    <!-- begin:: Content -->
    <div class="row">
        <div class="col-lg-12">
            <!--begin::Portlet-->
            <div class="kt-portlet">
                <div class="kt-portlet__head">
                    <div class="kt-portlet__head-label">
                        <h3 class="kt-portlet__head-title">
                            تحويل العُهدة من شخص لشخص
                        </h3>
                    </div>
                </div>
                <!--begin::Form-->
                <form class="kt-form kt-form--label-right" id="frmEdit" method="post"
                      action="{{ route('admin.testaments.convert.person_to_person') }}">

                    <div class="kt-portlet__body">
                        <div class="form-group row">
                            <div class="col-lg-6">
                                <label>العُهدة :</label>
                                <select class="form-control kt-selectpicker" name="testament" data-live-search="true">
                                    @foreach($testaments as $testament)
                                        <option value="{{$testament->id}}">{{$testament->item->name}} | {{ $testament->unit->name }} | {{ $testament->quantity }} - {{ $testament->user->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-lg-6">
                                <label>الموظف :</label>
                                <select class="form-control kt-selectpicker" name="user" data-live-search="true">
                                    @foreach($users as $user)
                                        <option value="{{$user->id}}">{{ $user->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-lg-6">
                                <label>الحالة :</label>
                                <select class="form-control kt-selectpicker" name="testament_status" >
                                    <option value="1">دائمة</option>
                                    <option value="2">مؤقتة</option>
                                </select>
                            </div>
                            <div class="col-lg-6">
                                <label>تاريخ الإرجاع :</label>
                                <input type="text" class="form-control" name="return_testament_date" readonly="readonly" placeholder="يرجى إضافة تاريخ الإرجاع في حال كانت العُهدة مؤقتة" id="kt_datepicker_3">
                            </div>
                        </div>
                        <div class="kt-portlet__foot">
                            <div class="kt-form__actions">
                                <div class="row">
                                    <div class="col-lg-6 kt-align-right">
                                        <button type="submit" class="btn btn-brand save">حفظ</button>
                                        <a href="{{ route('admin.testaments.view') }}"
                                           class="btn btn-secondary">الغاء</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
                <!--end::Form-->
            </div>
            <!--end::Portlet-->
        </div>
    </div>
    <!-- End:: Content -->
@stop

@section('js')
    <script src="assets/admin/general/js/scripts/testaments.js" type="text/javascript"></script>
@stop
