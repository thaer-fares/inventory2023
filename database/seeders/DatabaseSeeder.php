<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {

        $this->call(EmployeeSeeder::class);
        $this->call(UsersTableSeeder::class);
        $this->call(UnitsSeeder::class);
        $this->call(PasswordResetsTableSeeder::class);
        $this->call(PermissionGroupTableSeeder::class);
        $this->call(PermissionsTableSeeder::class);
        $this->call(RolesTableSeeder::class);
        $this->call(ModelHasRolesTableSeeder::class);
        $this->call(RoleHasPermissionsTableSeeder::class);
        $this->call(ModelHasPermissionsTableSeeder::class);
        $this->call(FailedJobsTableSeeder::class);
        // seed two stores
        $this->call(StoresSeeder::class);
        // seed one vendor
        $this->call(VendorsSeeder::class);
        $this->call(StoresTableSeeder::class);
        $this->call(VendorsTableSeeder::class);
        $this->call(DaeraSeeder::class);
        $this->call(EdaraSeeder::class);
        $this->call(DepartmentSeeder::class);
    }
}
