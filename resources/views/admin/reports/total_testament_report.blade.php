@extends('admin.layout.master')

@section('title')
    كشف العُهد الإجمالي
@stop

@section('css')
    <style>
        table {
            border-collapse: collapse !important;
            border-color: #cecece !important;
        }

        th, td {
            padding: 10px !important;
        }

        thead, thead th {
            background-color: #5867dd;
            color: #fff;
        }
    </style>
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
                    <a href="#" class="kt-subheader__breadcrumbs-link">
                        التقارير
                    </a>
                    <span class="kt-subheader__breadcrumbs-separator"></span>
                    <a href="{{ route('admin.categories.add') }}" class="kt-subheader__breadcrumbs-link">
                        كشف العُهد الإجمالي
                    </a>
                </div>
            </div>
        </div>
    </div>
@stop

@section('content')

    <div class="d-flex justify-content-between align-items-end mb-3">
        <div>
            <h4>كشف العُهد الإجمالي</h4>
        </div>
        <div class="d-flex align-items-end">
            <div class="form-group mb-0 mx-2">
                <label for="edara">إختر الإدارة لعرض التقرير</label>
                <select id="edara" data-live-search="true" data-type="1" class="kt-selectpicker select_item form-control"
                        data-route="{{ route('admin.reports.total_testament_report') }}" >
                    <option>اختر إدارة</option>
                    @foreach($edaras as $edara)
                        <option value="{{ $edara->id }}">{{ $edara->name }}</option>
                    @endforeach
                </select>
            </div>
            <div class="form-group mb-0 mx-2"  >
                <label for="daera">إختر الدائرة لعرض التقرير</label>
                <select data-type="2" id="daera" class="select_item form-control"
                        data-route="{{ route('admin.reports.total_testament_report') }}" >
                    <option>اختر دائرة</option>
                    @foreach($daeras as $daera)
                        <option data-parent-id="{{ $daera->parent_id }}" value="{{ $daera->id }}">{{ $daera->name }}</option>
                    @endforeach
                </select>
            </div>
            <div class="form-group mb-0 mx-2"  >
                <label for="department">إختر القسم لعرض التقرير</label>
                <select data-type="3" class="select_item form-control"
                        data-route="{{ route('admin.reports.total_testament_report') }}" id="department">
                    <option>اختر قسم</option>
                    @foreach($departments as $department)
                        <option data-parent-id="{{ $department->parent_id }}" value="{{ $department->id }}">{{ $department->name }}</option>
                    @endforeach
                </select>
            </div>
            <button onclick="window.print();" class="btn btn-primary">طباعة التقرير</button>
        </div>
    </div>

    <div id="report_table" class="show-print">
        @include('admin.reports.partials.total_testament_report_ajax')
    </div>

@stop
@section('js')
    <script>

        (function ($) {
            "use strict";
            $('#edara').change(function (){
                const id = $(this).val();
                $("#daera option").each(function (){
                    if($(this).data('parent-id') == id || $(this).data('parent-id') === undefined) $(this).show();
                    else $(this).hide();
                })
            });
            $('#daera').change(function (){
                const id = $(this).val();
                $("#department option").each(function (){
                    if($(this).data('parent-id') == id || $(this).data('parent-id') === undefined) $(this).show();
                    else $(this).hide();
                })
            });

            $('select').change(function () {
                const edara_daera_department = $(this).val();
                const type = $(this).data('type');
                const route = $(this).data('route');
                ;
                $(`select:not(select[data-not-remove=true])`).each(function () {
                    if ($(this).data("type") != type) {
                        $(this).prop('selectedIndex', 0)
                    }
                });
                $.ajax({
                    type: 'GET',
                    url: route,
                    data: {
                        edara_daera_department,
                        type
                    },
                    datatype: "json",

                    success: function (response) {
                        $("#report_table").html(response.html);
                    },
                    error: function (error) {
                        console.log(error);
                    },
                });
            });
        })(jQuery)
    </script>
@stop
