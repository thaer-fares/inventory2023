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
                    <a href="{{ route('admin.categories.view') }}" class="kt-subheader__breadcrumbs-link">
                        التصنيفات </a>
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
                            <div class="col-lg-6">
                                <input type="text" class="form-control searchable" id="name" placeholder="الصنف">
                            </div>
                            <div class="col-lg-6">
                                <input type="text" class="form-control searchable" id="item_number"
                                       placeholder="رقم الصنف">
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-lg-6">
                                <select type="text" class="form-control kt-selectpicker searchable" id="category"
                                        data-live-search="true">
                                    <option selected value>التصنيف</option>
                                    @foreach($categories as $category)
                                        <option value="{{$category->id}}">{{$category->name}}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-lg-6">
                                <select class="form-control kt-selectpicker searchable" id="item_status">
                                    <option selected value>حالة الصنف</option>
                                    <option value="1">ممتاز</option>
                                    <option value="2">متوسط</option>
                                    <option value="3">رديئ</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-lg-6">
                                <select type="text" class="form-control kt-selectpicker searchable" id="store"
                                        data-live-search="true">
                                    <option selected value>المخزن</option>
                                    @foreach($stores as $store)
                                        <option value="{{$store->id}}">{{$store->name}}</option>
                                    @endforeach
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
                    إدارة الأصناف
                </h3>
            </div>
            @can('admin.items.add')
                <div class="kt-portlet__head-toolbar">
                    <div class="kt-portlet__head-wrapper">
                        <div class="kt-portlet__head-actions">
                            <a href="{{ route('admin.items.add') }}" class="btn btn-brand btn-elevate btn-icon-sm">
                                إضافة جديد
                            </a>
                        </div>
                    </div>
                </div>
            @endcan
        </div>
        <div class="kt-portlet__body">
            <!--begin: Datatable -->
            <table class="table table-striped table-bordered table-hover" id="items_table">
                <thead>
                <tr>
                    <th>#</th>
                    <th>الصنف</th>
                    <th>رقم الصنف</th>
                    <th>التصنيف</th>
                    <th>الكمية الإجمالية</th>
                    <th>الكمية المتاحة</th>
                    <th>حالة الصنف</th>
                    <th>أدوات</th>
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
    <script src="assets/admin/general/js/scripts/items.js" type="text/javascript"></script>
@stop
