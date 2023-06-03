<?php

namespace App\Repositories;

use App\Models\Batch;
use App\Models\RegistrationApplication;
use App\Repositories\Interfaces\BatchRepositoryInterface;
use Illuminate\Support\Arr;

/**
 * Class BatchRepository
 * @property BatchRepository $applicationRepository
 * @package App\Repositories
 */
class BatchRepository implements BatchRepositoryInterface
{
    /**
     * StoreRepository constructor.
     */
    function __construct()
    {
        $this->batch = new Batch();
    }

    /**
     * @param $id
     * @return mixed
     */
    public function get($id)
    {
        return $this->batch->find($id);
    }

    /**
     * Get's all stores.
     *
     * @return mixed
     */
    public function all()
    {
        return $this->batch->all();
    }

    /**
     * Deletes a store.
     *
     * @param int
     * @return int
     */
    public function delete($id)
    {
        return $this->batch->destroy($id);
    }

    /**
     * @param array $data
     * @return mixed
     */
    public function store(array $data)
    {
        return $this->batch->create($data);
    }

    /**
     * @param $id
     * @param array $data
     * @return mixed
     */
    public function update($id, array $data)
    {
        return $this->batch->find($id)->update($data);
    }

    /**
     * @param array $data
     * @return $this|\Illuminate\Database\Eloquent\Builder|mixed
     */
    public function allDataTable(array $data)
    {
        $query = $this->batch;
        $skip = 0;
        $take = 25;
        if (Arr::exists($data, "description") && !is_null($data['description'])) {
            $query = $query->where('description', 'LIKE', '%' . $data['description'] . '%');
        }
        if (Arr::exists($data, "name") && !is_null($data['name'])) {
            $query = $query->where('name', 'LIKE', '%' . $data['name'] . '%');
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
        $query = $this->batch;
        if (Arr::exists($data, "description") && !is_null($data['description'])) {
            $query = $query->where('description', 'LIKE', '%' . $data['description'] . '%');
        }
        if (Arr::exists($data, "name") && !is_null($data['name'])) {
            $query = $query->where('name', 'LIKE', '%' . $data['name'] . '%');
        }

        return $query->count('id');
    }

}

