@extends('admin.layout.master')

@section('title')
    إضافة تصنيف
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
                    <a href="{{ route('admin.testaments.add') }}" class="kt-subheader__breadcrumbs-link">
                        إضافة عهُدة
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
                            إضافة عُهدة
                        </h3>
                    </div>
                </div>
                <!--begin::Form-->
                <form class="kt-form kt-form--label-right" id="frmAdd" method="post"
                      action="{{ route('admin.testaments.post.add') }}">
                    <div class="kt-portlet__body">
                        <div class="form-group row">
                            <div class="col-lg-4">
                                <label>الصنف :</label>
                                <select class="form-control kt-selectpicker" name="item" data-live-search="true">
                                    <option selected value>غير محدد</option>
                                    @foreach($items as $item)
                                        @if($item->available_quantity > 0)
                                            <option value="{{$item->id}}">{{$item->name}} | الكمية: {{ $item->available_quantity }}</option>
                                        @endif
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-lg-4">
                                <label>الوحدة :</label>
                                <select class="form-control kt-selectpicker" name="unit">
                                    @foreach($units as $unit)
                                        <option value="{{$unit->id}}">{{$unit->name}}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-lg-4">
                                <label>الكمية :</label>
                                <input type="number" class="form-control" name="quantity"
                                       placeholder="الكمية" value="{{ old('quantity') }}"/>
                            </div>

                        </div>
                        <div class="form-group row">
                            <div class="col-lg-4">
                                <label>الموظف :</label>
                                <select class="form-control kt-selectpicker" name="user" data-live-search="true">
                                    <option selected value>غير محدد</option>
                                    @foreach($users as $user)
                                        <option value="{{$user->id}}">{{$user->name}}</option>
                                    @endforeach
                                </select>
                            </div>

                            <div class="col-lg-4">
                                <label>الحالة :</label>
                                <select class="form-control kt-selectpicker" name="testament_status" id="testament_status" onchange="changetEstamentDate()" >
                                    <option value="" disabled selected>اختر من القائمة</option>
                                    <option value="1">دائمة</option>
                                    <option value="2">مؤقتة</option>
                                </select>
                            </div>
                            <div class="col-lg-4" id="testament_date" hidden>
                                <label>تاريخ الإرجاع :</label>
                                <input type="text" class="form-control" name="return_testament_date"  readonly="readonly" placeholder="يرجى إضافة تاريخ الإرجاع في حال كانت العُهدة مؤقتة" id="kt_datepicker_3">
                            </div>

                        </div>
                        <div class="form-group row">
                            <div class="col-lg-12">
                                <label>الوصف :</label>
                                <textarea type="text" rows="10" class="form-control" name="description"
                                          placeholder="الوصف">{{ old('description') }}</textarea>
                            </div>
                        </div>
                        <div class="kt-portlet__foot">
                            <div class="kt-form__actions">
                                <div class="row">
                                    <div class="col-lg-6 kt-align-right">
                                        <button type="submit" class="btn btn-brand save">حفظ</button>
                                        <a href="{{ route('admin.testaments.view') }}" class="btn btn-secondary">الغاء</a>
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

    <script>
        function changetEstamentDate(){
            var status =  $('#testament_status').val();
            console.log(status);
            if(status == 1)
            {
                $('#testament_date').prop('hidden',true);
            }
            else if(status == 2)
            {
                $('#testament_date').prop('hidden',false);
            }
        }
    </script>
@stop
