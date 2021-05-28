@extends('layouts.app')

@section('content')
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="#">
                    <em class="fa fa-home"></em>
                </a></li>
            <li class="active">Conducteurs de Travaux</li>
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
            <h1 class="display-3">Conducteurs de travaux</h1>
            @if(session()->get('success'))
            <div class="alert alert-success">
                {{ session()->get('success') }}
            </div>
            @endif
            <div>
                <a style="margin: 19px;" href="{{ route('supervisers.create')}}" class="btn btn-primary">Nouveau
                    Conducteur</a>
            </div>
            <table id="tableData" class="table table-striped">
                <thead>
                    <tr>
                        <th>Prenom</th>
                        <th>Nom</th>
                        <th>Contact</th>
                        <th>Domaine</th>
                        <th>Equipes</th>
                        <th colspan=2>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($supervisers as $superviser)
                    <td>{{$superviser->firstname}}</td>
                    <td>{{$superviser->lastname}}</td>
                    <td>{{$superviser->contact}}</td>
                    <td>{{$superviser->domain}}</td>
                    <td>
                        @foreach ($superviser->teams as $team)
                        {{$team->name.""}}<br>
                        @endforeach
                    </td>
                    <td>
                        <a href="{{ route('supervisers.edit',$superviser->id)}}" class="btn btn-primary">Modifier</a>
                    </td>
                    <td>
                        <form action="{{ route('supervisers.destroy', $superviser->id)}}" method="post">
                            @csrf
                            @method('DELETE')
                            <button class="btn btn-danger"
                                onclick="return confirm('Voulez-vous vraiment supprimer ce conducteur ?')"
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
        
        @endsection
