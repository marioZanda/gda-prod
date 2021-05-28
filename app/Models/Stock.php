<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Stock extends Model
{
    use HasFactory;

    protected $fillable = [
        'product_id',
        'value',
    ];

    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    public static function getServices()
    {
        return array('Menuiserie','Peinture','Sol','MultiService','Plomberie','Outillage');
    }
}
