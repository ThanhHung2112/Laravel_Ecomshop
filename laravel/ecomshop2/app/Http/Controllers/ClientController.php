<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use App\Models\Category;
use App\Models\Order;
use App\Models\Product;
use App\Models\Total;
use App\Models\User;
use Auth;
use Illuminate\Auth\Events\Login;
use Illuminate\Http\Request;

class ClientController extends Controller
{
    public function CategoryPage ($id){
        $category = Category::findOrFail($id);
        $products = Product::where('product_category_id', $id)->latest()->get();
        return view('user_template.category',compact('category','products'));
    }
    public function SingleProduct ($id){
        $product = Product::findOrFail($id);
        $subcat_id = Product::where('id', $id)->value('product_subcategory_id');
        $related_products = Product::where('product_subcategory_id', $subcat_id)->latest()->get();
        return view('user_template.product', compact('product', 'related_products'));
    }
    public function AddToCart (){
        $userid = Auth::id();
        $cart_items = Cart::where('user_id', $userid)->get();
        return view('user_template.addtocart', compact('cart_items'));
    }
    public function AddProductToCart (Request $request){
        $user = Auth::user();
        if (is_null($user)) {
            # code...
            return view('auth.register');

        }
        $product_price = $request->price;
        $quantity = $request-> quantity;
        $price = $product_price * $quantity;
        Cart::insert([
            'product_id' => $request->product_id,
            'size' => $request->size,
            'user_id' => Auth::id(),
            'quantity' => $request->quantity,
            'price' => $price,
        ]);
        return redirect()->route('addtocart')->with('message', 'Your item added to cart successfully!');
    }
    public function DeleteOrder ($id){
        Cart::findOrFail($id)->delete();
        return redirect()->route('addtocart')->with('message', 'Your item deleted successfully!');
    }
    public function BuyProduct ($id){
        $item = Cart::findOrFail($id);
        Order::insert([
            'cart_id' => $item->id,
            'product_id' => $item->product_id,
            'user_id' => Auth::id(),
            'size' => $item->size,
            'quantity' => $item->quantity,
            'price' => $item->price,
        ]);
        Cart::findOrFail($id)->delete();
        return redirect()->route('userorders')->with('message', 'Your item added successfully!');
    }
    public function Checkout (){
        return view('user_template.checkout');
    }
    public function UserProfile (){
        $user = Auth::user();
        if (is_null($user)) {
            # code...
            return view('auth.register');

        } else {
            $user = Auth::user()->latest()->get();
            return view('user_template.userprofile',compact('user'));
        }


    }
    public function PendingOrders (){
        $allorder = Order::latest()->get();
        return view('user_template.pendingorders', compact('allorder'));
    }
    public function History (){
        $userid = Auth::user()->id;

        $allhistory = Total::where('user_id', $userid)->get();

        return view('user_template.history', compact('allhistory'));
    }
    public function NewRelease (){
        return view('user_template.newrelease');
    }
    public function TodaysDeal (){
        return view('user_template.todaysdeal');
    }
    public function CustomerService (){
        return view('user_template.customerservice');
    }
}
