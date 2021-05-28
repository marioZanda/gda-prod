<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Supplier;
use App\Http\Requests\EditSupplierRequest;
use App\Http\Requests\AddSupplierRequest;

class SupplierController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $suppliers = Supplier::all();

        return view('dashboard.suppliers.index', ['suppliers'=>$suppliers]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('dashboard.suppliers.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(AddSupplierRequest $request)
    {
        //$request->validate();
        Supplier::create([
            'name' => $request->get('name'),
            'address' => $request->get('address'),
            'contact' => $request->get('contact'),
        ]);
        return redirect()->route('suppliers.index')->with('success', 'Fournisseur sauvegarder!');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $supplier = Supplier::find($id);
        return view('dashboard.suppliers.edit', ['supplier' => $supplier]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(EditSupplierRequest $request, $id)
    {
        $supplier = Supplier::find($id);
        $supplier->name = $request->get('name');
        $supplier->address = $request->get('address');
        $supplier->contact = $request->get('contact');
        $supplier->save();
        return redirect()->route('suppliers.index')->with('success', 'Informations mises à jour!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $supplier = Supplier::find($id);
        $supplier->delete();

        return redirect('/suppliers')->with('success', 'Fournisseur supprimé!');
    }
}
