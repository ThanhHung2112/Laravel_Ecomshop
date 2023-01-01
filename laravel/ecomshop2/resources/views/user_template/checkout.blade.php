@extends('user_template.layouts.template')
@section('main-content')
<h2>Final Step To Place Your Order</h2>
<div class="row">
    <div class="col-12">
        <div class="box_main">
            <h3>Your Shipping Information-</h3>
            <p>City/Village name - {{ $shippinginf->city_name }}</p>
            <p>Your address - {{ $shippinginf->address }}</p>
            <p>Phone number - {{ $shippinginf->phone_number }}</p>
            <p>Node - {{ $shippinginf->node }}</p>
            
        </div>
        <form action="{{ route('placeorder', $type) }}" method="POST">
            @csrf
            <input type="submit" value="Place Order" class="btn btn-primary" style="float: right">
        </form>    
        <form action="" method="POST">
            @csrf
            <input type="submit" value="Cancel Order" class="btn btn-danger mr-3" style="float: right">
        </form>
           
    </div>
    
</div>
<div style="margin-top: 20px" class="row">
    <div class="col-12">
        <div class="box_main">
           <h3> Your Products Are- </h3>
            <div class="table-responsive">
                <table class="table">
                    <tr>
                        <th>Product IMG</th>
                        <th>Product Name</th>
                        <th>Size</th>
                        <th>Quantity</th>
                        <th>Price</th>                        
                    </tr>
                    @php
                        $total = 0;                    
                    @endphp
                    @foreach ($allproducts as $item)
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
                    </tr>
                </table>    
            </div>  
        </div>
    </div>
</div>
@endsection
