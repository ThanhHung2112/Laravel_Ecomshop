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
        $allordered = Total::latest()->get();
        return view('admin.pendingoder', compact('allorder', 'allordered'));
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
            'size' => $item->size,
            'quantity' => $item->quantity,
            'price' => $item->price,
            'city_name' => $item->city_name,
            'address' => $item->address,
            'phone_number' => $item->phone_number,
            'node' => $item->node
        ]);
        Order::findOrFail($id)->delete();
        return redirect()->route('admindashboard')->with('message', 'Order Confirmed Succesfully!');
    }
}
