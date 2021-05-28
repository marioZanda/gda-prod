@extends('layouts.app')

@section('content')
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="#">
                    <em class="fa fa-home"></em>
                </a></li>
            <li class="active">Fournisseurs</li>
        </ol>
    </div>
    <!--/.row-->

    <!-- <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Fournisseurs</h1>
        </div>
    </div> -->

    <div class="row">
        <div class="col-sm-12">
            <div class="row">
                <div class="col-sm-9">
                    <h1 class="display-3">Fournisseurs</h1>
                </div>
                <div class="col-sm-3 ">
                    <a class="pull-right btn btn-primary" href="{{ url()->previous() }}" title="Go back"> <i
                            class="fa fa-backward "></i>
                    </a>
                </div>
            </div>
            @if(session()->get('success'))
            <div class="alert alert-success">
                {{ session()->get('success') }}
            </div>
            @endif
            <div>
                <a style="margin: 19px;" href="{{ route('suppliers.create')}}" class="btn btn-primary">Nouveau
                    fournisseur</a>
            </div>
            <table id="tableData" class="table table-striped">
                <thead>
                    <tr>
                        <th>Nom</th>
                        <th>Adresse</th>
                        <th>Contact</th>
                        <th colspan=2>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($suppliers as $supplier)
                    <tr>
                        <td>{{$supplier->name}}</td>
                        <td>{{$supplier->address}}</td>
                        <td>{{$supplier->contact}}</td>
                        <td>
                            <a href="{{ route('suppliers.edit',$supplier->id)}}" class="btn btn-primary">Modifier</a>
                        </td>
                        <td>
                            <form action="{{ route('suppliers.destroy', $supplier->id)}}" method="post">
                                @csrf
                                @method('DELETE')
                                <button class="btn btn-danger"
                                    onclick="return confirm('Voulez-vous vraiment supprimer ce fournisseur ?')"
                                    type="submit">Supprimer</button>
                            </form>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
            <div>
            </div>
        </div>
    </div>
    <!--/.main-->

    
    @endsection
