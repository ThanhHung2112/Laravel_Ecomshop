<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Product;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function Index(Request $request){
        $allproducts = Product::latest()->get();
        $categories = Category::latest()->get();
        $search = null;
        return view('user_template.home', compact('allproducts','categories', 'search'));
    }
    public function Login(){
        $allproducts = Product::latest()->get();
        $categories = Category::latest()->get();
        return view('user_template.home', compact('allproducts','categories'));
    }
    public function Search (Request $request){
        $search = $request['search'] ?? "";
        $categories = Category::latest()->get();
        if ($search != "") {
            # where
            $allproducts = Product::where('product_name', 'LIKE', "%$search%")->get();
        } else {
            $allproducts = Product::all();
        }
        return view('user_template.home', compact('allproducts','categories', 'search'));
    }


}
