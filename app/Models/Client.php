<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Client extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'address',
        'contact',
        'superviser_id'
    ];

    public function products()
    {
        return $this->belongsToMany(Product::class,'client_products');
    }

    public function superviser()
    {
        return $this->belongsTo(Superviser::class);
    }
}
