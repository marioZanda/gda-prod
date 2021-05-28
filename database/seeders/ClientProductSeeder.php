<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class ClientProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \App\Models\client_product::factory(10)->create();
    }
}