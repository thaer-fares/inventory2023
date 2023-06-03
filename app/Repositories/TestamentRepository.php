<?php

namespace App\Repositories;

use App\Models\Item;
use App\Models\RegistrationApplication;
use App\Models\Testament;
use Illuminate\Support\Arr;
use App\Repositories\Interfaces\TestamentRepositoryInterface;

/**
 * Class TestamentRepository
 * @property TestamentRepository $applicationRepository
 * @package App\Repositories
 */
class TestamentRepository implements TestamentRepositoryInterface
{
    /**
     * TestamentRepository constructor.
     */
    function __construct()
    {
        $this->testament = new Testament();
    }

    /**
     * @param $id
     * @return mixed
     */
    public function get($id)
    {
        return $this->testament->find($id);
    }

    /**
     * Get's all stores.
     *
     * @return mixed
     */
    public function all()
    {
        return $this->testament->all();
    }

    /**
     * Deletes a store.
     *
     * @param int
     * @return int
     */
    public function delete($id)
    {
        return $this->testament->destroy($id);
    }

    /**
     * @param array $data
     * @return mixed
     */
    public function store(array $data)
    {
        return $this->testament->create($data);
    }

    /**
     * @param $id
     * @param array $data
     * @return mixed
     */
    public function update($id, array $data)
    {
        return $this->testament->find($id)->update($data);
    }

    /**
     * @param array $data
     * @return $this|\Illuminate\Database\Eloquent\Builder|mixed
     */
    public function allDataTable(array $data)
    {
        $query = $this->testament;
        $skip = 0;
        $take = 25;
        if (Arr::exists($data, "testament_status") && !is_null($data['testament_status'])) {
            $query = $query->where('testament_status', 'LIKE', '%' . $data['testament_status'] . '%');
        }
        if (Arr::exists($data, "user") && !is_null($data['user'])) {
            $query = $query->where('user_id', 'LIKE', '%' . $data['user'] . '%');
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
        $query = $this->testament;
        if (Arr::exists($data, "testament_status") && !is_null($data['testament_status'])) {
            $query = $query->where('testament_status', 'LIKE', '%' . $data['testament_status'] . '%');
        }
        if (Arr::exists($data, "user") && !is_null($data['user'])) {
            $query = $query->where('user_id', 'LIKE', '%' . $data['user'] . '%');
        }
        return $query->count('id');
    }

}

