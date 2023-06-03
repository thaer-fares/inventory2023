<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class StoresTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {

        \DB::table('stores')->delete();

        \DB::table('stores')->insert(array(
            0 => [
                'id' => 1,
                'name' => 'مخزن الرئيسي',
                'store_number' => '100',

            ],
            1 => [
                'id' => 2,
                'name' => 'مخزن التكهين',
                'store_number' => '200',

            ],
        ));
    }
}
