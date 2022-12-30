@extends('admin.layouts.template')
@section('page_title')
Pending Oder - Ecomshop
@endsection
@section('content')

    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Page/</span> Pending Oder</h4>
        @if (session()->has('message'))

            <div class="alert alert-success">
                {{ session()->get('message') }}
            </div>

        @endif
        <!-- Bootstrap Table with Header - Light -->
        <div class="card">
            <h5 class="card-header">Available Oder Information</h5>
            <div class="table-responsive text-nowrap">
                <table class="table">
                    <thead class="table-light">
                        <tr>
                            <th>User Name</th>
                            <th>Product</th>
                            <th>Product IMG</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                        @foreach ($allorder as $order)
                        @php
                            $product_name = App\Models\Product::where('id', $order->product_id)->value('product_name');
                            $img = App\Models\Product::where('id', $order->product_id)->value('product_img');
                            $user_name = Auth::user()::where('id', $order->user_id)->value('name');
                        @endphp


                        <tr>
                            <td>{{ $user_name }}</td>
                            <td>{{ $product_name }}</td>
                            <td><img src="{{ asset($img) }}" style="height: 60px"    alt=""></td>
                            <td>{{ $order->quantity }}</td>
                            <td>{{ $order->price }} $</td>
                            <td>
                                <a href="{{ route('storeorder', $order->id) }}" class="btn btn-primary">Done</a>
                                <a href="{{ route('delorder', $order->id) }}" class="btn btn-warning">Delete</a>
                            </td>
                        </tr>

                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
@endsection


