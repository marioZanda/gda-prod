<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\TeamMember;

class TeamMemberFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = TeamMember::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'firstname' => $this->faker->name,
            'lastname' => $this->faker->name,
            'contact' =>  $this->faker->e164PhoneNumber,
            'team_id' => $this->faker->numberBetween(1, 10),
            'title' => $this->faker->randomElement(['CHIEF','OF']),

        ];
    }
}
