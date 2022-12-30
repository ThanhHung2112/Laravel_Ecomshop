<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Cart;
use Illuminate\Http\Request;

class OderController extends Controller
{
    public function Index(){
        $alloder = Cart::latest()->get();
        return view('admin.pendingoder', compact('alloder'));
    }
    public function DeleteOrder ($id){
        Cart::findOrFail($id)->delete();
        return redirect()->route('pendingoder')->with('message', 'Order Deleted Succesfully!');
    }
}
