<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Transaction extends Model
{
    use HasFactory;

    public $timestamps = true;

    protected $guarded = [];

    public function item()
    {
        return $this->belongsTo(Item::class);
    }



    public function _old_user()
    {
        return $this->belongsTo(User::class, 'old_user')->withDefault('_');
    }
    public function _new_user()
    {
        return $this->belongsTo(User::class, 'new_user')->withDefault('_');
    }

    public function _old_store()
    {
        return $this->belongsTo(Store::class, 'old_store')->withDefault('_');
    }
    public function _new_store()
    {
        return $this->belongsTo(Store::class, 'new_store')->withDefault('_');
    }
    public function testament()
    {
        return $this->belongsTo(Testament::class,'testament_id')->withDefault('_');
    }
}
