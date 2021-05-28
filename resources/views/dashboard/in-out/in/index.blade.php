@extends('layouts.app')

@section('content')
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">

    <div class="row">
        <ol class="breadcrumb">
            <li><a href="#">
                    <em class="fa fa-home"></em>
                </a></li>
            <li>Entrées - Sorties</li>
            <li class="active">Entrée</li>
        </ol>
    </div>

    <div class="row">
        <div class="col-sm-6">
            <h1 class="display-3">Entrée</h1>
            @if(session()->get('success'))
            <div class="alert alert-success">
                {{ session()->get('success') }}
            </div>
            @endif
        </div>
    </div>
    <div class="row">
        <div class="col-sm-6">
            <label for="reference">Référence</label>
            <input type="text" name="" id="refs" autofocus></input>
        </div>
    </div>
    <form class="form-group" action="{{ route('in-out.in_store') }}" method="POST">
        @csrf
        <div class="row">
            <div class="col-sm-12">
                <input type="text" id="refs_list" name="refs_list" value="" autocomplete="off" readonly hidden>
                <input type="text" id="motif_clone" name="motif" value="" readonly hidden>
                <table id="" class="table table-hover">
                    <thead>
                        <tr>
                            <th>Réference</th>
                            <th>Dénomination</th>
                            <th>Marque</th>
                            <th>Quantité à ajouter</th>
                        </tr>
                    </thead>
                    <tbody id="entries">
                    </tbody>
                </table>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 text-center">
                <button id="submitBtn" type="submit" class="btn btn-primary" disabled>Submit</button>
            </div>
        </div>
    </form>
</div>
<script>
    loadIn();
    var motif = document.getElementById('motif');
    var clone = document.getElementById('motif_clone');
    motif.addEventListener('input', function(e){
        clone.value = motif.value;
    });
</script>
@endsection
