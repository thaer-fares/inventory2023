<?php

namespace App\Repositories;

use App\Models\RegistrationApplication;
use App\Models\Item;
use Illuminate\Support\Arr;
use App\Repositories\Interfaces\ItemRepositoryInterface;

/**
 * Class ItemRepository
 * @property ItemRepository $applicationRepository
 * @package App\Repositories
 */
class ItemRepository implements ItemRepositoryInterface
{
    /**
     * ItemRepository constructor.
     */
    function __construct()
    {
        $this->item = new Item();
    }

    /**
     * @param $id
     * @return mixed
     */
    public function get($id)
    {
        return $this->item->find($id);
    }

    /**
     * Get's all stores.
     *
     * @return mixed
     */
    public function all()
    {
        return $this->item->all();
    }

    /**
     * Deletes a store.
     *
     * @param int
     * @return int
     */
    public function delete($id)
    {
        return $this->item->destroy($id);
    }

    /**
     * @param array $data
     * @return mixed
     */
    public function store(array $data)
    {
        return $this->item->create($data);
    }
    /**
     * @param array $data
     * @return mixed
     */
    public function storeMany(array $data)
    {
        return $this->item->insert($data);
    }

    /**
     * @param $id
     * @param array $data
     * @return mixed
     */
    public function update($id, array $data)
    {
        return $this->item->find($id)->update($data);
    }

    /**
     * @param array $data
     * @return $this|\Illuminate\Database\Eloquent\Builder|mixed
     */
    public function allDataTable(array $data)
    {
        $query = $this->item;
        $skip = 0;
        $take = 25;
        if (Arr::exists($data, "name") && !is_null($data['name'])) {
            $query = $query->where('name', 'LIKE', '%' . $data['name'] . '%');
        }
        if (Arr::exists($data, "item_number") && !is_null($data['item_number'])) {
            $query = $query->where('item_number', '=', '%' . $data['item_number'] . '%');
        }
        if (Arr::exists($data, "item_status") && !is_null($data['item_status'])) {
            $query = $query->where('item_status', '=', $data['item_status'] );
        }
        if (Arr::exists($data, "category") && !is_null($data['category'])) {
            $query = $query->where('category_id', '=',  $data['category'] );
        }
        if (Arr::exists($data, "store") && !is_null($data['store'])) {
            $query = $query->where('store_id', '=', $data['store']);
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
        $query = $this->item;
        if (Arr::exists($data, "name") && !is_null($data['name'])) {
            $query = $query->where('name', 'LIKE', '%' . $data['name'] . '%');
        }
        if (Arr::exists($data, "item_number") && !is_null($data['item_number'])) {
            $query = $query->where('item_number', '=', '%' . $data['item_number'] . '%');
        }
        if (Arr::exists($data, "item_status") && !is_null($data['item_status'])) {
            $query = $query->where('item_status', '=', $data['item_status'] );
        }
        if (Arr::exists($data, "category") && !is_null($data['category'])) {
            $query = $query->where('category_id', '=',  $data['category'] );
        }
        if (Arr::exists($data, "store") && !is_null($data['store'])) {
            $query = $query->where('store_id', '=', $data['store']);
        }
        return $query->count('id');
    }

}

