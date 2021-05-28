@extends('layouts.app')

@section('content')
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="#">
                    <em class="fa fa-home"></em>
                </a></li>
            <li class="active">mouvements</li>
        </ol>
    </div>
    <!--/.row-->

    <!-- <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Fournisseurs</h1>
        </div>
    </div> -->

    <div class="row">
        <div class="col-sm-6">
            <h1 class="display-2">Mouvements</h1>
            @if(session()->get('success'))
            <div class="alert alert-success">
                {{ session()->get('success') }}
            </div>
            @endif
        </div>
        <div class="col-sm-6">
            <div class="row">
                <div class="col-sm-12">
                    <form class="form-inline" style="margin-top: 20px ;" action="">
                        <div class="form-group pull-right"><button id="export" class="btn btn-primary">Export</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </div>
    <div class="row">
        <div class="col-sm-12">
            <table id="tableData" class="table table-striped">
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Action</th>
                        <th>Service</th>
                        <th>Nature</th>
                        <th>Denomination</th>
                        <th>Marque</th>
                        <th>Quantité</th>
                        <th>Preneur</th>
                        <th>Equipe</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($mouvments as $mouvment)
                    <tr>
                        <td>{{ date('d/m/Y H:i:s', strtotime($mouvment->created_at)) }}</td>
                        <td>{{ ($mouvment->action == 'IN')?'Entrée':'Sortie' }}</td>
                        <td>{{$mouvment->product->service}}</td>
                        <td>{{$mouvment->product->nature}}</td>
                        <td>{{$mouvment->product->name}}</td>
                        <td>{{$mouvment->product->brand}}</td>
                        <td>{{$mouvment->quantity." ".$mouvment->product->unit}}</td>
                        <td>@if(@isset($mouvment->member)){{$mouvment->member->firstname." ".$mouvment->member->lastname}}@else
                            {{ "-" }}@endif
                        </td>
                        <td>@if(@isset($mouvment->member)){{($mouvment->member->team_id == null)?"-":$mouvment->member->team->name}}@else
                            {{ "-" }}@endif
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection
