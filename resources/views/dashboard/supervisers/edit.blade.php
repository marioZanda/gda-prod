@extends('layouts.app')

@section('content')
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="#">
                    <em class="fa fa-home"></em>
                </a></li>
            <li class="active">Conducteur de travaux</li>
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
                <h2>Ajouter un conducteur de travaux</h2>
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
    <form action="{{ route('supervisers.update', $superviser->id) }}" method="POST">
        @csrf
        @method('PUT')
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="form-group" hidden>
                    <strong>ID:</strong>
                    <input type="text" name="id" value="{{ $superviser->id }}" disabled="disable">
                </div>
                <div class="form-group">
                    <strong>Prenom:</strong>
                    <input type="text" name="firstname" class="form-control" placeholder="Prenom"
                        value="{{ $superviser->firstname }}">
                </div>
                <div class="form-group">
                    <strong>Nom:</strong>
                    <input type="text" name="lastname" class="form-control" placeholder="Nom"
                        value="{{ $superviser->lastname }}">
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="form-group">
                    <strong>Contact:</strong>
                    <input type="tel" class="form-control" name="contact" placeholder="Contact"
                        value="{{ $superviser->contact }}">
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="form-group">
                    <strong>Domaine:</strong>
                    <select class="form-control" name="domain" id="team-select">
                        @foreach ($domains as $domain)
                        <option value="{{ $domain }}" {{ ($superviser->domain == $domain)?'selected':'' }}>{{ $domain }}
                        </option>
                        @endforeach
                    </select>
                </div>
            </div>

            <div class="col-xs-12 col-sm-12 col-md-12 text-center">
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
        </div>

    </form>
    @endsection
