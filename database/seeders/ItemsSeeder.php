<?php

namespace Database\Seeders;

use App\Models\Category;
use App\Models\Item;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ItemsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        $data = DB::table('items_tmp')->get();
        $counter = 1;
        DB::table('items')->delete();
        foreach ($data as $item){
            $counter += 1;
            Item::create([
                'name'=> $item->title,
                'total_quantity'=>$item->quantity,
                'available_quantity'=>$item->quantity,
                'item_status'=>1,
                'item_number'=> 1000 + $counter,
                'store_id'=>1
            ]);
        }

    }
}
