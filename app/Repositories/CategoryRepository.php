<?php

namespace App\Repositories;

use App\Models\Category;
use App\Models\RegistrationApplication;
use App\Repositories\Interfaces\CategoryRepositoryInterface;
use Illuminate\Support\Arr;

/**
 * Class CategoryRepository
 * @property CategoryRepository $applicationRepository
 * @package App\Repositories
 */
class CategoryRepository implements CategoryRepositoryInterface
{
    /**
     * StoreRepository constructor.
     */
    function __construct()
    {
        $this->category = new Category();
    }

    /**
     * @param $id
     * @return mixed
     */
    public function get($id)
    {
        return $this->category->find($id);
    }

    /**
     * Get's all stores.
     *
     * @return mixed
     */
    public function all()
    {
        return $this->category->all();
    }

    /**
     * Deletes a store.
     *
     * @param int
     * @return int
     */
    public function delete($id)
    {
        return $this->category->destroy($id);
    }

    /**
     * @param array $data
     * @return mixed
     */
    public function store(array $data)
    {
        return $this->category->create($data);
    }

    /**
     * @param $id
     * @param array $data
     * @return mixed
     */
    public function update($id, array $data)
    {
        return $this->category->find($id)->update($data);
    }

    /**
     * @param array $data
     * @return $this|\Illuminate\Database\Eloquent\Builder|mixed
     */
    public function allDataTable(array $data)
    {
        $query = $this->category;
        $skip = 0;
        $take = 25;
        if (Arr::exists($data, "parent_item") && !is_null($data['parent_item'])) {
            $query = $query->where('parent_id', '=' ,$data['parent_item'] );
        }
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
        $query = $this->category;
        if (Arr::exists($data, "description") && !is_null($data['description'])) {
            $query = $query->where('description', 'LIKE', '%' . $data['description'] . '%');
        }
        if (Arr::exists($data, "parent_item") && !is_null($data['parent_item'])) {
            $query = $query->where('parent_id', '=' ,$data['parent_item'] );
        }
        if (Arr::exists($data, "name") && !is_null($data['name'])) {
            $query = $query->where('name', 'LIKE', '%' . $data['name'] . '%');
        }

        return $query->count('id');
    }

}

