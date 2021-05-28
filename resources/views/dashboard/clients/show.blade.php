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
                    <input type="text" name="name" class="form-control" value="{{ $client->name }}" readonly>
                </div>
            </div>
            <div class="col-xs-6 col-sm-6 col-md-6">
                <div class="form-group">
                    <strong>Address:</strong>
                    <textarea class="form-control" style="height:50px" name="address" readonly>{{ $client->address }}</textarea>
                </div>
            </div>
            <div class="col-xs-6 col-sm-6 col-md-6">
                <div class="form-group">
                    <strong>Contact:</strong>
                    <input type="tel" name="contact" class="form-control" value="{{ $client->contact }}" readonly>
                </div>
            </div>
            <div class="col-xs-6 col-sm-6 col-md-6">
                <div class="form-group">
                    <strong>Conducteur de travaux:</strong>
                    <input type="tel" name="contact" class="form-control" value="{{ $client->superviser->firstname.' '.$client->superviser->lastname }}" readonly>
                </div>
            </div>


        </div>

        <div class="row">
            <div class="col-md-10 col-md-offset-1">
                <table id="tableData" class="table table-striped tableSorter">
                    <thead>
                        <tr>
                            <th>Reference</th>
                            <th>Nature</th>
                            <th>Dénomination</th>
                            <th>Marque</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($products as $product)
                        @if(in_array($product->service, $services))
                        <tr>
                            <td>{{$product->reference}}</td>
                            <td>{{$product->nature}}</td>
                            <td hidden>{{$product->service}}</td>
                            <td>{{$product->name}}</td>
                            <td>{{$product->brand}}</td>
                        </tr>
                        @else
                        @php
                            $services[] = $product->service;
                        @endphp
                        <tr>
                            <td style="text-align:center; background-color:#d3d3d3;" colspan="4">{{ $product->service }} </td>
                        </tr>
                        <tr>
                            <td>{{$product->reference}}</td>
                            <td>{{$product->nature}}</td>
                            <td hidden>{{$product->service}}</td>
                            <td>{{$product->name}}</td>
                            <td>{{$product->brand}}</td>
                        </tr>

                        @endif
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>

    </form>
    @endsection
