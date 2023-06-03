<?php

namespace App\Listeners;

use App\Events\TestamentReturnEvent;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Support\Facades\Mail;

class TestamentReturnReminder
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  \App\Events\TestamentReturnEvent  $event
     * @return void
     */
    public function handle(TestamentReturnEvent $event)
    {
        //
        $testament = $event->testament;
        $user = $testament->user;
        $itemName = $testament->item->name;
        $email = $user->email;

        $message = "Dear " . $user->name . ",\n\n";
        $message .= "This is a reminder that the item " . $itemName . " that you borrowed is due to be returned on " . $testament->return_date . ".\n\n";
        $message .= "Please return the item as soon as possible to avoid any late fees.\n\n";
        $message .= "Best regards,\nThe Library Team";

        Mail::raw($message, function($m) use ($email) {
            $m->to($email)->subject('Item Return Reminder');
        });
    }
}
