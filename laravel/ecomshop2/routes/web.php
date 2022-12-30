<?php

use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\OderController;
use App\Http\Controllers\Admin\ProductController;
use App\Http\Controllers\Admin\SubCategoryController;
use App\Http\Controllers\ClientController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\LogoutController;
use Illuminate\Auth\Events\Logout;
use Illuminate\Support\Facades\Route;
use SebastianBergmann\CodeCoverage\Report\Html\Dashboard;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/laravel', function () {
    return view('welcome');
});

Route::controller(HomeController::class)->group(function () {
    Route::get('/', 'Index')->name('Home');
});

// Logout Route
Route::group(['middleware' => ['auth']], function() {
    Route::get('/logout', 'LogoutController@perform')->name('logout.perform');
});

Route::middleware(['auth', 'role:user'])->group(function () {
    Route::controller(LogoutController::class)->group(function () {
        Route::get('/logout', 'perform')->name('perform');
    });
});


Route::controller(ClientController::class)->group(function () {
    Route::get('/category/{id}/{slug}', 'CategoryPage')->name('category');
    Route::get('/product-details/{id}/{slug}', 'SingleProduct')->name('singleproduct');
    Route::get('/new-release', 'NewRelease')->name('newrelease');
});
// Route::middleware(['auth', 'role:user'])->group(function () {

    Route::controller(ClientController::class)->group(function () {
        Route::get('/add-to-cart', 'AddToCart')->name('addtocart');
        Route::post('/add-product-to-cart', 'AddProductToCart')->name('addproducttocart');
        Route::get('/delete-order/{id}', 'DeleteOrder')->name('deleteorder');
        Route::get('/buyproduct/{id}', 'BuyProduct')->name('buyproduct');

        Route::get('/checkout', 'Checkout')->name('checkout');
        Route::get('/user-profile', 'UserProfile')->name('userprofile');
        Route::get('/user-profile/pending-orders', 'PendingOrders')->name('userorders');
        Route::get('/user-profile/history', 'History')->name('history');

        Route::get('/todays-deal', 'TodaysDeal')->name('todaysdeal');
        Route::get('/custom-service', 'CustomerService')->name('customerservice');
    });
// });

Route::get('/dashboard', function () {
    return view('dashboard');

})->middleware(['auth', 'role:user'])->name('dashboard');


Route::middleware(['auth', 'role:admin'])->group(function () {

    Route::controller(DashboardController::class)->group(function () {
        Route::get('/admin/dashboard', 'Index')->name('admindashboard');

    });

    Route::controller(CategoryController::class)->group(function () {
        Route::get('/admin/all-category', 'Index')->name('allcategory');
        Route::get('/admin/add-category', 'AddCategory')->name('addcategory');
        Route::post('/admin/store-category', 'StoreCategory')->name('storecategory');
        Route::get('admin/edit-category/{id}', 'EditCategory')->name('editcategory');
        Route::get('admin/delete-category/{id}', 'DeleteCategory')->name('deletecategory');
        Route::post('/admin/update-category', 'UpdateCategory')->name('updatecategory');

    });

    Route::controller(SubCategoryController::class)->group(function () {
        Route::get('/admin/all-subcategory', 'Index')->name('allsubcategory');
        Route::get('/admin/add-subcategory', 'AddSubCategory')->name('addsubcategory');
        Route::post('admin/store-subcategory', 'StoreSubCategory')->name('storesubcategory');
        Route::get('admin/edit-subcategory/{id}', 'EditSubCat')->name('editsubcat');
        Route::get('admin/delete-subcategory/{id}', 'DeleteSubCat')->name('deletesubcat');
        Route::post('/admin/update-subcategory', 'UpdateSubCat')->name('updatesubcat');

    });

    Route::controller(ProductController::class)->group(function () {
        Route::get('/admin/all-product', 'Index')->name('allproduct');
        Route::get('/admin/add-product', 'AddProduct')->name('addproduct');
        Route::post('/admin/store-product', 'StoreProduct')->name('storeproduct');
        Route::get('/admin/edit-product-img/{id}', 'EditProductImg')->name('editproductimg');
        Route::post('/admin/update-product-img', 'UpdateProductImg')->name('updateproductimg');
        Route::get('/admin/edit-product/{id}', 'EditProduct')->name('editproduct');
        Route::post('/admin/update-product', 'UpdateProduct')->name('updateproduct');
        Route::get('admin/delete-product/{id}', 'DeleteProduct')->name('deleteproduct');

    });

    Route::controller(OderController::class)->group(function () {
        Route::get('/admin/pending-order', 'Index')->name('pendingorder');
        Route::get('/delorder/{id}', 'DeleteOrder')->name('delorder');
        Route::get('/store-order/{id}', 'StoreOrder')->name('storeorder');
    });
});

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';
