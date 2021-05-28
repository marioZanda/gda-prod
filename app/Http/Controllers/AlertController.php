<?php

namespace App\Http\Controllers;

use Illuminate\Support\Arr;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Stock;

class AlertController extends Controller
{
    public function index()
    {
        $stocks = Stock::all();
        $r_stocks = array();
        $r_products = array();
        foreach ( $stocks as $stock){
            $product = Product::find($stock->product_id);
            if ( $product->alert > $stock->value){
                array_push($r_stocks, $stock);
                array_push($r_products, $product);
            }
        }
        return view('dashboard.alerts.index',['stocks' => $r_stocks,'products' => $r_products]);
    }

}
