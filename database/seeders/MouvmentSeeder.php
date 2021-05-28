<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Mouvment;

class MouvmentSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \App\Models\Mouvment::factory(10)->create();
    }
}
