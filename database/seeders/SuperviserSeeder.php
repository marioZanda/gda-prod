<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class SuperviserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \App\Models\Superviser::factory(10)->create();
    }
}
