@extends('user_template.layouts.template')
@section('main-content')
    <!-- fashion section start -->



    <h2 class="py-5">Homepage</h2>
    @if (session()->has('message'))

    <div class="alert alert-warning">
        {{ session()->get('message') }}
    </div>

    @endif
    <div class="fashion_section">
        <div id="main_slider">

                    <div class="container">
                        <h1 class="fashion_taital">All Products</h1>
                        <div class="fashion_section_2">
                            <div class="row">
                                @foreach ($allproducts as $product)
                                <div class="col-lg-4 col-sm-4">
                                    <div class="box_main">
                                        <h4 class="shirt_text">{{ $product->product_name }}</h4>
                                        <p class="price_text">Price <span style="color: #262626;">$ {{ $product->price }}</span></p>
                                        <div class="tshirt_img"><img src="{{ asset($product->product_img) }}" style="height: 300px"></div>
                                        {{-- <p class="description_text">Short Des: {{ $product->product_short_des }}</p> --}}
                                        <div class="btn_main">
                                            <div class="buy_bt">
                                                <form action="{{ route('addproducttocart') }}" method="POST">
                                                    @csrf
                                                    <input type="hidden" name="product_id" id="" value="{{ $product->id }}">
                                                    <input type="hidden" name="price" id="" value="{{ $product->price }}">
                                                    <input type="hidden" name="quantity" id="" value="1">
                                                    <br>
                                                    <input class="btn btn-warning" type="submit" value="Buy Now" name="" id="">
                                                </form>
                                            </div>
                                            <div style="padding-top: 30px" class="seemore_bt"><a href="{{ route('singleproduct', [$product->id, $product->slug]) }}">See More</a></div>
                                        </div>
                                    </div>
                                </div>
                                @endforeach
                            </div>
                        </div>
        </div>
    </div>
@endsection
