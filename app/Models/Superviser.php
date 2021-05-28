<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Superviser extends Model
{
    use HasFactory;

    protected $fillable = [
        'firstname',
        'lastname',
        'contact',
        'domain',
    ];

    public function teams()
    {
        return $this->hasMany(Team::class);
    }

    public static function getDomains()
    {
        return array('Menuiserie','Peinture','Sol','MultiService');
    }
}
