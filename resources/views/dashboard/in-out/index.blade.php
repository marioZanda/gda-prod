@extends('layouts.app')

@section('content')
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="#">
                    <em class="fa fa-home"></em>
                </a></li>
            <li class="active">Entrées - Sorties</li>
        </ol>
    </div>


    <div class="row">
        <div class="col-sm-12">
            <div class="row">
                <div class="col-sm-9">
                    <h1 class="display-3">Entrées et Sorties</h1>
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
        </div>
    </div>

    <div class="panel panel-container">
        <div class="row">
            <div class="col-xs-6 col-md-3 col-lg-3 no-padding">
                <div class="panel panel-teal panel-widget border-right">
                    <div class="row no-padding"><em class="fa fa-xl fa-arrow-circle-right color-blue"></em>
                        <div class="large"><a href="{{ route('in-out.in') }}">Entrée</a></div>
                        <div class="text-muted">Nouvelle entrée</div>
                    </div>
                </div>
            </div>
            <div class="col-xs-6 col-md-3 col-lg-3 no-padding">
                <div class="panel panel-blue panel-widget border-right">
                    <div class="row no-padding"><em class="fa fa-xl fa-arrow-circle-left color-orange"></em>
                        <div class="large"><a href="{{ route('in-out.out') }}">Sortie</a></div>
                        <div class="text-muted">Nouvelle Sortie</div>
                    </div>
                </div>
            </div>
            <div class="col-xs-6 col-md-3 col-lg-3 no-padding">
                <div class="panel panel-orange panel-widget border-right">
                    <div class="row no-padding"><em class="fa fa-xl fa-archive color-teal"></em>
                        <div class="large"><a href="{{ route('stocks.index') }}">Stock</a></div>
                        <div class="text-muted">Voir Stock</div>
                    </div>
                </div>
            </div>
            <div class="col-xs-6 col-md-3 col-lg-3 no-padding">
                <div class="panel panel-red panel-widget ">
                    <div class="row no-padding"><em class="fa fa-xl fa-search color-red"></em>
                        <div class="large"><a href="{{ route('products.index') }}">Produits</a></div>
                        <div class="text-muted">Voir Produits</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<style>
    a {
        color: black;
    }
</style>
@endsection
