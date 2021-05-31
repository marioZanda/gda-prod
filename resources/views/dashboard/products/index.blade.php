@extends('layouts.app')

@section('content')
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="#">
                    <em class="fa fa-home"></em>
                </a></li>
            <li class="active">Produits</li>
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
            <h1 class="display-3">Produits</h1>
            @if(session()->get('success'))
            <div class="alert alert-success">
                {{ session()->get('success') }}
            </div>
            @endif
        </div>

    </div>
    <div class="row">
        <div class="col-sm-12">
            <div>
                <div class="col-md-6">
                    <a style="margin: 19px;" href="{{ route('products.create')}}" class="btn btn-primary">Nouveau
                        Produit</a>
                </div>
                <div class="col-md-6">
                    <button id="refsBtn" style="margin: 19px;" class="btn btn-primary"
                        onclick="downloadFile()">Références</button>
                </div>
            </div>
            <table id="tableData" class="table table-striped tableSorter">
                <thead>
                    <tr>
                        <th>Réference</th>
                        <th>Nature</th>
                        <th>Dénomination</th>
                        <th>Marque</th>
                        <th>Prix</th>
                        <th>Fournisseur</th>
                        <th colspan=3>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($products as $product)
                    @if(in_array($product->service, $services))
                    <tr>
                        <td style="text-transform: uppercase;">{{$product->reference}}</td>
                        <td>{{$product->nature}}</td>
                        <td hidden>{{$product->service}}</td>
                        <td>{{$product->name}}</td>
                        <td>{{$product->brand}}</td>
                        <td>{{$product->price}} €</td>
                        <td>@isset($product->supplier){{$product->supplier->name}}@endisset</td>
                        <td>
                            <a href="{{ route('products.show', $product->id)}}" class="btn btn-success"><em
                                    class="fa fa-info"></em></a>
                        </td>
                        <td>
                            <a href="{{ route('products.edit',$product->id)}}" class="btn btn-primary"><em
                                    class="fa fa-pencil"></em></a>
                        </td>
                        <td>
                            <form action="{{ route('products.destroy', $product->id)}}" method="post">
                                @csrf
                                @method('DELETE')
                                <button class="btn btn-danger"
                                    onclick="return confirm('Voulez-vous vraiment supprimer {{$product->name}} de {{$product->brand}} ?')"
                                    type="submit"><em class="fa fa-trash"></em></button>
                            </form>
                        </td>
                    </tr>
                    @else
                    @php
                    $services[] = $product->service;
                    @endphp
                    <tr>
                        <td style="text-align:center; background-color:#d3d3d3;" colspan="9">{{ $product->service }}
                        </td>
                    </tr>

                    <tr>
                        <td style="text-transform: uppercase;">{{$product->reference}}</td>
                        <td>{{$product->nature}}</td>
                        <td hidden>{{$product->service}}</td>
                        <td>{{$product->name}}</td>
                        <td>{{$product->brand}}</td>
                        <td>{{$product->price}} €</td>
                        <td>@isset($product->supplier){{$product->supplier->name}}@endisset</td>
                        <td>
                            <a href="{{ route('products.show', $product->id)}}" class="btn btn-success"><em
                                    class="fa fa-info"></em></a>
                        </td>
                        <td>
                            <a href="{{ route('products.edit',$product->id)}}" class="btn btn-primary"><em
                                    class="fa fa-pencil"></em></a>
                        </td>
                        <td>
                            <form action="{{ route('products.destroy', $product->id)}}" method="post">
                                @csrf
                                @method('DELETE')
                                <button class="btn btn-danger"
                                    onclick="return confirm('Voulez-vous vraiment supprimer {{$product->name}} de {{$product->brand}} ?')"
                                    type="submit"><em class="fa fa-trash"></em></button>
                            </form>
                        </td>
                    </tr>

                    @endif
                    @endforeach
                </tbody>
            </table>
            <div>
            </div>
        </div>

        <script>
            function downloadFile() {
                fetch(`products.refs`).then(response => response.json())
                    .then(refs => treat(refs)).catch((error) => {
                        console.log(error)
                });
            }
            function treat(p){
                let ref_array = [];
                for (var key in p) {
                    if (p.hasOwnProperty(key)) {
                        console.log(p[key].reference);
                        ref_array.push(p[key].reference+"\n");
                    }
                }
                const a = document.createElement("a");
                a.href = URL.createObjectURL(new Blob(ref_array, {
                    type: "text/plain"
                }));
                a.setAttribute("download", "references.txt");
                document.body.appendChild(a);
                a.click();
                document.body.removeChild(a);

            }
        </script>
        @endsection
