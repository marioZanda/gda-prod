@extends('layouts.app')

@section('content')
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="#">
                    <em class="fa fa-home"></em>
                </a></li>
            <li class="active">Clients</li>
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
                    <h1 class="display-3">Clients</h1>
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
                <a style="margin: 19px;" href="{{ route('clients.create')}}" class="btn btn-primary">Nouveau
                    Client</a>
            </div>
            @foreach ($clients as $client)
            <div class="col-sm-6 col-md-4">
                <div class="thumbnail">
                    <div class="caption">
                        <h2>{{ $client->name }}</h2>
                        <h4>Responsable : {{ $client->superviser->firstname." ".$client->superviser->lastname }}</h4>
                        <div style="display:flex;">
                            <a href="{{ route('clients.show', $client->id) }}" class="btn btn-warning"
                                role="button">Détails</a>
                            <a href="{{ route('clients.edit', $client->id) }}" class="btn btn-primary"
                                role="button">Modifier</a>
                            <form action="{{ route('clients.destroy', $client->id)}}" method="post">
                                @csrf
                                @method('DELETE')
                                <button class="btn btn-danger"
                                    onclick="return confirm('Voulez-vous vraiment supprimer {{$client->name}} ?')"
                                    type="submit">Supprimer</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            @endforeach
            <div>
            </div>
        </div>
    </div>
    <!--/.main-->


    @endsection
