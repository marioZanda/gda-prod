<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class TeamMember extends Model
{
    use HasFactory;
    protected $fillable = [
        'firstname',
        'lastname',
        'contact',
        'team_id',
        'title'
    ];

    public function team()
    {
        return $this->belongsTo(Team::class);
    }
}
