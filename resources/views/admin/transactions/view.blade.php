@extends('admin.layout.master')

@section('title')
    الرئيسية
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
                        الرئيسية </a>
                    <span class="kt-subheader__breadcrumbs-separator"></span>
                    <a href="{{ route('admin.testaments.view') }}" class="kt-subheader__breadcrumbs-link">
                        سجلات العُهد </a>
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
                            البحث
                        </h3>
                    </div>
                </div>
                <!--begin::Form-->
                <form class="kt-form kt-form--label-right">
                    <div class="kt-portlet__body">
                        <div class="form-group row">
                            <div class="col-lg-3">
                                <select class="form-control searchable kt-selectpicker" id="item" data-live-search="true">
                                    <option value>الصنف</option>
                                    @foreach($items as $item)
                                        <option value="{{ $item->id }}">{{ $item->name }}</option>
                                    @endforeach
                                </select>
                                </select>
                            </div>
                            <div class="col-lg-3">
                                <select class="form-control searchable kt-selectpicker" id="user" data-live-search="true">
                                    <option value>الموظف</option>
                                    @foreach($users as $user)
                                        <option value="{{ $user->id }}">{{ $user->name }}</option>
                                    @endforeach
                                </select>
                                </select>
                            </div>
                            <div class="col-lg-3">
                                <select class="form-control searchable kt-selectpicker" id="store" data-live-search="true">
                                    <option value>المخزن</option>
                                    @foreach($stores as $store)
                                        <option value="{{ $store->id }}">{{ $store->name }}</option>
                                    @endforeach
                                </select>
                                </select>
                            </div>
                            <div class="col-lg-3">
                                <select class="form-control searchable kt-selectpicker" id="transaction_type" >
                                    <option value>نوع التحويل</option>
                                    <option value="1">مخزن إلى شخص</option>
                                    <option value="2">شخص إلى شخص</option>
                                    <option value="3">شخص إلى مخزن</option>
                                    <option value="4">مخزن إلى مخزن</option>
                                </select>
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

    <!-- begin:: Content -->
    <div class="kt-portlet kt-portlet--mobile">
        <div class="kt-portlet__head kt-portlet__head--lg">
            <div class="kt-portlet__head-label">
                <h3 class="kt-portlet__head-title">
                    سجلات العُهد
                </h3>
            </div>
        </div>
        <div class="kt-portlet__body">
            <!--begin: Datatable -->
            <table class="table table-striped table-bordered table-hover" id="transactions_table">
                <thead>
                <tr>
                    <th>#</th>
                    <th>النوع</th>
                    <th>الصنف</th>
                    <th>التفاصيل</th>
                    <th>الموظف القديم</th>
                    <th>الموظف الجديد</th>
                    <th>المخزن القديم</th>
                    <th>المخزن الجديد</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>


            <!--end: Datatable -->
        </div>
    </div>
    <!-- end:: Content -->
@stop

@section('js')
    <script src="assets/admin/general/js/scripts/transactions.js" type="text/javascript"></script>
@stop
