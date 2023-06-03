@extends('admin.layout.master')

@section('title')
    إضافة إرسالية
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
                    <a href="{{ route('admin.items.view') }}" class="kt-subheader__breadcrumbs-link">
                        الأصناف
                    </a>
                    <span class="kt-subheader__breadcrumbs-separator"></span>
                    <a href="{{ route('admin.items.addItems') }}" class="kt-subheader__breadcrumbs-link">
                        إضافة إرسالية
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
                            إضافة إرسالية
                        </h3>
                    </div>
                </div>
                <!--begin::Form-->
                <form class="kt-form kt-form--label-right" id="from-items" method="post"
                      action="{{ route('admin.items.addItems') }}">
                    <div id="kt_repeater_1">
                        <div class="kt-repeater__row kt-portlet__body" data-repeater-list="items">
                            <div data-repeater-item>
                                <div class="form-group row">
                                    <div class="col-lg-6">
                                        <label>الصنف :</label>
                                        <select class="form-control kt-selectpicker" name="item"
                                                data-live-search="true">
                                            <option selected value>غير محدد</option>
                                            @foreach($items as $item)
                                                <option value="{{$item->id}}">{{$item->name}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="col-lg-6">
                                        <label>الكمية :</label>
                                        <input type="text" class="form-control" name="quantity"
                                               placeholder="الكمية"/>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-lg-12">
                                        <label>الوصف :</label>
                                        <textarea type="text" rows="10" class="form-control" name="description"
                                                  placeholder="الوصف">{{ old('description', $info?->description) }}</textarea>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-lg-12 kt-align-right">
                                        <button type="button" data-repeater-delete class="btn btn-danger">
                                            حذف
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="kt-portlet__foot">
                            <div class="kt-form__actions">
                                <div class="row">
                                    <div class="col-lg-12 kt-align-center">
                                        <button type="button" data-repeater-create class="btn btn-primary ">
                                            إضافة جديد
                                        </button>
                                        &nbsp;
                                        <button type="submit" class="btn btn-brand save">حفظ</button>
                                        &nbsp;
                                        <a href="{{ route('admin.items.view') }}"
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
    <script src="assets/admin/general/js/scripts/items.js" type="text/javascript"></script>
    <script type="text/javascript">
        $('#kt_repeater_1').repeater({
            initEmpty: false,

            show: function () {
                $(this).slideDown();
            },

            hide: function (deleteElement) {
                $(this).slideUp(deleteElement);
            },
            isFirstItemUndeletable: true
        });

        $('#from-items').submit(function (e) {
            e.preventDefault();
            const formData = $('#kt_repeater_1').repeaterVal();
            console.log(formData)
            const addCallBack = function (obj) {
                if (obj.code === 200) {
                    const delay = 1750;

                    setTimeout(function () {
                        window.location = "{{route('admin.items.view')}}";
                    }, delay);
                }
            };
            $.ajax({
                type: "POST",
                url: $(this).attr('action'),
                data: formData,
                success: function (data) {
                    notify(data.title, Forms.getNotificationType(data.code), data.message);
                    addCallBack(data);
                },
                error: function (request, status, error) {
                    console.log(request)
                    notify('أوه!', Forms.getNotificationType(500), 'عذراً - حدث خطأ أثناء معالجة البيانات');
                }
            })
        })
    </script>
@stop
