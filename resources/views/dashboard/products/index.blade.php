@extends('layouts.app')

@section('content')
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="#">
                    <em class="fa fa-home"></em>
                </a></li>
            <li class="active">Produits</li>
        </ol>
    </div>
    <!--/.row-->

    <!-- <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Fournisseurs</h1>
        </div>
    </div> -->

    <div class="row">
        <div class="col-sm-6">
            <h1 class="display-3">Produits</h1>
            @if(session()->get('success'))
            <div class="alert alert-success">
                {{ session()->get('success') }}
            </div>
            @endif
        </div>
        <div class="col-sm-6">
            <div class="row">
                <form class="form-inline" style="margin-top: 20px ;" action="">
                    <div class="form-group"><input class="form-control" style="height: 32px;" type="text" name="search"
                            placeholder="rechercher"></div>
                    <select class="form-control" name="filter" id="">
                        <option value="">Trier par :</option>
                    </select>
                    <div class="form-group"><button style="height: 32px;" class="btn btn-primary" type="submit"><em
                                class="fa fa-search"></em></button></div>
                </form>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <div>
                <a style="margin: 19px;" href="{{ route('products.create')}}" class="btn btn-primary">Nouveau
                    Produit</a>
            </div>
            <table id="tableData" class="table table-striped tableSorter">
                <thead>
                    <tr>
                        <th>Réference</th>
                        <th>Nature</th>
                        <th>Dénomination</th>
                        <th>Marque</th>
                        <th>Prix</th>
                        <th>Fournisseur</th>
                        <th colspan=3>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($products as $product)
                    @if(in_array($product->service, $services))
                    <tr>
                        <td style="text-transform: uppercase;">{{$product->reference}}</td>
                        <td>{{$product->nature}}</td>
                        <td hidden>{{$product->service}}</td>
                        <td>{{$product->name}}</td>
                        <td>{{$product->brand}}</td>
                        <td>{{$product->price}} €</td>
                        <td>@isset($product->supplier){{$product->supplier->name}}@endisset</td>
                        <td>
                            <a href="{{ route('products.show', $product->id)}}" class="btn btn-success"><em
                                    class="fa fa-info"></em></a>
                        </td>
                        <td>
                            <a href="{{ route('products.edit',$product->id)}}" class="btn btn-primary"><em
                                    class="fa fa-pencil"></em></a>
                        </td>
                        <td>
                            <form action="{{ route('products.destroy', $product->id)}}" method="post">
                                @csrf
                                @method('DELETE')
                                <button class="btn btn-danger"
                                    onclick="return confirm('Voulez-vous vraiment supprimer {{$product->name}} de {{$product->brand}} ?')"
                                    type="submit"><em class="fa fa-trash"></em></button>
                            </form>
                        </td>
                    </tr>
                    @else
                    @php
                    $services[] = $product->service;
                    @endphp
                    <tr>
                        <td style="text-align:center; background-color:#d3d3d3;" colspan="9">{{ $product->service }}
                        </td>
                    </tr>

                    <tr>
                        <td style="text-transform: uppercase;">{{$product->reference}}</td>
                        <td>{{$product->nature}}</td>
                        <td hidden>{{$product->service}}</td>
                        <td>{{$product->name}}</td>
                        <td>{{$product->brand}}</td>
                        <td>{{$product->price}} €</td>
                        <td>@isset($product->supplier){{$product->supplier->name}}@endisset</td>
                        <td>
                            <a href="{{ route('products.show', $product->id)}}" class="btn btn-success"><em
                                    class="fa fa-info"></em></a>
                        </td>
                        <td>
                            <a href="{{ route('products.edit',$product->id)}}" class="btn btn-primary"><em
                                    class="fa fa-pencil"></em></a>
                        </td>
                        <td>
                            <form action="{{ route('products.destroy', $product->id)}}" method="post">
                                @csrf
                                @method('DELETE')
                                <button class="btn btn-danger"
                                    onclick="return confirm('Voulez-vous vraiment supprimer {{$product->name}} de {{$product->brand}} ?')"
                                    type="submit"><em class="fa fa-trash"></em></button>
                            </form>
                        </td>
                    </tr>

                    @endif
                    @endforeach
                </tbody>
            </table>
            <div>
            </div>
        </div>

        @endsection
