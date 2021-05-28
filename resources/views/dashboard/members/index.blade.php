@extends('layouts.app')

@section('content')
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="#">
                    <em class="fa fa-home"></em>
                </a></li>
            <li class="active">Membres d'equipes</li>
        </ol>
    </div>


    <div class="row">
        <div class="col-sm-12">
            <div class="row">
                <div class="col-sm-9">
                    <h1 class="display-3">Membres d'equipe</h1>
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
                <a style="margin: 19px;" href="{{ route('members.create')}}" class="btn btn-primary">Nouveau
                    membre</a>
            </div>
            <table id="tableData" class="table table-striped">
                <thead>
                    <tr>
				<th>Reference</th>
                        <th>Prenom</th>
                        <th>Nom</th>
                        <th>Contact</th>
                        <th>Equipe</th>
                        <th>Titre</th>
                        <th colspan=2>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($members as $member)
                    <tr>
				<td>{{$member->reference}}</td>
                        <td>{{$member->firstname}}</td>
                        <td>{{$member->lastname}}</td>
                        <td>{{$member->contact}}</td>
                        <td>
                            {{ ($member->team_id !== NULL)?$member->team->name:"" }}
                        </td>
                        <td>{{$member->title}}</td>
                        <td>
                            <a href="{{ route('members.edit',$member->id)}}" class="btn btn-primary">Modifier</a>
                        </td>
                        <td>
                            <form action="{{ route('members.destroy', $member->id)}}" method="post">
                                @csrf
                                @method('DELETE')
                                <button class="btn btn-danger"
                                    onclick="return confirm('Voulez-vous vraiment supprimer {{$member->firstname}}  {{$member->lastname}} ?')"
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
    @endsection
