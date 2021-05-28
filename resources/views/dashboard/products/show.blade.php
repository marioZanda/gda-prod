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

    <div class="row">
        <div class="col-lg-12 margin-tb">
            <div class="pull-left">
                <h2>Informations produit</h2>
            </div>
            <div class="pull-right">
                <a class="btn btn-primary" href="{{ url()->previous() }}" title="Go back"> <i
                        class="fa fa-backward "></i> </a>
            </div>
        </div>
    </div>

    @if ($errors->any())
    <div class="alert alert-danger">
        <strong>Error!</strong>
        <ul>
            @foreach ($errors->all() as $error)
            <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
    @endif
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12" id="infos">
            <div class="form-group">
                Référence : <strong>{{ $product->reference }}</strong>
            </div>

            <div class="form-group">
                Barecode :
                <strong><?php echo DNS1D::getBarcodeHTML($product->reference, 'C39+',1,50,'#30a5ff', true);?></strong>
            </div>

            <div class="form-group">
                Service : <strong>{{ $product->service }}</strong>
            </div>

            <div class="form-group">
                Nature : <strong>{{ $product->nature }}</strong>
            </div>

            <div class="form-group">
                Désignation : <strong>{{ $product->name }}</strong>
            </div>

            <div class="form-group">
                Marque : <strong>{{ $product->brand }}</strong>
            </div>

            <div class="form-group">
                Qte actuelle : <strong>{{ $product->stock->value }}</strong>
            </div>

            <div class="form-group">
                Alerte : <strong>{{ $product->alert }}</strong>
            </div>

            <div class="form-group">
                Prix : <strong>{{ $product->price }} €</strong>
            </div>

            <div class="form-group">
                Unité : <strong>{{ $product->unit }}</strong>
            </div>

            <div class="form-group">
                Fournisseur :
                <strong>@if(isset($product->supplier)){{ $product->supplier->name }}@else{{ "_" }}@endif</strong>
            </div>
        </div>
    </div>
    <div class="row mt-5">
        <div class="col-xs-4 col-sm-4 col-md-4">
            <a href="{{ route('products.edit',$product->id)}}" class="btn btn-primary">Modifier</a>
        </div>
        <div class="col-xs-4 col-sm-4 col-md-4">
            <form action=" {{ route('products.destroy', $product->id)}}" method="post">
                @csrf
                @method('DELETE')
                <button class="btn btn-danger"
                    onclick="return confirm('Voulez-vous vraiment supprimer {{$product->name}} de {{$product->brand}}  ?')"
                    type="submit">Supprimer</button>
            </form>
        </div>
    </div>
    <style>
        #infos {
            font-size: 1.5em;
        }

        #infos strong {
            color: #30a5ff;
        }
    </style>
