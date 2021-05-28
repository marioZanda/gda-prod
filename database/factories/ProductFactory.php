<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Product;

class ProductFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Product::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'reference' => $this->faker->ean13,
            'name' => $this->faker->word,
            'brand' =>  $this->faker->company,
            'alert' => $this->faker->unique()->numberBetween(1, 50),
            'supplier_id' => $this->faker->numberBetween(1, 10),
            'price' => $this->faker->unique()->numberBetween(1, 1000),
            'nature' => $this->faker->randomElement(['Nat1', 'Nat2', 'Nat3']),
            'service' => $this->faker->randomElement(Product::getServices()),
            'unit' => $this->faker->randomElement(Product::getUnits()),
        ];
    }
}
