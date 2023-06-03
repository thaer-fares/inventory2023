<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Mpdf\Http\Request;
use function Symfony\Component\String\s;

class NotificationController extends AdminController
{
    public function __construct()
    {

    }

    public function readAll()
    {
        $notifications = Auth::user()->notifications;
        foreach ($notifications as $note){
            $note->opened = true;
            $note->save();
        }
        return redirect()->back();
    }
}
