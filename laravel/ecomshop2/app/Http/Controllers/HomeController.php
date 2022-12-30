<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Product;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function Index(){
        $allproducts = Product::latest()->get();
        $categories = Category::latest()->get();
        return view('user_template.home', compact('allproducts','categories'));
    }
    public function Login(){
        $allproducts = Product::latest()->get();
        $categories = Category::latest()->get();
        return view('user_template.home', compact('allproducts','categories'));
    }

}
