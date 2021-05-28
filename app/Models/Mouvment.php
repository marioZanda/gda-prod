<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use App\Models\Team;
use App\Models\Product;

class Mouvment extends Model
{
    use HasFactory;

    protected $fillable = [
        'action',
        'product_id',
        'quantity',
        'note',
        'team_member_id',
        'user_id',
    ];

    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    public function member()
    {
        return $this->belongsTo(TeamMember::class, 'team_member_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public static function getActions()
    {
        return array('IN','OUT');
    }
}
