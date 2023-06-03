@extends('admin.layout.master')

@section('title')
    حركات عهدة الموظف التفصيلي
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
                        حركات عهدة الموظف التفصيلي
                    </a>
                </div>
            </div>
        </div>
    </div>
@stop

@section('content')


    <div class="d-flex justify-content-between align-items-end mb-3">
        <div>
            <h4>حركات عهدة الموظف التفصيلي</h4>
        </div>
        <div class="d-flex align-items-end">
            <div>
                <button onclick="window.print();" class="btn btn-primary">طباعة التقرير</button>
            </div>
        </div>

    </div>

    <table border="1" width="100%" class="show-print">
        <thead>
        <tr>
            <th scope="col">الرقم</th>
            <th scope="col">الصنف</th>
            <th scope="col">التفصيل</th>
            <th scope="col">الوارد</th>
            <th scope="col">الصادر</th>
        </tr>
        </thead>
        <tbody>
        @foreach($employees as $employee)
            <table border="1" width="100%" class="mt-3">

                <tbody>
                <tr>
                    <td colspan="6"> <b>الموظف : </b> {{ $employee->name }}</td>
                </tr>

                @foreach($employee->testaments as $testament)
                    <tr>
                        <td>{{ $testament->id }}</td>
                        <td>{{ $testament->item->name ?? '' }}</td>
                        <td>{{ $testament->description }}</td>
                        <td></td>
                        <td></td>
                    </tr>
                @endforeach
                </tbody>
            </table>
        @endforeach
        </tbody>
    </table>



@stop
