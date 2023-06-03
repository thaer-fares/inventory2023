<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Item extends Model
{
    use HasFactory;

    public $timestamps = true;
    protected $guarded = [];

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function store()
    {
        return $this->belongsTo(Store::class);
    }

    public function transactions(){
        return $this->hasMany(Transaction::class, 'item_id');
    }

    public function testaments(){
        return $this->hasMany(Testament::class, 'item_id');
    }
}
