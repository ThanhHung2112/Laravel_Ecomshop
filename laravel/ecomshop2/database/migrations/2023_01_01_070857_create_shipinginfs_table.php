<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('shipinginfs', function (Blueprint $table) {
            $table->id();
            $table->integer('user_id');
            $table->string('city_name');
            $table->string('phone_number');
            $table->string('address');
            $table->string('node');
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
        Schema::dropIfExists('shipinginfs');
    }
};
