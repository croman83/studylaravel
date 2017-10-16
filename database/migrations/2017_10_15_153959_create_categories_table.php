<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCategoriesTable extends Migration
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
        Schema::create('categories', function (Blueprint $table) {
            $table->increments('id');
            $table->text('name_ru');
            $table->text('name_ro');
            $table->text('name_en');
            $table->string('slug')->nullable()->index();
            $table->string('image', 100);
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
        Schema::dropIfExists('categories');
    }
}
