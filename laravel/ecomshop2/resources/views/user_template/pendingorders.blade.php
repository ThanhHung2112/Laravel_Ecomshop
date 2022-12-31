@extends('user_template.layouts.user_profile_template')
@section('profilecontent')
@if (session()->has('message'))

<div class="alert alert-success">
    {{ session()->get('message') }}
</div>

@endif
<div class="row">
    <div class="col-12">
        <div class="box-main">
            <div class="table-responsive">
                <table class="table">
                    <tr>
                        <th>Product IMG</th>
                        <th>Product Name</th>
                        <th>Size</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Status</th>
                    </tr>
                    @foreach ($allorder as $item)
                        <tr>
                            @php
                                $product_name = App\Models\Product::where('id', $item->product_id)->value('product_name');
                                $img = App\Models\Product::where('id', $item->product_id)->value('product_img');
                            @endphp
                            <td><img src="{{ asset($img) }}" style="height: 60px"></td>
                            <td>{{ $product_name }}</td>
                            <td>{{ $item->size }}</td>
                            <td>{{ $item->quantity }}</td>
                            <td>{{ $item->price }}</td>
                            <td>Waiting</td>


                        </tr>
                    @endforeach
                </table>
            </div>
        </div>
    </div>
</div>
@endsection
