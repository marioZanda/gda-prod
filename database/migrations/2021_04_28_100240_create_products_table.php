<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;
use App\Models\Product;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('reference', 255)->unique();
            $table->string('name', 255);
            $table->string('brand', 255)->nullable();
            $table->integer('alert');
            $table->foreignId('supplier_id')->nullable()->constrained('suppliers');
            $table->double('price');
            $table->enum('service', Product::getServices());
            $table->string('nature');
            $table->enum('unit', Product::getUnits());
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
        Schema::dropIfExists('products');
    }
}
