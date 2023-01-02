<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use App\Models\Category;
use App\Models\Order;
use App\Models\Product;
use App\Models\Shipinginf;
use App\Models\Total;
use App\Models\User;
use Auth;
use Illuminate\Auth\Events\Login;
use Illuminate\Http\Request;
use phpDocumentor\Reflection\PseudoTypes\False_;
use Redirect;

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
        if (is_null($request->size)) {
            // $url = $request->url;
            return Redirect::back()->with('message','Please Choose Your Size !');
        }
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
        $type = $id;
        $check = Shipinginf::where('user_id', Auth::id())->first();
        if (is_null($check)) {
            return redirect()->route('shippinginf', $type);
        } else {
            return redirect()->route('checkout', $type);
        }
    }
    public function ShippingInf ($type){

        return view('user_template.shippinginf', compact('type'));
    }
    public function AddShippingInf (Request $request){
        if (is_null($request ->city_name)) {
            return Redirect::back()->with('message','Please fill Your City/Village Name !');
        } elseif (is_null($request ->phone_number)) {
            return Redirect::back()->with('message','Please fill Your PhoneNumber!');
        } elseif (is_null($request ->address)) {
            return Redirect::back()->with('message','Please fill Your Address!');
        } elseif (is_null($request ->node)) {
            $request['node'] = 'None';
        }
        $type = $request->type;
        $check = Shipinginf::where('user_id', Auth::id());
        if (is_null($check)) {
            Shipinginf::insert([
                'user_id' => Auth::id(),
                'city_name' => $request->city_name,
                'phone_number' => $request->phone_number,
                'address' => $request->address,
                'node' => $request->node,
            ]);
        } else {
            Shipinginf::where('user_id', Auth::id())->delete();
            Shipinginf::insert([
                'user_id' => Auth::id(),
                'city_name' => $request->city_name,
                'phone_number' => $request->phone_number,
                'address' => $request->address,
                'node' => $request->node,
            ]);
        }
        return redirect()->route('checkout', $type);
    }
    public function Checkout ($type){
        $userid = Auth::id();
        $shippinginf = Shipinginf::where('user_id', $userid)->first();
        if ($type === 'all') {
            $allproducts = Cart::where('user_id', $userid)->get();
        } else{
            $allproducts = Cart::where('id', $type)->get();
        }

        return view('user_template.checkout', compact('shippinginf', 'allproducts', 'type'));
    }
    public function PlaceOrder ($type){
        $userid = Auth::id();
        if ($type === 'all') {
            $allproducts = Cart::where('user_id', $userid)->get();
        } else{
            $allproducts = Cart::where('id', $type)->get(); ;
        }
        $shippinginf = Shipinginf::where('user_id', $userid)->first();
        foreach ($allproducts as $product) {
            Order::insert([
                'cart_id' => $product->id,
                'product_id' => $product->product_id,
                'user_id' => Auth::id(),
                'size' => $product->size,
                'quantity' => $product->quantity,
                'price' => $product->price,
                'city_name' => $shippinginf->city_name,
                'address' => $shippinginf->address,
                'phone_number' => $shippinginf->phone_number,
                'node' => $shippinginf->node
            ]);
            Cart::findOrFail($product->id)->delete();
        }
        return redirect()->route('userorders')->with('message', 'Your items ordered successfully!');
    }
    public function UserProfile (){
        $user = Auth::user();

        if (is_null($user)) {
            # code...
            return view('auth.register');

        } else {
            $user = Auth::user()->latest()->get();
            $userid = Auth::id();
            $shippinginf = Shipinginf::where('user_id', $userid)->first();
            return view('user_template.userprofile',compact('user', 'shippinginf'));
        }
    }
    public function PendingOrders (){
        $allorder = Order::where('user_id', Auth::id())->latest()->get();
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
