@extends('user_template.layouts.template')
@section('main-content')
    <h2>Provice Your Shipping Information</h2>
    <div class="row">
        <div class="col-12">
            <div class="box_main">
                @if (session()->has('message'))
                    <div class="alert alert-warning">
                        {{ session()->get('message') }}
                    </div>
                @endif  
                <form action="{{ route('addshippinginf') }}" method="POST">
                    @csrf
                    <input type="hidden" name="type" id="" value="{{ $type }}">
                    <div class="form-group">
                        <label for="city_name">City/Village name</label>
                        <input type="text" class="form-control" name="city_name" id="">
                    </div>
                    <div class="form-group">
                        <label for="address">Your Address</label>
                        <input type="text" class="form-control" name="address" id="">
                    </div>
                    <div class="form-group">
                        <label for="phone-number">Phone Number</label>
                        <input type="text" class="form-control" name="phone_number" id="">
                    </div>
                    <div class="form-group">
                        <label for="node">Node</label>
                        <input type="text" class="form-control" name="node" id="">
                    </div>
                    <input type="submit" value="Next" class="btn btn-primary">
                </form>
            </div>
        </div>
    </div>
@endsection
