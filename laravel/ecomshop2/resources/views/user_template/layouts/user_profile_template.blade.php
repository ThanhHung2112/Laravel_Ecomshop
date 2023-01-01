@extends('user_template.layouts.template')
@section('main-content')
<h2>Welcom {{ Auth::user()->name }}</h2>
<div style="margin: 20px 0 " class="container">
    <div class="row">
        <div class="col-lg-2">
            <div class="box_main">
                <ul>
                    <li><a href="{{ route('userprofile') }}">Dashboard</a></li>
                    <li><a href="{{ route('userorders') }}">Pending Order</a></li>
                    <li><a href="{{ route('history') }}">History</a></li>
                    <li><a href="{{ route('perform') }}">Logout</a></li>
                </ul>
            </div>
        </div>
        <div class="col-lg-10">
            <div class="box_main">
                @yield('profilecontent')
            </div>
        </div>
    </div>
</div>
@endsection()
