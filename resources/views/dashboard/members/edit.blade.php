@extends('layouts.app')

@section('content')
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="#">
                    <em class="fa fa-home"></em>
                </a></li>
            <li class="active">membre d'equipe</li>
            <li class="active">modifier</li>
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
                <h2>Modifier {{ $member->firstname." ".$member->lastname }}</h2>
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
    <form action="{{ route('members.update', $member->id) }}" method="POST">
        @csrf
        @method('PUT')
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="form-group" hidden>
                    <strong>ID:</strong>
                    <input type="text" name="id" value="{{ $member->id }}" disabled="disable">
                </div>
                <div class="form-group">
                    <strong>Prenom:</strong>
                    <input type="text" name="firstname" class="form-control" placeholder="Prenom"
                        value="{{ $member->firstname }}">
                </div>
                <div class="form-group">
                    <strong>Nom:</strong>
                    <input type="text" name="lastname" class="form-control" placeholder="Nom"
                        value="{{ $member->lastname }}">
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="form-group">
                    <strong>Contact:</strong>
                    <input type="tel" class="form-control" name="contact" placeholder="Contact"
                        value="{{ $member->contact }}">
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="form-group">
                    <strong>Equipe:</strong>
                    <select class="form-control" name="team_id" id="team-select">
                        @if($member->team_id !== null)
                        <option value="" selected>Aucune</option>
                        @foreach ($teams as $team)
                        <option value="{{ $team->id  }}" {{ ( $member->team->id == $team->id)? "selected" : "" }}>
                            {{ $team->name }}</option>
                        @endforeach
                        @else
                        @foreach ($teams as $team)
                        <option value="">Aucune</option>
                        <option value="{{ $team->id  }}">
                            {{ $team->name }}</option>
                        @endforeach
                        @endif

                    </select> </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-12">
                <Strong>Chef</Strong>
                <input type="radio" class="" name="title" value="chief" {{ ($member->title=="CHIEF")? "checked" : "" }}>

                <strong for="of">OF</strong>
                <input type="radio" class="" name="title" value="of" {{ ($member->title=="OF")? "checked" : "" }}>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-12 text-center">
                <button type="submit" class="btn btn-primary">Valider</button>
            </div>
        </div>

    </form>
    @endsection
