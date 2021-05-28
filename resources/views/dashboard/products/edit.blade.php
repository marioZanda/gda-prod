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
                <h2>Modifier {{ $product->name }}</h2>
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
    <form action="{{ route('products.update', $product->id) }}" method="POST">
        @csrf
        @method('PUT')
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="form-group">
                    <strong>Référence:</strong>
                    <input style="text-transform: uppercase;" type="text" name="reference" class="form-control"
                        placeholder="Reference" value="{{ $product->reference }}">
                </div>

                <div class="form-group form-inline" style="display: flex;">
                    <div>
                        <strong>Service:</strong>
                        <select class="form-control" name="service" id="service-select">
                            @foreach ($services as $service)
                            <option value="{{ $service }}" {{ ($product->service == $service)?"selected":"" }}>
                                {{ $service }}</option>
                            @endforeach
                        </select>
                    </div>

                    @foreach ( $services as $service)
                    <div class="natures" id="{{ $service."-list" }}" style="display: none; margin-left:5px;">
                        <strong>Nature:</strong>
                        <select class="form-control nature-select" name="nature" id="nature-select-{{ $service }}">
                            @foreach (app\Models\Product::getNatures($service) as $nature)
                            <option value="{{ $nature }}" {{ ($product->nature == $nature)?"selected":"" }}>
                                {{ $nature }}</option>
                            @endforeach
                        </select>
                    </div>
                    @endforeach

                </div>

                <div class="form-group">
                    <strong>Désignation:</strong>
                    <input type="text" name="name" class="form-control input-sm" placeholder=" Designation"
                        value="{{ $product->name }}">
                </div>

                <div class="form-group">
                    <strong>Marque:</strong>
                    <input type="text" class="form-control" name="brand" placeholder="Marque"
                        value="{{ $product->brand }}">
                </div>

                <div class="form-group">
                    <strong>Prix:</strong>
                    <input type="number" step="any" class="form-control" name="price" placeholder="Prix"
                        value="{{ $product->price }}">
                </div>

                <div class="form-group">
                    <strong>Seuil d'Alerte:</strong>
                    <input type="number" step="any" class="form-control" name="alert" placeholder="Seuil d'alerte"
                        value="{{ $product->alert }}">
                </div>

                <div class="form-group">
                    <strong>Unité:</strong>
                    <select class="form-control" name="unit" id="team-select">
                        @foreach ($units as $unit)
                        <option placeholder="{{ $unit }}" {{ ($product->unit == $unit)?'selected':'' }}>{{ $unit }}
                        </option>
                        @endforeach
                    </select>
                </div>

                <div class="form-group">
                    <strong>Fournisseur:</strong>
                    <select class="form-control" name="supplier" id="team-select">
                        @foreach ($suppliers as $supplier)
                        <option value="{{ $supplier->id }}" placeholder="{{ $supplier->id }}"
                            @isset($product->supplier){{ ($product->supplier->id == $supplier->id)?'selected':'' }}@endisset>{{ $supplier->name }}</option>
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
