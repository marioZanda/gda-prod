<?php

namespace App\Http\Controllers;

use Illuminate\Support\Arr;
use Illuminate\Http\Request;
use App\Models\client_product;
use App\Models\Superviser;
use App\Models\Product;
use App\Models\Client;
use App\Http\Requests\EditClientRequest;
use App\Http\Requests\AddClientRequest;

class ClientController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $clients = Client::all();
        return view('dashboard.clients.index', ['clients' => $clients]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $supervisers = Superviser::all();
        $products = Product::all();
        return view('dashboard.clients.create', ['supervisers' => $supervisers, 'products' => $products]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(AddClientRequest $request)
    {
        $refs = explode(',', $request->get('products'));
        $refs = array_filter($refs);
        $client = Client::create([
            'name' => $request->get('name'),
            'address' => $request->get('address'),
            'contact' => $request->get('contact'),
            'superviser_id' => $request->get('superviser'),
        ]);
        foreach ($refs as $ref) {
            client_product::create([
                'client_id' => $client->id,
                'product_id' => (int) $ref,
            ]);
        }
        return redirect()->route('clients.index')->with('success', 'Client créé!');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $client = Client::find($id);
        $services = array();
        return view('dashboard.clients.show', ['client' => $client, 'products' => $client->products->sortBy('service'), 'services' => $services ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $client = Client::find($id);
        $supervisers = Superviser::all();
        $products = Product::all();
        $services = array();
        return view('dashboard.clients.edit', ["client" => $client,"supervisers" =>$supervisers,"client_products" => $client->products,"products" => $products,"services" =>$services]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(EditClientRequest $request, $id)
    {
        $refs = explode(',', $request->get('products'));
        $refs = array_filter($refs);
        $client = Client::find($id);
        $client->name = $request->get('name');
        $client->address = $request->get('address');
        $client->contact = $request->get('contact');
        $client->superviser_id = $request->get('superviser');
        $client->save();

        client_product::where('client_id', $id)->delete();
        foreach ($refs as $ref) {
            client_product::create([
                'client_id' => $id,
                'product_id' => (int) $ref,
            ]);
        }

        return redirect()->route('clients.index')->with('success', 'Informations mises à jour!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        client_product::where('client_id', $id)->delete();
        Client::find($id)->delete();
        return redirect()->route('clients.index')->with('success', 'Client supprimé!');
    }
}
