@extends('layouts.app')

@section('content')
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="#">
                    <em class="fa fa-home"></em>
                </a></li>
            <li class="active">Stock</li>
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
            <h1 class="display-2">Stock</h1>
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
                        <th>Réference</th>
                        <th hidden>Barecode</th>
                        <th>Nature</th>
                        <th>Dénomination</th>
                        <th>Marque</th>
                        <th>Quantité</th>
                        <th>Alert</th>
                        <th>Unité</th>
                        <th colspan=2>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($stocks as $stock)
                    @if(in_array($stock->product->service, $services))
                    <tr>
                        <td style="text-transform: uppercase;">{{$stock->product->reference}}</td>
                        <td hidden>
                            <?php //echo DNS1D::getBarcodeHTML($stock->product->reference, 'C39+',1,50,'black', true);?>
                        </td>
                        <td>{{$stock->product->nature}}</td>
                        <td>{{$stock->product->name}}</td>
                        <td>{{$stock->product->brand}}</td>
                        <td @if($stock->product->alert > $stock->value)style="color: red;"@else style="color:
                            green;"@endif>{{ $stock->value }}</td>
                        <td hidden> @if($stock->product->alert > $stock->value) rouge @else vert @endif</td>
                        <td>{{ $stock->product->alert }}</td>
                        <td>{{$stock->product->unit}}</td>
                        <td>
                            <a href="{{ route('mouvments.show', $stock->product->id) }}" class="btn btn-warning"><em
                                    class="fa fa-calendar"></em></a>
                        </td>
                        <td>
                            <a href="{{ route('products.show', $stock->product->id) }}" class="btn btn-success "><em
                                    class="fa fa-info"></em></a>
                        </td>
                    </tr>
                    @else
                    @php
                    $services[] = $stock->product->service;
                    @endphp
                    <tr>
                        <td style="text-align:center; background-color:#d3d3d3;" colspan="10">
                            {{ $stock->product->service }} </td>
                    </tr>

                    <tr>
                        <td style="text-transform: uppercase;">{{$stock->product->reference}}</td>
                        <td hidden>@php
                            echo '<img src="data:image/png;base64,' . DNS1D::getBarcodePNG(" 4", "C39+" )
                                . '" alt="barcode"   />' ; @endphp</td> <td>{{$stock->product->nature}}</td>
                        <td>{{$stock->product->name}}</td>
                        <td>{{$stock->product->brand}}</td>
                        <td @if($stock->product->alert > $stock->value)style="color: red;"@else style="color:
                            green;"@endif>{{ $stock->value }}</td>
                        <td hidden> @if($stock->product->alert > $stock->value) rouge @else vert @endif</td>
                        <td>{{ $stock->product->alert }}</td>
                        <td>{{$stock->product->unit}}</td>
                        <td>
                            <a href="{{ route('mouvments.show', $stock->product->id) }}" class="btn btn-warning"><em
                                    class="fa fa-calendar"></em></a>
                        </td>
                        <td>
                            <a href="{{ route('products.show', $stock->product->id) }}" class="btn btn-success "><em
                                    class="fa fa-info"></em></a>
                        </td>
                    </tr>
                    @endif
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>

<script type="text/javascript">
    $("#export").click(function() {
        var dateObj = new Date();
        var date = $.datepicker.formatDate('dd_M_yy', dateObj);
        var time  = dateObj.getHours()+"h:"+dateObj.getMinutes()+"min";
         $('#tableData').csvExport({
            title:"stock_at_"+date+"_"+time
         });
        });
</script>
@endsection
