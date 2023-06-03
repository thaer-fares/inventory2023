<?php

namespace App\Providers;

use App\Models\Batch;
use App\Models\Item;
use App\Models\Notification;
use App\Models\Store;
use App\Models\Testament;
use App\Models\Transaction;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\DB;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        //
        Testament::created(function ($testament) {
            DB::transaction(function () use ($testament) {
                Transaction::create([
                    'type' => 1,
                    'old_store' => $testament->store_id,
                    'new_user' => $testament->user_id,
                    'item_id' => $testament->item_id,
                    'description' => "تم إضافة " . $testament->item->name . " " . $testament->unit->name . ": " . $testament->quantity . " على الموظف " . $testament->user->name,
                ]);
                Notification::create([
                    'body'=> "تم إضافة " . $testament->item->name . " " . $testament->unit->name . ": " . $testament->quantity . " على ذمتك",
                    'url'=> route('admin.dashboard.view'),
                    'user_id'=>$testament->user_id
                ]);
            });
        });
        Testament::updating(function ($testament) {
            DB::transaction(function () use ($testament) {
                $oldStore = $testament->getOriginal('store_id');
                $oldEmployee = $testament->getOriginal('user_id');
                $trans = new Transaction();
                if ($oldEmployee !== $testament->user_id) {
                    $user = User::find($oldEmployee);
                    $trans->type = 2;
                    $trans->old_user = $oldEmployee;
                    $trans->new_user = $testament->user_id;
                    $trans->item_id = $testament->item_id;
                    $trans->description = "تم تحويل " . $testament->item->name . " " . $testament->unit->name . ": " . $testament->quantity . " من الموظف " . $testament->user->name . " إلى الموظف " . $user->name . " في الموافق: " . Carbon::now();
                    $trans->save();
                    Notification::create([
                        'body'=> "تم نقل " . $testament->item->name . " " . $testament->unit->name . ": " . $testament->quantity . " من ذمتك",
                        'url'=> route('admin.dashboard.view'),
                        'user_id'=>$oldEmployee
                    ]);
                    Notification::create([
                        'body'=> "تم إضافة " . $testament->item->name . " " . $testament->unit->name . ": " . $testament->quantity . " على ذمتك",
                        'url'=> route('admin.dashboard.view'),
                        'user_id'=>$testament->user_id
                    ]);
                }
                if ($oldStore !== $testament->store_id) {
                    if ($oldStore !== $testament->store_id) {
                        $store = Store::find($oldStore);
                        $trans->old_store = $store->id;
                        $trans->new_store = $testament->store_id;
                        $trans->item_id = $testament->item_id;
                        $trans->type = 4;
                        $trans->description = "تم تحويل " . $testament->item->name . " " . $testament->unit->name . ": " . $testament->quantity . " من " . $store->name . " إلى " . $testament->store->name . " في الموافق: " . Carbon::now();
                        $trans->save();
                    }
                }
            });
        });

        Testament::deleted(function ($testament) {
            DB::transaction(function () use ($testament) {
                Transaction::create([
                    'type' => 3,
                    'old_user' => $testament->user_id,
                    'new_store' => $testament->store_id,
                    'item_id' => $testament->item_id,
                    'description' => "تم إرجاع " . $testament->item->name . " " . $testament->unit->name . ": " . $testament->quantity . " إلى " . $testament->store->name,
                ]);
                Notification::create([
                    'body'=> "تم إرجاع من ذمتك " . $testament->item->name . " " . $testament->unit->name . ": " . $testament->quantity . " إلى " . $testament->store->name,
                    'url'=> route('admin.dashboard.view'),
                    'user_id'=>$testament->user_id
                ]);
            });
        });
    }
}
