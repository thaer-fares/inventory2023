<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('items', function (Blueprint $table) {
            $table->foreign('category_id')->references('id')->on('categories')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('store_id')->references('id')->on('stores')->onDelete('cascade')->onUpdate('cascade');
        });
        Schema::table('batches', function (Blueprint $table) {
            $table->foreign('item_id')->references('id')->on('items')->onDelete('cascade')->onUpdate('cascade');
        });
        Schema::table('transactions', function (Blueprint $table) {
            $table->foreign('new_user')->references('id')->on('users')->onDelete('set null')->onUpdate('cascade');
            $table->foreign('old_user')->references('id')->on('users')->onDelete('set null')->onUpdate('cascade');
            $table->foreign('old_store')->references('id')->on('stores')->onDelete('set null')->onUpdate('cascade');
            $table->foreign('new_store')->references('id')->on('stores')->onDelete('set null')->onUpdate('cascade');
            $table->foreign('item_id')->references('id')->on('items')->onDelete('set null')->onUpdate('cascade');
            $table->foreign('testament_id')->references('id')->on('testaments')->onDelete('set null')->onUpdate('cascade');
        });
        Schema::table('testaments', function (Blueprint $table) {
            $table->foreign('batch_id')->references('id')->on('batches')->onDelete('set null')->onUpdate('cascade');
            $table->foreign('user_id')->references('id')->on('users')->onDelete('set null')->onUpdate('cascade');
            $table->foreign('item_id')->references('id')->on('items')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('unit_id')->references('id')->on('units')->onDelete('set null')->onUpdate('cascade');
            $table->foreign('store_id')->references('id')->on('stores')->onDelete('cascade')->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('testaments', function (Blueprint $table) {
            $table->dropForeign(['batch_id']);
            $table->dropForeign(['user_id']);
            $table->dropForeign(['item_id']);
            $table->dropForeign(['unit_id']);
            $table->dropForeign(['store_id']);
        });
        Schema::table('transactions', function (Blueprint $table) {
            $table->dropForeign(['new_user']);
            $table->dropForeign(['old_user']);
            $table->dropForeign(['old_store']);
            $table->dropForeign(['new_store']);
            $table->dropForeign(['item_id']);
        });
        Schema::table('batches', function (Blueprint $table) {
            $table->dropForeign(['item_id']);
        });
        Schema::table('items', function (Blueprint $table) {
            $table->dropForeign(['category_id']);
            $table->dropForeign(['store_id']);
        });
    }

};
