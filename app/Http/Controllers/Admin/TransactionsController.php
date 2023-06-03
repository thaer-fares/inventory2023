<?php

namespace App\Http\Controllers\Admin;

use App\Models\Item;
use App\Models\Store;
use App\Models\User;
use App\Repositories\Interfaces\TransactionRepositoryInterface;
use Illuminate\Http\Request;
use Yajra\DataTables\Facades\DataTables;

class TransactionsController extends AdminController
{

    /**
     * TransactionsController constructor.
     * @param TransactionRepositoryInterface $transaction_repo
     */
    public function __construct(TransactionRepositoryInterface $transaction_repo)
    {
        parent::__construct();
        $this->transaction_repo = $transaction_repo;
        parent::$data['active_menu'] = 'transactions';
    }

    ////////////////////////////////
    public function getIndex()
    {
        parent::$data['users'] = User::all();
        parent::$data['items'] = Item::all();
        parent::$data['stores'] = Store::all();
        return view('admin.transactions.view', parent::$data);
    }
    ////////////////////////////////

    /**
     * @param Request $request
     * @return mixed
     * @throws \Exception
     */
    public function getList(Request $request)
    {
        $info = $this->transaction_repo->allDataTable($request->all());
        $count = $this->transaction_repo->countDataTable($request->all());
        $dataTable = Datatables::of($info)->setTotalRecords($count);


        $dataTable->addColumn('old_store', function ($row) {
            if ($row->old_store === null) return '-';
            else {
                $store = Store::find($row->old_store);
                return $store->name;
            }
        });
        $dataTable->addColumn('new_store', function ($row) {
            if ($row->new_store === null) return '-';
            else {
                $store = Store::find($row->new_store);
                return $store->name;
            }
        });
        $dataTable->addColumn('old_user', function ($row) {
            if ($row->old_user === null) return '-';
            else {
                $user = User::find($row->old_user);
                return $user->name;
            }
        });
        $dataTable->addColumn('new_user', function ($row) {
            if ($row->new_user === null) return '-';
            else{
                $user = User::find($row->new_user);
                return $user->name;
            }
        });
        $dataTable->addColumn('item', function ($row) {
            return $row->item->name;
        });

        $dataTable->addColumn('type', function ($row) {
            $data['type'] = $row->type;

            return view('admin.transactions.parts.type', $data)->render();
        });
        $dataTable->escapeColumns(['*']);
        return $dataTable->make(true);
    }

}
