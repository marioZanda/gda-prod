<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\client_product;
use App\Models\Supplier;
use App\Models\Stock;
use App\Models\Product;
use App\Models\Mouvment;
use App\Http\Requests\EditProductRequest;
use App\Http\Requests\AddProductRequest;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $products = Product::all();
        $services = array();
        return view('dashboard.products.index', ['products'=>$products, "services" => $services]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $units = Product::getUnits();
        $suppliers = Supplier::all();
        $services = Product::getServices();
        return view('dashboard.products.create', ['services' => $services, 'units' => $units, 'suppliers' => $suppliers]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(AddProductRequest $request)
    {
        $product = Product::create([
            'reference' => $request->get('reference'),
            'name' => $request->get('name'),
            'brand' => $request->get('brand'),
            'service' => $request->get('service'),
            'alert'=> $request->get('alert'),
            'supplier_id' => $request->get('supplier'),
            'price' => $request->get('price'),
            'nature' => $request->get('nature'),
            'unit'=> $request->get('unit'),
        ]);

        Stock::create([
            'product_id' => $product->id,
            'value' => 0,
        ]);
        return redirect()->route('products.index')->with('success', 'Produit sauvegardé!');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $product = Product::find($id);
        return view('dashboard.products.show', ['product' => $product ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $product = Product::find($id);
        $units = Product::getUnits();
        $suppliers = Supplier::all();
        $services = Product::getServices();
        return view('dashboard.products.edit', ['services' => $services, 'units' => $units, 'suppliers' => $suppliers, 'product' => $product]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(EditProductRequest $request, $id)
    {
        $product = Product::find($id);
        $product->reference = $request->get('reference');
        $product->name = $request->get('name');
        $product->brand = $request->get('brand');
        $product->service = $request->get('service');
        $product->alert= $request->get('alert');
        $product->supplier_id = $request->get('supplier');
        $product->price = $request->get('price');
        $product->nature = $request->get('nature');
        $product->unit = $request->get('unit');
        $product->save();

        return redirect()->route('products.index')->with('success', 'Informations mises à jour!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $product = Product::find($id);
        client_product::where('product_id', $id)->delete();
        Mouvment::where('product_id', $id)->delete();
        Stock::where('product_id', $id)->delete();
        $product->delete();

        return redirect('/products')->with('success', 'Produit supprimé!');
    }
}
