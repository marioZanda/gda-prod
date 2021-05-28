<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class client_product extends Model
{
    use HasFactory;

    protected $fillable = [
        'client_id',
        'product_id'
    ];
}
