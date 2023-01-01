@extends('admin.layouts.template')
@section('page_title')
    Dashboard - Ecomshop
@endsection

@section('content')
    <!-- Content wrapper -->
    <div class="content-wrapper">

    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Page/</span> Dashboard</h4>


        <div class="col-lg-8 mb-4 order-0" style="display:block;">
            <div class="row">
                <div class="row">
                    <div class="col-lg-6 col-md-12 col-6 mb-4">
                        <div class="card">
                            <div class="card-body">
                                <div class="card-title d-flex align-items-start justify-content-between">
                                    <div class="avatar flex-shrink-0">
                                        <img src="{{ asset('dashboard/assets/img/icons/unicons/chart-success.png') }}"
                                            alt="chart success" class="rounded" />
                                    </div>
                                    <div class="dropdown">
                                        <button class="btn p-0" type="button" id="cardOpt3" data-bs-toggle="dropdown"
                                            aria-haspopup="true" aria-expanded="false">
                                            <i class="bx bx-dots-vertical-rounded"></i>
                                        </button>
                                        <div class="dropdown-menu dropdown-menu-end" aria-labelledby="cardOpt3">
                                            <a class="dropdown-item" href="javascript:void(0);">View More</a>
                                            <a class="dropdown-item" href="javascript:void(0);">Delete</a>
                                        </div>
                                    </div>
                                </div>
                                <span class="fw-semibold d-block mb-1">Profit</span>
                                <h3 class="card-title mb-2">$ {{ $sum_price }}</h3>
                                <small class="text-success fw-semibold"><i class="bx bx-up-arrow-alt"></i> +72.80%</small>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-12 col-6 mb-4">
                        <div class="card">
                            <div class="card-body">
                                <div class="card-title d-flex align-items-start justify-content-between">
                                    <div class="avatar flex-shrink-0">
                                        <img src="{{ asset('dashboard/assets/img/icons/unicons/wallet-info.png') }}"
                                            alt="Credit Card" class="rounded" />
                                    </div>
                                    <div class="dropdown">
                                        <button class="btn p-0" type="button" id="cardOpt6" data-bs-toggle="dropdown"
                                            aria-haspopup="true" aria-expanded="false">
                                            <i class="bx bx-dots-vertical-rounded"></i>
                                        </button>
                                        <div class="dropdown-menu dropdown-menu-end" aria-labelledby="cardOpt6">
                                            <a class="dropdown-item" href="javascript:void(0);">View More</a>
                                            <a class="dropdown-item" href="javascript:void(0);">Delete</a>
                                        </div>
                                    </div>
                                </div>
                                <span>Total Product Sales</span>
                                <h3 class="card-title text-nowrap mb-1">{{ $sum_product }}</h3>
                                <small class="text-success fw-semibold"><i class="bx bx-up-arrow-alt"></i> +28.42%</small>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-12 col-6 mb-4">
                        <div class="card">
                            <div class="card-body">
                                <div class="card-title d-flex align-items-start justify-content-between">
                                    <div class="avatar flex-shrink-0">
                                        <img src="{{ asset('dashboard/assets/img/icons/unicons/paypal.png') }}"
                                            alt="Credit Card" class="rounded" />
                                    </div>
                                    <div class="dropdown">
                                        <button class="btn p-0" type="button" id="cardOpt6" data-bs-toggle="dropdown"
                                            aria-haspopup="true" aria-expanded="false">
                                            <i class="bx bx-dots-vertical-rounded"></i>
                                        </button>
                                        <div class="dropdown-menu dropdown-menu-end" aria-labelledby="cardOpt6">
                                            <a class="dropdown-item" href="javascript:void(0);">View More</a>
                                            <a class="dropdown-item" href="javascript:void(0);">Delete</a>
                                        </div>
                                    </div>
                                </div>
                                <span>Order Number</span>
                                <h3 class="card-title text-nowrap mb-1">{{ $ordernum }}</h3>
                                <small class="text-success fw-semibold"><i class="bx bx-up-arrow-alt"></i> +28.42%</small>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-12 col-6 mb-4">
                        <div class="card">
                            <div class="card-body">
                                <div class="card-title d-flex align-items-start justify-content-between">
                                    <div class="avatar flex-shrink-0">
                                        <img src="{{ asset('dashboard/assets/img/icons/unicons/cc-primary.png') }}"
                                            alt="Credit Card" class="rounded" />
                                    </div>
                                    <div class="dropdown">
                                        <button class="btn p-0" type="button" id="cardOpt6" data-bs-toggle="dropdown"
                                            aria-haspopup="true" aria-expanded="false">
                                            <i class="bx bx-dots-vertical-rounded"></i>
                                        </button>
                                        <div class="dropdown-menu dropdown-menu-end" aria-labelledby="cardOpt6">
                                            <a class="dropdown-item" href="javascript:void(0);">View More</a>
                                            <a class="dropdown-item" href="javascript:void(0);">Delete</a>
                                        </div>
                                    </div>
                                </div>
                                <span>Pending Orders</span>
                                <h3 class="card-title text-nowrap mb-1">{{ $pendingorder }}</h3>
                                <small class="text-success fw-semibold"><i class="bx bx-up-arrow-alt"></i> +28.42%</small>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <!-- Order Statistics -->
        </div>


        <!--/ Order Statistics -->
        {{-- <div class="row">
            @foreach ($categories as $category)
                <div class="col-md-6 col-lg-4 order-1 mb-4">
                    <div class="card h-100">
                        <div class="card-header d-flex align-items-center justify-content-between pb-0">
                            <div class="card-title mb-0">
                                <h5 class="m-0 me-2">Order Statistics</h5>
                                <small class="text-muted">42.82k Total Sales</small>
                            </div>
                            <div class="dropdown">
                                <button class="btn p-0" type="button" id="orederStatistics" data-bs-toggle="dropdown"
                                    aria-haspopup="true" aria-expanded="false">
                                    <i class="bx bx-dots-vertical-rounded"></i>
                                </button>
                                <div class="dropdown-menu dropdown-menu-end" aria-labelledby="orederStatistics">
                                    <a class="dropdown-item" href="javascript:void(0);">Select All</a>
                                    <a class="dropdown-item" href="javascript:void(0);">Refresh</a>
                                    <a class="dropdown-item" href="javascript:void(0);">Share</a>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <div class="d-flex flex-column align-items-center gap-1">
                                    <h2 class="mb-2">8,258</h2>
                                    <span>Total Orders</span>
                                </div>
                                <div id="orderStatisticsChart"></div>
                            </div>
                            <ul class="p-0 m-0">
                                @php
                                    $subcategories = App\Models\Subcategory::where('category_id', $category->id)->get();
                                @endphp
                                @foreach ($subcategories as $subcategory)
                                    <li class="d-flex mb-4 pb-1">
                                        <div class="avatar flex-shrink-0 me-3">
                                            <span class="avatar-initial rounded bg-label-success"><i
                                                    class="bx bx-closet"></i></span>
                                        </div>
                                        <div
                                            class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                            <div class="me-2">
                                                <h6 class="mb-0">{{ $subcategory->subcategory_name }}</h6>
                                                <small class="text-muted">T-shirt, Jeans, Shoes</small>
                                            </div>
                                            <div class="user-progress">
                                                <small class="fw-semibold">23.8k</small>
                                            </div>
                                        </div>
                                    </li>
                                @endforeach
                            </ul>
                        </div>
                    </div>
                </div>
            @endforeach
        </div> --}}
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
                            <th>User</th>
                            <th>Info</th>
                            {{-- <th>IMG</th> --}}
                            <th>Product</th>
                            <th>Size</th>
                            <th>Num</th>
                            <th>Total</th>
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
                            <td>
                                <ul>
                                    <li>{{ $order->city_name }}</li>
                                    <li>{{ $order->address }}</li>
                                    <li>{{ $order->phone_number }}</li>
                                    <li>{{ $order->node }}</li>
                                </ul>
                            </td>
                            {{-- <td><img src="{{ asset($img) }}" style="height: 60px" alt=""></td> --}}
                            <td>{{ $product_name }}</td>
                            <td>{{ $order->size }}</td>

                            <td>{{ $order->quantity }}</td>
                            <td>{{ $order->price }} $</td>
                            <td>
                                <a href="{{ route('storeorder', $order->id) }}" class="btn btn-success">Confirm</a>
                                <a href="{{ route('delorder', $order->id) }}" class="btn btn-warning">Delete</a>
                            </td>
                        </tr>

                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
        

    </div>

</div>

@endsection
