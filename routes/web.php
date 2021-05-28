<?php

use PhpParser\Node\Expr\BinaryOp\Spaceship;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\spaceController;
use App\Http\Controllers\TeamMemberController;
use App\Http\Controllers\TeamController;
use App\Http\Controllers\SupplierController;
use App\Http\Controllers\SuperviserController;
use App\Http\Controllers\StockController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\MouvmentController;
use App\Http\Controllers\InOutController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\ClientController;
use App\Http\Controllers\AlertController;

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

Auth::routes();
Route::get('/', [HomeController::class, 'index'])->name('home');
Route::get('/home', [HomeController::class, 'index'])->name('home');
Route::get('/alertes', [AlertController::class, 'index'])->name('alerts');
Route::get('/in-out', [InOutController::class, 'index'])->name('in-out');
Route::get('/in-out.in', [InOutController::class, 'in'])->name('in-out.in');
Route::get('/in-out.out', [InOutController::class, 'out'])->name('in-out.out');
Route::get('in-out.in/{product_id}', [InOutController::class, 'ref_in']);
Route::get('in-out.out/{product_id}', [InOutController::class, 'ref_out']);
Route::get('in-out.out.team/{team_member_ref}', [InOutController::class, 'ref_out_team']);
Route::post('in-out.in_store', [InOutController::class, 'in_store'])->name('in-out.in_store');
Route::post('in-out.out_store', [InOutController::class, 'out_store'])->name('in-out.out_store');
Route::post('space.change', [spaceController::class, 'change'])->name('space.change');

Route::resources([
    'suppliers' => SupplierController::class,
    'teams' => TeamController::class,
    'members' => TeamMemberController::class,
    'supervisers' => SuperviserController::class,
    'products' => ProductController::class,
    'stocks' => StockController::class,
    'mouvments' => MouvmentController::class,
    'clients' => ClientController::class,
]);
