<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */

    public function boot()
    {
        Schema::defaultStringLength(191);
    }

    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name_ru');
            $table->string('name_ro');
            $table->string('name_en');
            $table->string('slug')->nullable()->index();
            $table->text('description_ru');
            $table->text('description_ro');
            $table->text('description_en');
            $table->string('category_id');
            $table->string('images');
            $table->float('price',8,2);
            $table->text('similar_products');
            $table->boolean('status');
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
