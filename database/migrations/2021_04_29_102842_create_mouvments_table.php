<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;
use App\Models\Mouvment;

class CreateMouvmentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('mouvments', function (Blueprint $table) {
            $table->id();
            $table->enum('action', Mouvment::getActions());
            $table->foreignId('product_id')->constrained('products');
            $table->integer('quantity');
            $table->string('note')->nullable();
            $table->foreignId('team_member_id')->nullable()->constrained('team_members');
            $table->foreignId('user_id')->constrained('users');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('mouvments');
    }
}
