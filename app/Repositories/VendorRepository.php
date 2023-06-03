<?php

namespace App\Repositories;

use App\Models\RegistrationApplication;
use App\Models\Vendor;
use App\Repositories\Interfaces\VendorRepositoryInterface;
use Illuminate\Support\Arr;

/**
 * Class VendorRepository
 * @property VendorRepository $applicationRepository
 * @package App\Repositories
 */
class VendorRepository implements VendorRepositoryInterface
{
    /**
     * VendorRepository constructor.
     */
    function __construct()
    {
        $this->vendor = new Vendor();
    }

    /**
     * @param $id
     * @return mixed
     */
    public function get($id)
    {
        return $this->vendor->find($id);
    }

    /**
     * Get's all stores.
     *
     * @return mixed
     */
    public function all()
    {
        return $this->vendor->all();
    }

    /**
     * Deletes a store.
     *
     * @param int
     * @return int
     */
    public function delete($id)
    {
        return $this->vendor->destroy($id);
    }

    /**
     * @param array $data
     * @return mixed
     */
    public function store(array $data)
    {
        return $this->vendor->create($data);
    }

    /**
     * @param $id
     * @param array $data
     * @return mixed
     */
    public function update($id, array $data)
    {
        return $this->vendor->find($id)->update($data);
    }

    /**
     * @param array $data
     * @return $this|\Illuminate\Database\Eloquent\Builder|mixed
     */
    public function allDataTable(array $data)
    {
        $query = $this->vendor;
        $skip = 0;
        $take = 25;
        if (Arr::exists($data, "vendor_number") && !is_null($data['vendor_number'])) {
            $query = $query->where('vendor_number', 'LIKE', '%' . $data['vendor_number'] . '%');
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
        $query = $this->vendor;
        if (Arr::exists($data, "vendor_number") && !is_null($data['vendor_number'])) {
            $query = $query->where('vendor_number', 'LIKE', '%' . $data['vendor_number'] . '%');
        }
        if (Arr::exists($data, "name") && !is_null($data['name'])) {
            $query = $query->where('name', 'LIKE', '%' . $data['name'] . '%');
        }
        return $query->count('id');
    }

}

