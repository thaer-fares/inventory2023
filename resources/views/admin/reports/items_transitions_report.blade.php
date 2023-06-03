@extends('admin.layout.master')

@section('title')
    كشف حركات الصنف
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
                        كشف حركات الصنف
                    </a>
                </div>
            </div>
        </div>
    </div>
@stop

@section('content')

    <div class="d-flex justify-content-between align-items-end mb-3">
        <div>
            <h4>كشف حركات الصنف</h4>
        </div>
        <div class="d-flex align-items-end">
            <div class="form-group mb-0 mx-2">
                <label for="exampleSelectitem">إختر الصنف لعرض التقرير</label>
                <select data-live-search="true" class="kt-selectpicker select_item form-control" data-route="{{ route('admin.reports.items_transitions_report') }}" id="exampleSelectitem">
                    <option>اختر صنف</option>
                    @foreach($items as $item)
                        <option value="{{ $item->id }}">{{ $item->name }}</option>
                    @endforeach
                </select>
            </div>
            <div>
                <button onclick="window.print();" class="btn btn-primary">طباعة التقرير</button>
            </div>
        </div>

    </div>

    <div id="report_table" class="show-print">
        @include('admin.reports.partials.items_transitions_report_ajax')
    </div>

@stop

@section('js')
    <script>

        (function ($) {
            "use strict";

            $('select.select_item').change(function () {
                var select_value = $('select.select_item').val();
                var route = $(this).data('route');
                // $(".export-button").attr("href","");

                $.ajax({
                    type: 'GET',
                    url: route,

                    data: {
                        "select_item": select_value
                    },
                    datatype: "json",

                    success: function (response) {
                        $("#report_table").html(response.html);
                        console.log(response)
                    },
                    error: function(error) {
                        console.log(error);
                    },
                });
            });

        })(jQuery)
    </script>
@stop
