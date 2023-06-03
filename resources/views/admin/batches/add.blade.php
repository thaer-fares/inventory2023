@extends('admin.layout.master')

@section('title')
    إضافة عهدة
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
                    <a href="{{ route('admin.batches.view') }}" class="kt-subheader__breadcrumbs-link">
                        العهد
                    </a>
                    <span class="kt-subheader__breadcrumbs-separator"></span>
                    <a href="{{ route('admin.batches.add') }}" class="kt-subheader__breadcrumbs-link">
                        إضافة عهدة
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
                            إضافة عهدة
                        </h3>
                    </div>
                </div>
                <!--begin::Form-->
                <form class="kt-form kt-form--label-right" id="frmAdd" method="post"
                      action="{{ route('admin.batches.add') }}">

                    <div class="kt-portlet__body">
                        <div class="form-group row">
                            <div class="col-lg-4">
                                <label>إسم الإرسالية :</label>
                                <input type="text" class="form-control" name="name"
                                       value="{{ old('name') }}"
                                       placeholder="إسم الإرسالية">
                            </div>

                            <div class="col-lg-4">
                                <label>تاريخ تسليم الإرسالية :</label>
                                <input type="date" class="form-control" name="receive_date"
                                       value="{{ old('receive_date') }}"
                                       placeholder="تاريخ التسليم">
                            </div>


                            <div id="kt_repeater_1" class="mt-5">
                                <div data-repeater-list="testaments_repeater" class="col-lg-12">
                                    <h3 class="col-lg-12 col-form-label">إضافة العهود/الأصناف الخاصة بهذه الإرسالية:</h3>
                                    <div class="row mb-3">
                                        <div class="col-lg-12">
                                            <a href="javascript:;" data-repeater-create=""
                                               class="btn btn-sm font-weight-bolder btn-light-success">
                                                <i class="la la-plus"></i>إضافة</a>
                                        </div>
                                    </div>
                                    <div data-repeater-item="" class="form-group row align-items-center" style="">
                                        <div class="col-md-4">
                                            <label>رقم العهدة :</label>
                                            <input type="text" name="testament_number" {{ old('testament_number') }} class="mb-3 form-control" placeholder="أدخل رقم العهدة">
                                        </div>
                                        <div class="col-md-4">
                                            <label>الصنف :</label>
                                            <select class="mb-3 form-control kt-selectpicker" name="item_id"
                                                    data-live-search="true">
                                                <option selected value>غير محدد</option>
                                                {{--                                            @foreach($items as $item)--}}
                                                {{--                                                <option value="{{$item->id}}">{{$item->name}}</option>--}}
                                                {{--                                            @endforeach--}}
                                            </select>
                                        </div>
                                        <div class="col-md-4">
                                            <label>الوصف :</label>
                                            <textarea type="text" rows="2" class="form-control" name="description"
                                                      placeholder="الوصف">{{ old('description') }}</textarea>
                                        </div>
                                        <div class="col-md-2">
                                            <label> الكمية :</label><span>(الكمية المتاحة: 56)</span>
                                            <input type="text" class="mb-3 form-control" name="item_quantity" value="{{ old('description') }}" placeholder="أدخل كمية الصنف">
                                        </div>
                                        <div class="col-lg-2">
                                            <label>وحدة الكمية :</label>
                                            <select class="mb-3 form-control kt-selectpicker" name="unit_id"
                                                    data-live-search="true">
                                                <option selected value>غير محدد</option>
                                                {{--                                            @foreach($units as $unit)--}}
                                                {{--                                                <option value="{{$unit->id}}">{{$unit->name}}</option>--}}
                                                {{--                                            @endforeach--}}
                                            </select>
                                        </div>
                                        <div class="col-lg-2">
                                            <label>حالة العهدة :</label>
                                            <select class="mb-3 form-control kt-selectpicker" name="testament_status">
                                                <option value="دائمة">دائمة</option>
                                                <option value="مؤقتة">مؤقتة</option>
                                            </select>
                                        </div>
                                        <div class="col-lg-2">
                                            <label>تاريخ إسترجاع العهدة :</label>
                                            <input type="date" class="mb-3 form-control" name="return_testament_date"
                                                   value="{{ old('return_testament_date') }}"
                                                   placeholder="تاريخ إسترجاع العهدة">
                                        </div>

                                        <div class="col-md-2">
                                            <a href="javascript:;" data-repeater-delete=""
                                               class="btn btn-sm font-weight-bolder btn-light-danger">
                                                <i class="la la-trash-o"></i>حذف</a>
                                        </div>
                                    </div>
                                    <div class="form-group row">

                                </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="kt-portlet__foot">
                        <div class="kt-form__actions">
                            <div class="row">
                                <div class="col-lg-6 kt-align-right">
                                    <button type="submit" class="btn btn-brand save">حفظ</button>
                                    <a href="{{ route('admin.batches.view') }}" class="btn btn-secondary">الغاء</a>
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
    <script src="assets/admin/general/js/scripts/batches.js" type="text/javascript"></script>
{{--    <script src="assets/js/pages/crud/forms/widgets/form-repeater.js"></script>--}}
    <script>
        // Class definition
        var KTFormRepeater = function() {

            // Private functions
            var demo1 = function() {
                $('#kt_repeater_1').repeater({
                    initEmpty: false,

                    defaultValues: {
                        'text-input': 'foo'
                    },

                    show: function () {
                        $(this).slideDown();
                    },

                    hide: function (deleteElement) {
                        $(this).slideUp(deleteElement);
                    }
                });
            }

            return {
                // public functions
                init: function() {
                    demo1();
                }
            };
        }();

        jQuery(document).ready(function() {
            KTFormRepeater.init();
        });

    </script>
@stop
