<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class VendorsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \DB::table('vendors')->delete();

        \DB::table('vendors')->insert(array(
            0 => [
                'id' => 1,
                'name' => 'المشتريات',
                'vendor_number' => '1000',

            ],
        ));
    }
}
