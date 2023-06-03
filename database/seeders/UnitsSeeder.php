<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class UnitsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        \DB::table('units')->delete();
        \DB::table('units')->insert(array(
            0 => [
                'id'=> 1,
                'name' => 'عدد',
            ],
            1 => [
                'id'=> 2,
                'name' => 'كرتونة',
            ],
        ));
    }
}
