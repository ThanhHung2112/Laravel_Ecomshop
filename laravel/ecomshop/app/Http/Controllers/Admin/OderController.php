<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class OderController extends Controller
{
    public function Index(){
        return view('admin.pendingoder');
    }
}
