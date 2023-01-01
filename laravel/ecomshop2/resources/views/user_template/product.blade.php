@extends('user_template.layouts.template')
@section('main-content')
    <div class="container">
        <div class="row">
            <div class="col-lg-4">
                <div class="box_main">
                    <div class="tshirt_img"><img src="{{ asset($product->product_img) }}"></div>
                </div>
            </div>
            <div class="col-lg-8">
                <div class="box_main">
                    <div class="product-info">
                        <h4 class="shirt_text text-left">{{ $product->product_name }}</h4>
                        <p class="price_text text-left">Price <span style="color: #262626;">$ {{ $product->price }}</span>
                        </p>
                    </div>
                    @if (session()->has('message'))
                        <div class="alert alert-danger">
                            {{ session()->get('message') }}
                        </div>
                    @endif
                    <div class="my-3 product-details">
                        @php
                            $sizes = App\Models\Size::latest()->get();
                            $sold = App\Models\Total::where('product_id', $product->id)->sum('quantity');
                        @endphp
                        <ul class="p-2 bg-light my-2">
                            <li>Category - {{ $product->product_category_name }}</li>
                            <li>Sub Category - {{ $product->product_subcategory_name }}</li>
                            <li>Available Quantity - {{ $product->quantity }}</li>
                            <li style="font-weight: bold">Sold - {{ $sold }}</li>
                        </ul>
                    </div>
                    <div class="btn_main">

                        <form action="{{ route('addproducttocart') }}" method="POST">
                            @csrf
                            <input type="hidden" name="product_id" id="" value="{{ $product->id }}">
                            <div class="form-group">
                                <input type="hidden" name="price" id="" value="{{ $product->price }}">
                                <label class="price_text text-left" for="">Size:</label> <br>

                                @foreach ($sizes as $size)
                                    <div class="lead"
                                        style="
                                float: left;
                                margin-left: 20px
                                ">
                                        <input name="size" type="radio" value="{{ $size->size }}" placeholder="S">
                                        <label for="{{ $size->size }}">{{ $size->size }}</label>
                                    </div>
                                @endforeach
                                <br>
                                <div class="col-10" style="padding: 0; margin-top: 15px; width: 100px;">

                                    <label class="price_text text-left" for="quantity">Quantity:</label>
                                    <br>
                                    <input style="margin-top: 5px" type="number" min="1" name="quantity"
                                        id="" placeholder="Ex: 1" value="1">
                                </div>
                            </div>

                            <div style="margin: 10px 0">
                                <p class="lead">Description</p>
                                <p>{{ $product->product_long_des }}</p>

                            </div>
                            <input class="btn btn-warning" type="submit" value="Add To Cart" name="" id="">
                            <br>

                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="fashion_section">
            <div id="main_slider">
                <div class="container">
                    <h1 class="fashion_taital">Related Products</h1>
                    <div class="fashion_section_2">
                        <div class="row">

                            @foreach ($related_products as $product)
                                <div class="col-lg-4 col-sm-4">
                                    <div class="box_main">
                                        <h4 class="shirt_text">{{ $product->product_name }}</h4>
                                        <p class="price_text">Price <span style="color: #262626;">$
                                                {{ $product->price }}</span></p>
                                        <div class="electronic_img"><img src="{{ asset($product->product_img) }}"
                                                style="height: 300px"></div>
                                        <div class="btn_main">
                                            <div class="buy_bt">
                                                <form action="{{ route('addproducttocart') }}" method="POST">
                                                    @csrf
                                                    <input type="hidden" name="product_id" id=""
                                                        value="{{ $product->id }}">
                                                    <input type="hidden" name="price" id=""
                                                        value="{{ $product->price }}">
                                                    <input type="hidden" name="quantity" id="" value="1">
                                                    <br>
                                                    <input class="btn btn-warning" type="submit" value="Buy Now"
                                                        name="" id="">
                                                </form>
                                            </div>                                                
                                                <div class="seemore_bt" style="padding-top: 30px"><a
                                                    href="{{ route('singleproduct', [$product->id, $product->slug]) }}">See
                                                    More</a></div>
                                        </div>
                                    </div>
                                </div>
                            @endforeach

                        </div>
                    </div>
                </div>
            </div>
        </div>
    @endsection
