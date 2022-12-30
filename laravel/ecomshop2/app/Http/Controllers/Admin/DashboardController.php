<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Cart;
use App\Models\Category;
use App\Models\Order;
use App\Models\Total;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function Index(){
        $sum_price = Total::sum('price');
        $sum_product = Total::sum('quantity');
        $ordernum = Total::latest()->get()->count();
        $pendingorder = Order::latest()->get()->count();
        $categories = Category::latest()->get();
        $allordered = Total::latest()->get();
        return view('admin.dashboard', compact('sum_price','sum_product','ordernum','pendingorder', 'categories', 'allordered'));
    }
}
