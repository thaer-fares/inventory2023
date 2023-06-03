@extends('admin.layout.master')

@section('title')
    كشف أرصدة الصنف المنفصل
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
                        كشف أرصدة الصنف المنفصل
                    </a>
                </div>
            </div>
        </div>
    </div>
@stop

@section('content')

    <div class=" d-flex justify-content-between align-items-end mb-3">
        <div>
            <h4>كشف أرصدة الصنف المنفصل</h4>
        </div>
        <div class="d-flex align-items-end">
            <div>
                <button onclick="window.print();" class="btn btn-primary">طباعة التقرير</button>
            </div>
        </div>
    </div>
    <table border="1" width="100%" class="show-print">
        <thead class="show-print">
        <tr class="show-print">
            <th scope="col" class="show-print">إسم الموظف</th>
            <th scope="col" class="show-print">المخزن</th>
            <th scope="col" >الكمية</th>
            <th scope="col" class="show-print">تاريخ الإسترجاع</th>
        </tr>
        </thead>
        <tbody>
        @foreach($items as $item)
            <tr>
                <td colspan="4"><b>الصنف : </b> {{ $item->name }}</td>
            </tr>
            @foreach($item->testaments as $testament)
                <tr>
                    <td>{{ $testament->user->name }}</td>
                    <td>{{ $testament->store->name }}</td>
                    <td>{{ $testament->quantity }}</td>
                    <td>{{ $testament->return_testament_date ? $testament->return_testament_date->format('Y-m-d') : 'دائمة' }}</td>
                </tr>
            @endforeach
        @endforeach
        </tbody>
    </table>
@stop
