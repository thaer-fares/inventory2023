<?php

namespace App\Repositories;

use App\Models\RegistrationApplication;
use App\Models\Store;
use Illuminate\Support\Arr;
use App\Repositories\Interfaces\StoreRepositoryInterface;

/**
 * Class StoreRepository
 * @property StoreRepository $applicationRepository
 * @package App\Repositories
 */
class StoreRepository implements StoreRepositoryInterface
{
    /**
     * StoreRepository constructor.
     */
    function __construct()
    {
        $this->store = new Store();
    }

    /**
     * @param $id
     * @return mixed
     */
    public function get($id)
    {
        return $this->store->find($id);
    }

    /**
     * Get's all stores.
     *
     * @return mixed
     */
    public function all()
    {
        return $this->store->all();
    }

    /**
     * Deletes a store.
     *
     * @param int
     * @return int
     */
    public function delete($id)
    {
        return $this->store->destroy($id);
    }

    /**
     * @param array $data
     * @return mixed
     */
    public function store(array $data)
    {
        return $this->store->create($data);
    }

    /**
     * @param $id
     * @param array $data
     * @return mixed
     */
    public function update($id, array $data)
    {
        return $this->store->find($id)->update($data);
    }

    /**
     * @param array $data
     * @return $this|\Illuminate\Database\Eloquent\Builder|mixed
     */
    public function allDataTable(array $data)
    {
        $query = $this->store;
        $skip = 0;
        $take = 25;
        if (Arr::exists($data, "name") && !is_null($data['name'])) {
            $query = $query->where('name', 'LIKE', '%' . $data['name'] . '%');
        }
        if (Arr::exists($data, "store_number") && !is_null($data['store_number'])) {
            $query = $query->where('store_number', 'LIKE', '%' . $data['store_number'] . '%');
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
        $query = $this->store;
        if (Arr::exists($data, "name") && !is_null($data['name'])) {
            $query = $query->where('name', 'LIKE', '%' . $data['name'] . '%');
        }
        if (Arr::exists($data, "store_number") && !is_null($data['store_number'])) {
            $query = $query->where('store_number', 'LIKE', '%' . $data['store_number'] . '%');
        }
        return $query->count('id');
    }

}

