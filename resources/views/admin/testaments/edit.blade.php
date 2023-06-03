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
                    <a href="{{ route('admin.testaments.view') }}" class="kt-subheader__breadcrumbs-link">
                        العُهد
                    </a>
                    <span class="kt-subheader__breadcrumbs-separator"></span>
                    <a href="{{ route('admin.testaments.edit', ['id' => $info->id]) }}"
                       class="kt-subheader__breadcrumbs-link">
                        تعديل عُهدة
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
                            تعديل العُهدة
                        </h3>
                    </div>
                </div>
                <!--begin::Form-->
                <form class="kt-form kt-form--label-right" id="frmEdit" method="post"
                      action="{{ route('admin.testaments.edit', ['id' => $info->id]) }}">

                    <div class="kt-portlet__body">
                        <div class="form-group row">
                            <div class="col-lg-4">
                                <label>الصنف :</label>
                                <input type="text" readonly="readonly" class="form-control" disabled="disabled"
                                       value="{{ $info->item->name }}">
                            </div>
                            <div class="col-lg-4">
                                <label>الوحدة :</label>
                                <select class="form-control kt-selectpicker" name="unit">
                                    @foreach($units as $unit)
                                        <option
                                            {{ $unit->id === $info->unit_id ? "selected":'' }} value="{{$unit->id}}">{{$unit->name}}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-lg-4">
                                <label>تاريخ الإرجاع :</label>
                                <input type="text" class="form-control" name="return_testament_date" readonly="readonly"
                                       placeholder="يرجى إضافة تاريخ الإرجاع في حال كانت العُهدة مؤقتة"
                                       value="{{$info->return_testament_date !== null ? old('return_testament_date',  $info->return_testament_date->format('d/m/Y')) : old('return_testament_date')}}"
                                       id="kt_datepicker_3">
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-lg-4">
                                <label>الكمية :</label>
                                <input type="number" class="form-control" name="quantity"
                                       placeholder="الكمية" value="{{ old('quantity',$info->quantity) }}"/>
                            </div>
                            <div class="col-lg-4">
                                <label>الحالة :</label>
                                <select class="form-control kt-selectpicker" name="testament_status">
                                    <option {{  $info->testament_status == 1 ? "selected":'' }} value="1">دائمة
                                    </option>
                                    <option {{  $info->testament_status == 2 ? "selected":'' }} value="2">مؤقتة
                                    </option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-lg-12">
                                <label>الوصف :</label>
                                <textarea type="text" rows="10" class="form-control" name="description"
                                          placeholder="الوصف">{{ old('description',$info->description) }}</textarea>
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
