<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Cart;
use App\Models\Order;
use App\Models\Total;
use Illuminate\Http\Request;

class OderController extends Controller
{
    public function Index(){
        $allorder = Order::latest()->get();
        return view('admin.pendingoder', compact('allorder'));
    }
    public function DeleteOrder ($id){
        Order::findOrFail($id)->delete();
        return redirect()->route('pendingorder')->with('message', 'Order Deleted Succesfully!');
    }
    public function StoreOrder ($id){
        $item = Order::findOrFail($id);
        Total::insert([
            'cart_id' => $item->id,
            'product_id' => $item->product_id,
            'user_id' => $item->user_id,
            'quantity' => $item->quantity,
            'price' => $item->price
        ]);
        Order::findOrFail($id)->delete();
        return redirect()->route('pendingorder')->with('message', 'Order Done Succesfully!');
    }
}
