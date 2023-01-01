@extends('user_template.layouts.template')
@section('main-content')
<h2>Add To Page</h2>
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
                        <th>Action</th>
                    </tr>
                    @php
                        $total = 0;
                        $type = "all"
                    @endphp
                    @foreach ($cart_items as $item)
                        {{-- <input type="hidden" value="{{ $item->product_id }}" name="type"> --}}
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
                            <td>                                 
                                <a href="{{ route('deleteorder', $item->id) }}" class="btn btn-warning">Remove</a>
                                <a href="{{ route('buyproduct', $item->id) }}" class="btn btn-primary">Buy</a>
                                {{-- <a href="{{ route('shipinginf', $item->id) }}" class="btn btn-primary">Buy Now</a> --}}
                            </td>

                            @php
                                $total = $total + $item->price ;
                            @endphp
                        </tr>
                    @endforeach                    
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td style="
                        font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                        font-weight: bold;
                        font-size: 19px;
                        color: rgb(192, 61, 61);
                        ">Total</td>
                        <td style="
                        font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                        font-weight: bold;
                        font-size: 19px;
                        color: rgb(192, 61, 61);
                        ">$ {{ $total }}</td>
                        @if ($total = 0)
                            <td><a href="" class="btn btn-primary disabled">Buy All</a></td> 
                        @else
                            {{-- <input type="hidden" value="all" name="type"> --}}
                            <td><a href="{{ route('shippinginf', $type) }}" class="btn btn-primary">Buy All</a></td> 
                        @endif
                                           
                        
                    </tr>
                </table>
            </div>  
        </div>  
    </div>
</div>
@endsection
