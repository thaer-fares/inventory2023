<?php

namespace App\Http\Controllers\Admin;

use App\Models\Batch;
use App\Models\Daera;
use App\Models\Department;
use App\Models\Edara;
use App\Models\Employee;
use App\Models\Item;
use App\Models\Role;
use App\Models\Store;
use App\Models\Testament;
use App\Models\Transaction;
use App\Models\User;
use App\Repositories\Interfaces\BatchRepositoryInterface;
use App\Repositories\Interfaces\CategoryRepositoryInterface;
use GuzzleHttp\Client;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Mccarlosen\LaravelMpdf\Facades\LaravelMpdf;
use Yajra\DataTables\Facades\DataTables;
use PDF;

class ReportsController extends AdminController
{
    public function __construct()
    {
        parent::__construct();
        parent::$data['active_menu'] = 'reports';
    }

    // كشف عهدة الموظف أو المخزن
    public function store_employee_testaments_report(Request $request)
    {
        if ($request->ajax()) {
            $type = intval($request->input('type'));
            $employee_or_store = $request->input('employee_or_store');
            if (empty($type) || $type != 1 && $type != 2) return response()->json(['message' => "حدث خطأ ما يرجى تحديث الصفحة وإعادة المحاولة مرة أخرى", "data" => $type], 400);
            parent::$data['data'] = $type == 1 ? User::find($employee_or_store) : Store::find($employee_or_store);
            if (parent::$data['data'])
                parent::$data['type'] = $type;
            $html = view('admin.reports.partials.store_employee_testaments_report_ajax', parent::$data)->render();
            return response()->json(compact('html','type'));
        }
        parent::$data['employees'] = User::get(['id', 'name']);
        parent::$data['testaments'] = [];
        parent::$data['stores'] = Store::get(['id', 'name']);
        return view('admin.reports.store_employee_testaments_report', parent::$data);


    }
    ////////////////////////////////
    ////////////////////////////////
    // كشف حركات الصنف
    public function items_transitions_report(Request $request)
    {
        parent::$data['items'] = Item::get(['id', 'name']);
        if ($request->ajax()) {
            $item_id = $request->get('select_item');
            $item = Item::find($item_id);
            parent::$data['item'] = $item;
            parent::$data['transactions'] = $item->transactions;
            $html = view('admin.reports.partials.items_transitions_report_ajax', parent::$data)->render();
            return response()->json(compact('html'));

        }
        parent::$data['transactions'] = [];
        return view('admin.reports.items_transitions_report', parent::$data);
    }
    ////////////////////////////////
    ////////////////////////////////
    // كشف عهدة إجمالي لأي مبنى أو إدارة عامة أو إدارة أو قسم
    public function total_testament_report(Request $request)
    {
        parent::$data['edaras'] = Edara::get();
        parent::$data['daeras'] = Daera::get();
        parent::$data['departments'] = Department::get();
        if ($request->ajax()) {
            $type = intval($request->input('type'));
            $edara_daera_department = $request->input('edara_daera_department');
            if (empty($type) || $type != 1 && $type != 2 && $type != 3) return response()->json(['message' => "حدث خطأ ما يرجى تحديث الصفحة وإعادة المحاولة مرة أخرى", "data" => $type], 400);
            if ($type == 1) {
                parent::$data['data'] = Employee::where('edara_id', '=', $edara_daera_department)->get();
                parent::$data['type'] = 'الإدارة';
            }
            if ($type == 2) {
                parent::$data['data'] = Employee::where('daera_id', '=', $edara_daera_department)->get();
                parent::$data['type'] = 'الدائرة';
            }
            if ($type == 3) {
                parent::$data['data'] = Employee::where('department_id', '=', $edara_daera_department)->get();
                parent::$data['type'] = 'القسم';
            }
            $html = view('admin.reports.partials.total_testament_report_ajax', parent::$data)->render();
            return response()->json(compact('html'));

        }

        return view('admin.reports.total_testament_report', parent::$data);
    }
    ////////////////////////////////
    ////////////////////////////////
    // كشف عهدة مفصل لأي مبنى أو إدارة عامة أو إدارة أو قسم
    public function detailed_testament_report(Request $request)
    {
        parent::$data['edaras'] = Edara::get();
        parent::$data['daeras'] = Daera::get();
        parent::$data['departments'] = Department::get();
        if ($request->ajax()) {
            $type = intval($request->input('type'));
            $edara_daera_department = $request->input('edara_daera_department');
            if (empty($type) || $type != 1 && $type != 2 && $type != 3) return response()->json(['message' => "حدث خطأ ما يرجى تحديث الصفحة وإعادة المحاولة مرة أخرى", "data" => $type], 400);
            if ($type == 1) {
                parent::$data['data'] = Employee::where('edara_id', '=', $edara_daera_department)->get();
                parent::$data['type'] = 'الإدارة';
            }
            if ($type == 2) {
                parent::$data['data'] = Employee::where('daera_id', '=', $edara_daera_department)->get();
                parent::$data['type'] = 'الدائرة';
            }
            if ($type == 3) {
                parent::$data['data'] = Employee::where('department_id', '=', $edara_daera_department)->get();
                parent::$data['type'] = 'القسم';
            }
            $html = view('admin.reports.partials.detailed_testament_report_ajax', parent::$data)->render();
            return response()->json(compact('html'));

        }
        return view('admin.reports.detailed_testament_report', parent::$data);
    }
    ////////////////////////////////
    ////////////////////////////////
    // كشف أرصدة الصنف المنفصل
    public function separate_item_balances_report()
    {
        parent::$data['items'] = Item::with(['testaments.user', 'testaments.store'])->get();

        return view('admin.reports.separate_item_balances_report', parent::$data);
    }
    ////////////////////////////////
    ////////////////////////////////
    // حركات عهدة الموظف التفصيلي
    public function detailed_employee_testament_transitions()
    {

        parent::$data['employees'] = User::with('testaments.item')->get();

        return view('admin.reports.detailed_employee_testament_transitions', parent::$data);
    }

}
