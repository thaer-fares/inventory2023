<?php
namespace App\Repositories\ServiceProvider;

use App\Repositories\Interfaces\GradeRepositoryInterface;
use Illuminate\Support\ServiceProvider;

class BackendServiceProvider extends ServiceProvider
{
    public function register()
    {
        $this->app->bind(
            'App\Repositories\Interfaces\UserRepositoryInterface',
            'App\Repositories\UserRepository'
        );
        $this->app->bind(
            'App\Repositories\Interfaces\TransactionRepositoryInterface',
            'App\Repositories\TransactionRepository'
        );
        $this->app->bind(
            'App\Repositories\Interfaces\RoleRepositoryInterface',
            'App\Repositories\RoleRepository'
        );
        $this->app->bind(
            'App\Repositories\Interfaces\StoreRepositoryInterface',
            'App\Repositories\StoreRepository'
        );
        $this->app->bind(
            'App\Repositories\Interfaces\VendorRepositoryInterface',
            'App\Repositories\VendorRepository'
        );
        $this->app->bind(
            'App\Repositories\Interfaces\CategoryRepositoryInterface',
            'App\Repositories\CategoryRepository'
        );
        $this->app->bind(
            'App\Repositories\Interfaces\TestamentRepositoryInterface',
            'App\Repositories\TestamentRepository'
        );
        $this->app->bind(
            'App\Repositories\Interfaces\ItemRepositoryInterface',
            'App\Repositories\ItemRepository'
        );
        $this->app->bind(
            'App\Repositories\Interfaces\BatchRepositoryInterface',
            'App\Repositories\BatchRepository'
        );
        $this->app->bind(
            'App\Repositories\Interfaces\GradeRepositoryInterface',
            'App\Repositories\GradeRepository'
        );
    }
}
