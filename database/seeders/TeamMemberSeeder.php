<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class TeamMemberSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \App\Models\TeamMember::factory(10)->create();
    }
}
