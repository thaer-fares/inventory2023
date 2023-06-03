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
        Schema::create('testaments', function (Blueprint $table) {
            $table->id();
            $table->string('quantity');
            $table->enum('testament_status', [1, 2]);
            $table->text('description')->nullable();
            $table->date('return_testament_date')->nullable();
            $table->unsignedBigInteger('item_id');
            $table->unsignedBigInteger('user_id')->nullable();
            $table->unsignedBigInteger('unit_id')->nullable();
            $table->unsignedBigInteger('store_id');
            $table->unsignedBigInteger('batch_id')->nullable();
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
        Schema::dropIfExists('testaments');
    }
};
