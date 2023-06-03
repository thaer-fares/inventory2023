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
        Schema::create('employees', function (Blueprint $table) {
            $table->id();
            $table->string('full_name')->nullable();
            $table->string('edara')->nullable();
            $table->string('daera')->nullable();
            $table->string('department')->nullable();
            $table->string('section')->nullable();
            $table->string('edara_id')->nullable();
            $table->string('daera_id')->nullable();
            $table->string('department_id')->nullable();
            $table->string('section_id')->nullable();
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
        Schema::dropIfExists('employees');
    }
};
