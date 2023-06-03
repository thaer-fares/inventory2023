<?php

namespace App\Repositories;

use App\Models\Transaction;
use App\Repositories\Interfaces\TransactionRepositoryInterface;
use Illuminate\Support\Arr;

/**
 * Class TransactionRepository
 * @property TransactionRepository $applicationRepository
 * @package App\Repositories
 */
class TransactionRepository implements TransactionRepositoryInterface
{
    /**
     * transactionsRepository constructor.
     */
    function __construct()
    {
        $this->transaction = new Transaction();
    }

    /**
     * @param $id
     * @return mixed
     */
    public function get($id)
    {
        return $this->transaction->find($id);
    }

    /**
     * Get's all stores.
     *
     * @return mixed
     */
    public function all()
    {
        return $this->transaction->all();
    }

    /**
     * Deletes a store.
     *
     * @param int
     * @return int
     */
    public function delete($id)
    {
        return $this->transaction->destroy($id);
    }

    /**
     * @param array $data
     * @return mixed
     */
    public function store(array $data)
    {
        return $this->transaction->create($data);
    }

    /**
     * @param $id
     * @param array $data
     * @return mixed
     */
    public function update($id, array $data)
    {
        return $this->transaction->find($id)->update($data);
    }

    /**
     * @param array $data
     * @return $this|\Illuminate\Database\Eloquent\Builder|mixed
     */
    public function allDataTable(array $data)
    {
        $query = $this->transaction;
        $skip = 0;
        $take = 25;
        if (Arr::exists($data, "transaction_type") && !is_null($data['transaction_type'])) {
            $query = $query->where('type', '=',  $data['transaction_type']);
        }
        if (Arr::exists($data, "item") && !is_null($data['item'])) {
            $query = $query->where('item_id', '=',  $data['item']);
        }
        if (Arr::exists($data, "user") && !is_null($data['user'])) {
            $query = $query->where(function ($q) use ($data) {
                $q->where('new_user', '=', $data['user'])
                    ->orWhere('old_user', '=', $data['user']);
            });
        }
        if (Arr::exists($data, "store") && !is_null($data['store'])) {
            $query = $query->where(function ($q) use ($data) {
                $q->where('new_store', '=', $data['store'])
                    ->orWhere('old_store', '=', $data['store']);
            });
        }
        if (Arr::exists($data, "start") && !is_null($data['start'])) {
            $skip = $data['start'];
        }
        if (Arr::exists($data, "length") && !is_null($data['length'])) {
            $take = $data['length'];
        }
        return $query->skip($skip)->take($take);
    }

    /**
     * @param array $data
     * @return mixed
     */
    public function countDataTable(array $data)
    {
        $query = $this->transaction;
        if (Arr::exists($data, "transaction_type") && !is_null($data['transaction_type'])) {
            $query = $query->where('type', '=',  $data['transaction_type']);
        }
        if (Arr::exists($data, "user") && !is_null($data['user'])) {
            $query = $query->where(function ($q) use ($data) {
                $q->where('new_user', '=', $data['user'])
                    ->orWhere('old_user', '=', $data['user']);
            });
        }
        if (Arr::exists($data, "store") && !is_null($data['store'])) {
            $query = $query->where(function ($q) use ($data) {
                $q->where('new_store', '=', $data['store'])
                    ->orWhere('old_store', '=', $data['store']);
            });
        }
        if (Arr::exists($data, "item") && !is_null($data['item'])) {
            $query = $query->where('item_id', '=',  $data['item']);
        }
        return $query->count('id');
    }

}

