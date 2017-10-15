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
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->increments('id');
            $table->mediumText('name_ru');
            $table->mediumText('name_ro');
            $table->mediumText('name_en');
            $table->string('slug')->nullable()->index();
            $table->text('description_ru');
            $table->text('description_ro');
            $table->text('description_en');
            $table->string('category_id')->nullable()->index();
            $table->string('images');
            $table->float('price',8,2);
            $table->json('similar_products');
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
