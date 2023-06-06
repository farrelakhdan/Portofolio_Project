<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\DetailController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\MapelController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\CourseController;
use App\Http\Controllers\EnrollController;
use App\Http\Controllers\RegisterController;

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

Route::get('/', [LoginController::class, 'index']);

//NAVBAR
Route::get('/profile', [ProfileController::class, 'index'])->name('profile');
//Special Offer
Route::get('/home', [HomeController::class, 'index'])->name('home');
Route::get('/detail/{id}', [DetailController::class, 'index']);

//Categories
Route::get('/sd-mi', [ProductController::class, 'index']);
Route::get('/smp-mts', [ProductController::class, 'index1']);
Route::get('/sma-ma', [ProductController::class, 'index2']);

//ENROLL
Route::get('/enroll/{id}', [EnrollController::class, 'index']);

//Course
Route::get('/course/{id}', [CourseController::class, 'index']);
Route::get('/file/{id}', [CourseController::class, 'file']);

//ADMIN
Route::get('/login', [LoginController::class, 'index'])->name('login');
Route::post('/Llogin', [LoginController::class, 'Llogin']);
Route::resource('admin', AdminController::class);
Route::get('/logout', [LoginController::class, 'logout'])->name('logout');

//REGISTER
Route::get('/register', [RegisterController::class, 'index'])->name('register');
Route::post('/regis', [RegisterController::class, 'regis']);

//ADMIN CATEGORIES
Route::get('Det_Cat/{id}', [AdminController::class, 'det_cat']);
Route::PUT('Upd_Cat/{id}', [AdminController::class, 'upd_cat']);
Route::PUT('Del_Cat/{id}', [AdminController::class, 'del_cat']);

//ADMIN MAPEL
Route::get('mapelShow', [AdminController::class, 'mapel'])->name('mapelShow');
Route::get('Det_Map/{id}', [AdminController::class, 'det_map']);
Route::POST('Upd_Map/{id}', [AdminController::class, 'upd_map']);
Route::PUT('Del_Map/{id}', [AdminController::class, 'del_map']);

//ADMIN PRODUCT
Route::get('/Aproduct', [AdminController::class, 'product'])->name('Aproduct');
Route::get('Det_Pro/{id?}', [AdminController::class, 'det_pro']);
Route::POST('Upd_Pro/{id?}', [AdminController::class, 'upd_pro']);
Route::PUT('Del_Pro/{id}',[AdminController::class, 'del_pro']);

//ADMIN PRODUCT DETAIL
Route::get('/Adetail', [AdminController::class, 'detail'])->name('Adetail');
Route::get('Det_Det/{id?}', [AdminController::class, 'det_det']);
Route::POST('Upd_Det/{id?}', [AdminController::class, 'upd_det']);
Route::PUT('Del_Det/{id}',[AdminController::class, 'del_det']);

//ADMIN ENROLL
Route::get('/Aenroll', [AdminController::class, 'enroll'])->name('Aenroll');
Route::get('Det_Enr/{id?}', [AdminController::class, 'det_enr']);
Route::POST('Upd_Enr/{id?}', [AdminController::class, 'upd_enr']);
Route::PUT('Del_Enr/{id}',[AdminController::class, 'del_enr']);

Route::get('tes', function(){
    return view('Shop.detail');
});