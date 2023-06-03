<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    use HasFactory;

    public $timestamps = true;
    protected $fillable = [
        'parent_id',
        'name',
        'description',
        'is_active',
    ];

    public function items()
    {
        return $this->hasMany(Item::class);
    }

    public function parent_category()
    {
        return $this->belongsTo(Category::class);
    }
}
