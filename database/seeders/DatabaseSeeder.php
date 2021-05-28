<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Superviser;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        \App\Models\User::factory(1)->create();
        /*$this->call([
            SupplierSeeder::class,
            SuperviserSeeder::class,
            TeamSeeder::class,
            TeamMemberSeeder::class,
            ProductSeeder::class,
            StockSeeder::class,
            MouvmentSeeder::class,
            ClientSeeder::class,
            ClientProductSeeder::class,
        ]);*/
    }
}
