<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Batch extends Model
{
    use HasFactory;

    protected $guarded = [];

    public $timestamps = true;

    public function testaments()
    {
        return $this->hasMany(Testament::class);
    }
}
