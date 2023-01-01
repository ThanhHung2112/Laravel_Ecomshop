@extends('admin.layouts.template')
@section('page_title')
History Order - HueShoes
@endsection
@section('content')

    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Page/</span> History Order</h4>
        @if (session()->has('message'))

            <div class="alert alert-success">
                {{ session()->get('message') }}
            </div>

        @endif
        <!-- Bootstrap Table with Header - Light -->
        <div class="card">
            <h5 class="card-header">Sales History Information</h5>
            <div class="table-responsive text-nowrap">
                <table class="table">
                    <thead class="table-light">
                        <tr>
                            <th>Product IMG</th>
                            <th>User Name</th>
                            <th>Product</th>
                            <th>Size</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                        @foreach ($allordered as $order)
                        @php
                            $product_name = App\Models\Product::where('id', $order->product_id)->value('product_name');
                            $img = App\Models\Product::where('id', $order->product_id)->value('product_img');
                            $user_name = Auth::user()::where('id', $order->user_id)->value('name');
                        @endphp

                        <tr>
                            <td><img src="{{ asset($img) }}" style="height: 60px"    alt=""></td>
                            <td>{{ $user_name }}</td>
                            <td>{{ $product_name }}</td>
                            <td>{{ $order->size }}</td>
                            <td>{{ $order->quantity }}</td>
                            <td>$ {{ $order->price }}</td>
                            <td><span class="badge bg-label-success me-1">Paid</span> </td>
                        </tr>

                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
@endsection


