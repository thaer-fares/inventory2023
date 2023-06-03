<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Testament extends Model
{
    use HasFactory;

    protected $guarded = [];

    public $timestamps = true;
    protected $casts = [
        'return_testament_date' => 'date',
    ];


    public function batch()
    {
        return $this->belongsTo(Batch::class);
    }

    public function item()
    {
        return $this->belongsTo(Item::class);
    }

    public function store()
    {
        return $this->belongsTo(Store::class);
    }

    public function unit()
    {
        return $this->belongsTo(Unit::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function transactions()
    {
        $this->hasMany(Transaction::class);
    }

}
