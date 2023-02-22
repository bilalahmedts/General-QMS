<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddColumnsToVoiceAudits extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('voice_audits', function (Blueprint $table) {
            $table->date('audit_date')->nullable(); 
            $table->date('date_of_chat_email')->nullable(); 
            $table->string('ticket_number',15)->default(0);
            $table->string('customer_feedback')->default(0);
            $table->integer('customer_rating')->default(1);

            $table->string('start_time',120)->default(0);
            $table->string('queue',120)->default(0); 
            $table->string('agent_group',100)->default(0);
            $table->string('caller',100)->default(0);
            $table->string('ast_clid',100)->default(0);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('voice_audits', function (Blueprint $table) {
            //
        });
    }
}
