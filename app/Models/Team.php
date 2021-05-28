<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use App\Models\TeamMember;
use App\Models\Superviser;

class Team extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'superviser_id',
    ];

    public function members()
    {
        return $this->hasMany(TeamMember::class);
    }

    public function superviser()
    {
        return $this->belongsTo(Superviser::class);
    }

    public function chief()
    {
        $chief = $this->hasOne(TeamMember::class)->where('title', 'CHIEF');
        return $chief;
    }

    public function of()
    {
        $of = $this->hasOne(TeamMember::class)->where('title', 'OF');
        return $of;
    }
}
