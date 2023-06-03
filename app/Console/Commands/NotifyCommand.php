<?php

namespace App\Console\Commands;

use App\Jobs\SendSmS;
use App\Models\Notification;
use App\Models\Testament;
use Carbon\Carbon;
use Illuminate\Console\Command;

class NotifyCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'notify-employee-return-testament:run';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Execute the console command.
     *
     * @return int
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
            //  SendSmS::send_sms($testament->item->name . " " . $testament->unit->name . ": " . $testament->quantity . "يجب إرجاعها",'059xxxxxxxxx')
        }
        return Command::SUCCESS;
    }
}
