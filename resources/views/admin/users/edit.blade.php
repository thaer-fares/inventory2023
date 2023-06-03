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
                    <a href="{{ route('admin.users.view') }}" class="kt-subheader__breadcrumbs-link">
                        المستخدمين
                    </a>
                    <span class="kt-subheader__breadcrumbs-separator"></span>
                    <a href="{{ route('admin.users.edit', ['id' => $info->id]) }}"
                       class="kt-subheader__breadcrumbs-link">
                        تعديل مستخدم
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
                            تعديل مستخدم
                        </h3>
                    </div>
                </div>
                <!--begin::Form-->
                <form class="kt-form kt-form--label-right" id="frmEdit" method="post"
                      action="{{ route('admin.users.edit', ['id' => $info->id]) }}">
                    @csrf
                    <div class="kt-portlet__body">
                        <div class="form-group row">
                            <div class="col-lg-6">
                                <label class="">الموظف:</label>
                                <select class="form-control kt-selectpicker" id="employee" name="employee"
                                        data-live-search="true">
                                    <option value selected>--------------------------------------------------</option>
                                    @foreach($employees as $employee)
                                        <option {{ $info->employee_id === $employee->id ? "selected" : '' }}
                                                value="{{ $employee->id }}">{{ $employee->full_name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-lg-6">
                                <label class="">الاسم الكامل:</label>
                                <input type="text" id="name" class="form-control" name="name"
                                       value="{{ old('name',$info->name) }}"
                                       placeholder="الاسم الكامل">
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-lg-6">
                                <label>اسم المستخدم:</label>
                                <input type="text" class="form-control" name="username"
                                       value="{{ old('username',$info->username) }}"
                                       placeholder="اسم المستخدم">
                            </div>
                            <div class="col-lg-6">
                                <label>البريد الإلكتروني:</label>
                                <input type="email" class="form-control" name="email"
                                       value="{{ old('email',$info->email) }}"
                                       placeholder="البريد الإلكتروني">
                            </div>
                        </div>
                      {{--  <div class="form-group row">
                            <div class="col-lg-6">
                                <label>كلمة المرور:</label>
                                <input type="password" class="form-control" autocomplete="new-password" name="password"
                                       placeholder="كلمة المرور">
                            </div>
                            <div class="col-lg-6">
                                <label class="">تأكيد كلمة المرور:</label>
                                <input type="password" class="form-control" name="password_confirmation"
                                       placeholder="تأكيد كلمة المرور">
                            </div>
                        </div>--}}
                        <div class="form-group row">
                            <div class="col-lg-6">
                                <label class="">الحالة:</label>
                                <select class="form-control kt-selectpicker" name="status">
                                    <option {{ $info->status == 'active' ? 'selected': '' }} value="active">فعال
                                    </option>
                                    <option {{ $info->status == 'active' ? 'selected': '' }} value="inactive">معطل
                                    </option>
                                </select>
                            </div>
                            <div class="col-lg-6">
                                <label class="">الصلاحية:</label>
                                <select class="form-control kt-selectpicker" name="roles[]" data-live-search="true"
                                        multiple>
                                    @foreach($roles as $role)
                                        <option
                                            @foreach($user_roles as $user_role)
                                                {{ $user_role->id === $role->id ? 'selected' : ''  }}
                                            @endforeach
                                            value="{{ $role->id }}">{{ $role->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="kt-portlet__foot">
                        <div class="kt-form__actions">
                            <div class="row">
                                <div class="col-lg-6 kt-align-right">
                                    <button type="submit" class="btn btn-brand save">حفظ التغييرات</button>
                                    <a href="{{ route('admin.users.view') }}" class="btn btn-secondary">الغاء</a>
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
    <script src="assets/admin/general/js/scripts/users.js" type="text/javascript"></script>
@stop
