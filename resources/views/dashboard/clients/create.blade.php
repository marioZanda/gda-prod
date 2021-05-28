@extends('layouts.app')

@section('content')
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="#">
                    <em class="fa fa-home"></em>
                </a></li>
            <li class="active">Client</li>
        </ol>
    </div>
    <!--/.row-->

    <!-- <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Fournisseurs</h1>
        </div>
    </div> -->

    <div class="row">
        <div class="col-lg-12 margin-tb">
            <div class="pull-left">
                <h2>Ajouter un client</h2>
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
    <form action="{{ route('clients.store') }}" method="POST">
        @csrf

        <div class="row">
            <div class="col-xs-6 col-sm-6 col-md-6">
                <div class="form-group">
                    <strong>Name:</strong>
                    <input type="text" name="name" class="form-control" placeholder="Name" required>
                </div>
            </div>
            <div class="col-xs-6 col-sm-6 col-md-6">
                <div class="form-group">
                    <strong>Address:</strong>
                    <textarea class="form-control" style="height:50px" name="address" placeholder="address"></textarea>
                </div>
            </div>
            <div class="col-xs-6 col-sm-6 col-md-6">
                <div class="form-group">
                    <strong>Contact:</strong>
                    <input type="tel" name="contact" class="form-control" placeholder="contact" required>
                </div>
            </div>
            <input type="text" name="products" id="products_input" hidden readonly>
            <div class="col-xs-6 col-sm-6 col-md-6">
                <div class="form-group">
                    <strong>Conducteur de travaux:</strong>
                    <select class="form-control" name="superviser" id="superviser-select" style="height: 46px;">
                        <option value="" selected>Aucun</option>
                        @foreach ($supervisers as $superviser)
                        <option value="{{ $superviser->id  }}">{{ $superviser->firstname." ".$superviser->lastname }}
                        </option>
                        @endforeach
                    </select>
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-12 text-center">
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
        </div>

        <div class="row">
            <div class="col-md-10 col-md-offset-1">
                <table id="tableData" class="table table-striped tableSorter">
                    <thead>
                        <tr>
                            <th>Nature</th>
                            <th>Dénomination</th>
                            <th>Marque</th>
                            <th>Ajouter</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach(app\Models\Product::getServices() as $service)
                        <tr>
                            <td style="text-align:center; background-color:#d3d3d3;" colspan="4">{{ $service }} </td>
                        </tr>
                        @foreach($products as $product)
                        @if($product->service == $service)
                        <tr>
                            <td>{{$product->nature}}</td>
                            <td hidden>{{$product->service}}</td>
                            <td>{{$product->name}}</td>
                            <td>{{$product->brand}}</td>
                            <td>
                                <em class="btn btn-primary fa fa-plus" id="{{ $product->id }}"
                                    onclick="addProd({{ $product->id }})"></em>
                            </td>
                            <td id="{{ $product->id."is_selected" }}" hidden>not selected</td>
                        </tr>
                        @endif
                        @endforeach
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>

    </form>

    <script>
        function addProd(value){
            input = document.getElementById('products_input');
            isSelected = document.getElementById(value+'is_selected');
            element = document.getElementById(value);
            if (element.className == "btn btn-primary fa fa-plus"){
                element.className = "btn btn-success fa fa-check";
                input.value += value+",";
                isSelected.textContent = "choisi";
            } else {
                element.className = "btn btn-primary fa fa-plus";
                input.value = input.value.replace(value+",",'');
                isSelected.textContent = " not selected";
            }
        }
    </script>
    @endsection
