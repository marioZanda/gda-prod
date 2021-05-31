@extends('layouts.app')

@section('content')
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="#">
                    <em class="fa fa-home"></em>
                </a></li>
            <li class="active">Alertes</li>
        </ol>
    </div>
    <!--/.row-->

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Alerts</h1>
        </div>
    </div>
    <!--/.row-->


    <div class="row">
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">Alertes - Stock
                            <span class="pull-right clickable panel-toggle"><em class="fa fa-toggle-up"></em></span>
                        </div>
                        <div class="panel-body">
                            <table id="tableData" class="table table-striped">
                                <thead>
                                    <tr>
                                        <th style="background-color:red ;">Reference</th>
                                        <th style="background-color:red ;">Nature</th>
                                        <th style="background-color:red ;">Dénomination</th>
                                        <th style="background-color:red ;">Marque</th>
                                        <th style="background-color:red ;">Prix</th>
                                        <th style="background-color:red ;">Quantité</th>
                                        <th style="background-color:red ;">Alerte</th>
                                        <th style="background-color:red ;">Fournisseur</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @for ($i = 0; $i < count($stocks); $i++) <td>{{$products[$i]->reference}}</td>
                                        <td>{{$products[$i]->nature}}</td>
                                        <td hidden>{{$products[$i]->service}}</td>
                                        <td>{{$products[$i]->name}}</td>
                                        <td>{{$products[$i]->brand}}</td>
                                        <td>{{$products[$i]->price}} €</td>
                                        <td>{{$stocks[$i]->value}}</td>
                                        <td>{{$products[$i]->alert}}</td>
                                        <td>@isset($product->supplier){{$products[$i]->supplier->name}}@endisset</td>
                                        </tr>
                                        @endfor
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div><!-- /.row -->
</div>
@endsection
