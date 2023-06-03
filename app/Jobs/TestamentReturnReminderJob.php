<?php

namespace App\Jobs;

use App\Models\Notification;
use App\Models\Testament;
use Carbon\Carbon;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldBeUnique;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use App\Events\TestamentReturnEvent;

class TestamentReturnReminderJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {

        $testaments = Testament::where('return_testament_date', '=', Carbon::now()->toDateString())->get();
        foreach ($testaments as $testament) {
            Notification::create([
                'body' => $testament->item->name . " " . $testament->unit->name . ": " . $testament->quantity . "يجب إرجاعها",
                "url" => route('admin.dashboard.view'),
                "user_id" => $testament->user_id
            ]);
        }

    }
}
