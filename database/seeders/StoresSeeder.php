<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class StoresSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \DB::table('stores')->delete();

        \DB::table('stores')->insert(array (
            0 =>
                array (
                    'name' => 'مخزن الوزارة',
                    'store_number' => 'S-01'
                ),
            1 =>
                array (
                    'name' => 'مخزن التكهين',
                    'store_number' => 'S-02'
                ),
        ));
    }
}
