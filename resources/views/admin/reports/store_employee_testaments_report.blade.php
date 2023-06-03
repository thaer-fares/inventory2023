@extends('admin.layout.master')

@section('title')
    كشف عهدة الموظف أو المخزن
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
    <div class="kt-subheader   kt-grid__testament" id="kt_subheader">
        <div class="kt-container  kt-container--fluid ">
            <div class="kt-subheader__main">
                <h3 class="kt-subheader__title">
                    وزارة الأوقاف والشؤون الدينية
                </h3>
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
                        كشف عهدة الموظف أو المخزن
                    </a>
                </div>
            </div>
        </div>
    </div>
@stop

@section('content')

    <div class="d-flex justify-content-between align-items-end mb-3">
        <div>
            <h4>كشف عهدة الموظف أو المخزن</h4>
        </div>
        <div class="d-flex align-items-end">
            <div class="form-group mb-0 mx-2">
                <label for="exampleSelect1">إختر نوع التقرير</label>
                <select class="form-control kt-selectpicker type_report" id="type" >
                    <option value="" selected>نوع الكشف</option>
                    <option value="1">موظف</option>
                    <option value="2">مخزن</option>
                </select>
            </div>
            <div class="form-group mb-0 mx-2" style="display: none;" id="employee_select">
                <label for="exampleSelect1">إختر الموظف لعرض التقرير</label>
                <select class="form-control kt-selectpicker" data-live-search="true" data-type="1"
                        data-route="{{ route('admin.reports.store_employee_testaments_report') }}" id="employee">
                    <option value="" selected>اختر موظف</option>
                    @foreach($employees as $employee)
                        @if($employee->id != 1)
                            <option value="{{ $employee->id }}">{{ $employee->name }}</option>
                        @endif
                    @endforeach
                </select>
            </div>
            <div class="form-group mb-0 mx-2" style="display: none;" id="store_select">
                <label for="exampleSelect1">إختر المخرن لعرض التقرير</label>
                <select class="form-control kt-selectpicker" data-type="2"
                        data-route="{{ route('admin.reports.store_employee_testaments_report') }}" id="store">
                    <option value="" selected>اختر مخزن</option>
                    @foreach($stores as $store)
                        <option value="{{ $store->id }}">{{ $store->name }}</option>
                    @endforeach
                </select>
            </div>
            <div>
                <button onclick="window.print();" class="btn btn-primary">طباعة التقرير</button>
                {{--                <a href="{{ route('admin.reports.export_store_employee_testaments_report') }}" target="_blank" type="button" class="export-button btn btn-primary">طباعة التقرير</a>--}}
            </div>
        </div>

    </div>
            @include('admin.reports.partials.store_employee_testaments_report_ajax')


@stop

@section('js')
    <script>

        (function ($) {
            "use strict";
            $(".type_report").change(function () {
                $('.type_report').each(function() {
                const value =  $('#type').val();

                if (value == 1) {
                    $("#employee_select").show();
                    $('#employee').val($('#employee option:eq(0)').val()).trigger('change');
                    $("#store_select").hide();


                } else if (value == 2) {
                    $("#store_select").show();
                    $('#store').val($('#store option:eq(0)').val()).trigger('change');
                    $("#employee_select").hide();
                }

                else{
                    $("#employee_select").hide();
                    $("#store_select").hide();
                    $('#type').show();
                    $("#report_table_body").hide();
                    $("#report_table_tr").prop('hidden',false);


                }
            });

        });

            $('select:not(.type_report)').change(function () {
                const employee_or_store = $(this).val();
                const type = $(this).data('type');
                const route = $(this).data('route');


                $.ajax({
                    type: 'GET',
                    url: route,
                    data: {
                        employee_or_store,
                        type
                    },
                    datatype: "json",

                    success: function (response) {
                        console.log(response.type)
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
