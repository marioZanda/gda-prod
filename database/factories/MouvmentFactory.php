<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Mouvment;

class MouvmentFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Mouvment::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'action' => $this->faker->randomElement(Mouvment::getActions()),
            'product_id' => $this->faker->numberBetween(1, 10),
            'quantity' => $this->faker->numberBetween(1, 10),
            'note' =>  $this->faker->realText(),
            'team_id' => $this->faker->numberBetween(1, 10),
            'user_id' => 1,
        ];
    }
}
