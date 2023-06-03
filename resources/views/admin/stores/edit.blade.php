@extends('admin.layout.master')

@section('title')
    تعديل مستخدم
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
                    <a href="{{ route('admin.stores.view') }}" class="kt-subheader__breadcrumbs-link">
                        المستخدمين
                    </a>
                    <span class="kt-subheader__breadcrumbs-separator"></span>
                    <a href="{{ route('admin.stores.edit', ['id' => $info->id]) }}"
                       class="kt-subheader__breadcrumbs-link">
                        تعديل مخرن
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
                            تعديل مخرن
                        </h3>
                    </div>
                </div>
                <!--begin::Form-->
                <form class="kt-form kt-form--label-right" id="frmEdit" method="post"
                      action="{{ route('admin.stores.edit', ['id' => $info->id]) }}">
                    <div class="kt-portlet__body">
                        <div class="form-group row">
                            <div class="col-lg-6">
                                <label>المخزن :</label>
                                <input type="text" class="form-control" name="name" value="{{ $info->name }}"
                                       placeholder="المخزن">
                            </div>
                            <div class="col-lg-6">
                                <label class="">رقم المخزن :</label>
                                <input type="text" class="form-control" name="store_number" value="{{ $info->store_number }}"
                                       placeholder="رقم المخزن">
                            </div>
                        </div>
                    </div>
                    <div class="kt-portlet__foot">
                        <div class="kt-form__actions">
                            <div class="row">
                                <div class="col-lg-6 kt-align-right">
                                    <button type="submit" class="btn btn-brand save">حفظ التغييرات</button>
                                    <a href="{{ route('admin.stores.view') }}" class="btn btn-secondary">الغاء</a>
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
    <script src="assets/admin/general/js/scripts/stores.js" type="text/javascript"></script>
@stop
