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
                    <a href="{{ route('admin.items.view') }}" class="kt-subheader__breadcrumbs-link">
                        الأصناف
                    </a>
                    <span class="kt-subheader__breadcrumbs-separator"></span>
                    <a href="{{ route('admin.items.edit', ['id' => $info->id]) }}"
                       class="kt-subheader__breadcrumbs-link">
                        تعديل صنف
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
                            تعديل التصنيف
                        </h3>
                    </div>
                </div>
                <!--begin::Form-->
                <form class="kt-form kt-form--label-right" id="frmEdit" method="post"
                      action="{{ route('admin.items.edit', ['id' => $info->id]) }}">

                    <div class="kt-portlet__body">
                        <div class="form-group row">
                            <div class="col-lg-4">
                                <label>الصنف :</label>
                                <input type="text" class="form-control" name="name"
                                       value="{{ old('name',$info->name) }}"
                                       placeholder="الصنف">
                            </div>
                            <div class="col-lg-4">
                                <label>رقم الصنف :</label>
                                <input type="text" class="form-control" name="item_number"
                                       value="{{ old('item_number',$info->item_number)  }}"
                                       placeholder="رقم الصنف">
                            </div>
                            <div class="col-lg-4">
                                <label>حالة الصنف :</label>
                                <select class="form-control kt-selectpicker" name="item_status">
                                    <option value>غير محدد</option>
                                    <option {{ $info->item_status == 1 ? 'selected' : '' }} value="1">ممتاز</option>
                                    <option {{ $info->item_status == 2 ? 'selected' : '' }} value="2">متوسط</option>
                                    <option {{ $info->item_status == 3 ? 'selected' : '' }} value="3">رديئ</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-lg-4">
                                <label>التصنيف :</label>
                                <select class="form-control kt-selectpicker" name="category_id" data-live-search="true">
                                    <option selected value>غير محدد</option>
                                    @foreach($categories as $category)
                                        <option
                                            {{ $info->category_id == $category->id ? 'selected' : "" }} value="{{$category->id}}">{{$category->name}}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-lg-4">
                                <label>الكمية الإجمالية :</label>
                                <input type="number" class="form-control" name="total_quantity"
                                       placeholder="الكمية الإجمالية"
                                       value="{{ old('total_quantity',$info->total_quantity) }}"/>
                            </div>
                            <div class="col-lg-4">
                                <label>المخزن :</label>
                                <select class="form-control kt-selectpicker" name="store_id"  data-live-search="true">
                                    @foreach($stores as $store)
                                        <option {{  $store->id === $info->store_id  ? "selected" : "" }} value="{{$store->id}}">
                                            {{ $store->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-lg-12">
                                <label>الوصف :</label>
                                <textarea type="text" rows="10" class="form-control" name="description"
                                          placeholder="الوصف">{{ old('description', $info?->description) }}</textarea>
                            </div>
                        </div>
                        <div class="kt-portlet__foot">
                            <div class="kt-form__actions">
                                <div class="row">
                                    <div class="col-lg-6 kt-align-right">
                                        <button type="submit" class="btn btn-brand save">حفظ</button>
                                        <a href="{{ route('admin.items.view') }}" class="btn btn-secondary">الغاء</a>
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
@stop
