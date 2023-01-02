@extends('user_template.layouts.user_profile_template')
@section('profilecontent')


        <div class="product-info">
            <h4 class="shirt_text text-left">User Information</h4>

            </div>
            <div class="my-3 product-details">
                <p class="lead">{{ Auth::user()->name }}</p>
                <ul class="p-2 bg-light my-2">
                    <li>Email: {{ Auth::user()->email }}</li>
                    <li>Account create at: {{ Auth::user()->created_at }}</li>
                    <li>User ID - {{ Auth::user()->id }}</li>
                </ul>
            </div>
            <div class="my-3 product-details">
                <p class="lead">Shipping Information</p>
                <ul class="p-2 bg-light my-2">
                    <li>City/Village: {{ $shippinginf->city_name }}</li>
                    <li>Address: {{ $shippinginf->address }}</li>   
                    <li>Phone number: {{ $shippinginf->phone_number }}</li>
                </ul>
            </div>

</div>
@endsection
