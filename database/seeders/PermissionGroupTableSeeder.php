<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class PermissionGroupTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        

        \DB::table('permission_group')->delete();
        
        
        
    }
}