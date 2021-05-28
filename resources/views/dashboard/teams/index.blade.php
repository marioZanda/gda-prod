@extends('layouts.app')

@section('content')
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="#">
                    <em class="fa fa-home"></em>
                </a></li>
            <li class="active">Equipes</li>
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
            <h1 class="display-3">Equipes</h1>
            @if(session()->get('success'))
            <div class="alert alert-success">
                {{ session()->get('success') }}
            </div>
            @endif
            <div>
                <a style="margin: 19px;" href="{{ route('teams.create')}}" class="btn btn-primary">Nouvelle
                    equipe</a>
            </div>
            <table id="tableData" class="table table-striped">
                <thead>
                    <tr>
                        <th>Nom</th>
                        <th>Superviseur</th>
                        <th>Chef</th>
                        <th>Ouvrier en formation</th>
                        <th colspan=2>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($teams as $team)
                    <td>{{ $team->name }}</td>
                    <td>{{ $team->superviser->firstname }}</td>
                    <td>
                        @if ($chief = $team->chief)
                        {{  $chief->firstname." ".$chief->lastname }}
                        @endif
                    </td>
                    <td>
                        @if ($of = $team->of)
                        {{  $of->firstname." ".$of->lastname }}
                        @endif
                    </td>
                    <td>
                        <a href="{{ route('teams.edit',$team->id)}}" class="btn btn-primary">Modifier</a>
                    </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
            <div>
            </div>
        </div>
        
        @endsection
