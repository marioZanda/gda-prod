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
                <h2>Ajouter un produit</h2>
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
    <form action="{{ route('products.store') }}" method="POST">
        @csrf

        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="form-group">
                    <strong>Référence:</strong>
                    <input style="text-transform: uppercase;" type="text" name="reference" class="form-control"
                        placeholder="Reference">
                </div>

                <div class="form-group form-inline" style="display: flex;">
                    <div>
                        <strong>Service:</strong>
                        <select class="form-control" name="service" id="service-select" required>
                            @foreach ($services as $service)
                            <option value="{{ $service }}">{{ $service }}</option>
                            @endforeach
                        </select>
                    </div>

                    @foreach ( $services as $service)
                    <div class="natures" id="{{ $service."-list" }}" style="display: none; margin-left:5px;">
                        <strong>Nature:</strong>
                        <select class="form-control nature-select" name="nature" id="nature-select-{{ $service }}">
                            @foreach (app\Models\Product::getNatures($service) as $nature)
                            <option value="{{ $nature }}">{{ $nature }}</option>
                            @endforeach
                        </select>
                    </div>
                    @endforeach

                </div>

                <div class="form-group">
                    <strong>Désignation:</strong>
                    <input type="text" name="name" class="form-control input-sm" placeholder="Designation">
                </div>

                <div class="form-group">
                    <strong>Marque:</strong>
                    <input type="text" class="form-control" name="brand" placeholder="Marque">
                </div>

                <div class="form-group">
                    <strong>Prix:</strong>
                    <input type="number" step="any" class="form-control" name="price" placeholder="Prix">
                </div>

                <div class="form-group">
                    <strong>Seuil d'Alerte:</strong>
                    <input type="number" step="any" class="form-control" name="alert" placeholder="Seuil d'alerte"
                        min="0">
                </div>

                <div class="form-group">
                    <strong>Unité:</strong>
                    <select class="form-control" name="unit" id="team-select">
                        @foreach ($units as $unit)
                        <option value="{{ $unit }}">{{ $unit }}</option>
                        @endforeach
                    </select>
                </div>

                <div class="form-group">
                    <strong>Fournisseur:</strong>
                    <select class="form-control" name="supplier" id="team-select">
                        <option value="" selected>Aucun</option>
                        @foreach ($suppliers as $supplier)
                        <option value="{{ $supplier->id }}">{{ $supplier->name }}</option>
                        @endforeach
                    </select>
                </div>
            </div>

            <div class="col-xs-12 col-sm-12 col-md-12 text-center">
                <button type="submit" class="btn btn-primary">Valider</button>
            </div>
        </div>

    </form>

    <script>
        service = document.getElementById('service-select');
        lists = document.getElementsByClassName('natures');

        service.addEventListener('change', function(){
            [].forEach.call(document.querySelectorAll('.natures'), function (el) {
                el.style.display = 'none';
            });
            [].forEach.call(document.querySelectorAll('.nature-select'), function (el) {
                el.setAttribute('name','');
            });

            selected = document.getElementById(service.value+"-list");
            selected.style.display = "block";
            document.getElementById("nature-select-"+service.value).setAttribute('name','nature');
        });
    </script>
    @endsection
