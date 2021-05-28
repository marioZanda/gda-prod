<!Doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Gestion de d�p�t') }}</title>

    <!-- Scripts -->
    <script type="text/javascript" src="{{ asset('lumino/js/jquery-1.11.1.min.js') }}"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>


    <script src="{{ asset('lumino/js/bootstrap.min.js') }}"></script>
    <!-- <script src="{{ asset('lumino/js/chart.min.js') }}"></script> -->
    <script src="{{ asset('lumino/js/in-out.js') }}"></script>
    <script src="{{ asset('lumino/js/chart-data.js') }}"></script>
    <script src="{{ asset('lumino/js/easypiechart.js') }}"></script>
    <script src="{{ asset('lumino/js/easypiechart-data.js') }}"></script>
    <script src="{{ asset('lumino/js/bootstrap-datepicker.js') }}"></script>
    <script src="{{ asset('lumino/js/custom.js') }}"></script>
    <!-- Paging JS -->
    <script type="text/javascript" src="{{ asset('lumino/js/paging.js') }}"></script>
    <script type="text/javascript" src="{{ asset('lumino/js/jquery.table-filter.js') }}"></script>
    <script type="text/javascript" src="{{ asset('lumino/js/csvExport.min.js') }}"></script>
    <script src="{{ asset('lumino/js/jquery.tablesorter.js') }}">
    </script>



    <script type="text/javascript">
        $(document).ready(function() {
            $('#tableData').paging({limit:10});
            $("#tableData").tablesorter({theme : 'blue',  });
            $('#tableData').tableFilter({});
            $("#export").click(function() {
                $('#tableData').csvExport();
            });
            });
    </script>

    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">

    <!-- Styles -->
    <link href="{{ asset('lumino/css/blue.min.css') }}" rel="stylesheet" />
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <link href="{{ asset('lumino/css/bootstrap.css') }}" rel="stylesheet">
    <link href="{{ asset('lumino/css/font-awesome.min.css') }}" rel="stylesheet">
    <link href="{{ asset('lumino/css/datepicker3.css') }}" rel="stylesheet">
    <link href="{{ asset('lumino/css/styles.css') }}" rel="stylesheet">
    <link rel="icon" href="{{ asset('images/abbei.png') }}">
    <link rel="icon" href="{{ asset('images/abbei.png') }}">
</head>

<body>
    {{ $agence = config('app.database') }}
    <div id="app">
        <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#sidebar-collapse"><span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span></button>
                    <a class="navbar-brand" href="#"><span>Abbei</span>Admin</a>
                    <button id="changeAgence" disabled>{{ $agence = Str::remove("db_",$agence) }}</button>
                </div>
            </div><!-- /.container-fluid -->
            <!---------------------------------------------- AGENCES ----------------------------------->
            <dialog id="favDialog" hidden>
                <form action="{{ route('space.change') }}" method="POST">
                    @csrf
                    <p><label>Agence à gérer :
                            <select name="agence">
                                <option {{ ($agence == "rouen")?"selected":"" }} value="rouen">Rouen</option>
                                <option {{ ($agence == "havre")?"selected":"" }} value="havre">Le Havre</option>
                                <option {{ ($agence == "louvier")?"selected":"" }} value="louvier">Louvier</option>
                            </select>
                        </label></p>
                    <menu>
                        <button value="cancel">Annuler</button>
                        <button type="submit" id="confirmBtn" value="default">Confirmer</button>
                    </menu>
                </form>
            </dialog>
            <script>
                (function() {
                var updateButton = document.getElementById('changeAgence');
                var favDialog = document.getElementById('favDialog');
                var selectEl = document.getElementsByTagName('select')[0];
                var confirmBtn = document.getElementById('confirmBtn');
                // Le bouton "mettre à jour les détails" ouvre la boîte de dialogue
                updateButton.addEventListener('click', function onOpen() {
                    if (typeof favDialog.showModal === "function") {
                    favDialog.showModal();
                    } else {
                    console.error("L'API dialog n'est pas prise en charge par votre navigateur");
                    }
                });
                // Le champ "animal préféré" définit la valeur pour le bouton submit
                selectEl.addEventListener('change', function onSelect(e) {
                    confirmBtn.value = selectEl.value;
                });
                // Le bouton "Confirmer" déclenche l'évènement "close" sur le dialog avec [method="dialog"]
                favDialog.addEventListener('close', function onClose() {
                    outputBox.value = "Vous avez cliqué sur le bouton " + favDialog.returnValue + " !";
                });
                })();

            </script>
            <!---------------------------------------------- AGENCES ----------------------------------->

            <!-- Right Side Of Navbar -->
            <ul class="navbar-nav">
                <!-- Authentication Links -->
                @guest
                @if (Route::has('login'))
                <h2>Veuillez vous connecter</h2>
                <hr>
                <li class="nav-item"><a class="nav-link" href="{{ route('login') }}">{{ __('Login') }}</a></li>
                <br>
                @endif

                @if (Route::has('register'))
                <li class="nav-item">
                <li class="nav-link" href="{{ route('register') }}">{{ __('Register') }}</a>
                </li>
            </ul>

    </div>
    </div>
    </nav>
    @endif
    @else
    </ul>
    </div>
    </div>
    </nav>
    <main class="py-4">
        <div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
            <div class="profile-sidebar">
                <div class="profile-userpic">
                    <img src="http://placehold.it/50/30a5ff/fff" class="img-responsive" alt="">
                </div>
                <div class="profile-usertitle">
                    <div class="profile-usertitle-name">{{ Auth::user()->name }}</div>
                    <div class="profile-usertitle-status"><span class="indicator label-success"></span>Online</div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="divider"></div>
            <ul class="nav menu">
                <li class="{{ (strpos(Route::current()->getName(),'in-out') !== false) ? 'active' : '' }}"><a
                        href="{{ route('in-out') }}"><em class="fa fa-dashboard">&nbsp;</em>Entrée / Sortie</a>
                </li>
                <li class="{{ (strpos(Route::current()->getName(),'mouvments') !== false) ? 'active' : '' }}"><a
                        href=" {{ route('mouvments.index') }}"><em class="fa fa-calendar">&nbsp;</em>
                        Mouvements</a>
                </li>

                <li class="{{ (strpos(Route::current()->getName(),'stock') !== false) ? 'active' : '' }}"><a
                        href="{{ route('stocks.index') }}"><em class="fa fa-archive">&nbsp;</em> Stock</a></li>
                <li class="{{ (strpos(Route::current()->getName(),'products') !== false) ? 'active' : '' }}"><a
                        href="{{ route('products.index') }}"><em class="fa fa-product-hunt">&nbsp;</em> Produits</a>
                </li>

                <li class="{{ (strpos(Route::current()->getName(),'teams') !== false) ? 'active' : '' }}"><a
                        href="{{ route('teams.index') }}"><em class=" fa fa-users">&nbsp;</em> Equipes</a></li>
                <li class="{{ (strpos(Route::current()->getName(),'supervisers') !== false) ? 'active' : '' }}"><a
                        href="{{ route('supervisers.index') }}"><em class=" fa fa-eye">&nbsp;</em> Conducteurs de
                        travaux</a></li>
                <li class="{{ (strpos(Route::current()->getName(),'members') !== false) ? 'active' : '' }}"><a
                        href="{{ route('members.index') }}"><em class=" fa fa-user">&nbsp;</em> Membres d'Equipes</a>
                </li>
                <li class="{{ (strpos(Route::current()->getName(),'clients') !== false) ? 'active' : '' }}""><a href="
                    {{ route('clients.index') }}"><em class="fa fa-wrench">&nbsp;</em> Clients</a></li>
                <li class="{{ (strpos(Route::current()->getName(),'suppliers') !== false) ? 'active' : '' }}""><a href="
                    {{ route('suppliers.index') }}"><em class="fa fa-truck">&nbsp;</em> Fournisseurs</a></li>
                <li class="{{ (strpos(Route::current()->getName(),'alerts') !== false) ? 'active' : '' }}"><a
                        href="{{ route('alerts') }}"><em class="fa fa-exclamation-triangle">&nbsp;</em> Alertes</a>
                </li>
                <li><a href="{{ route('logout') }}"
                        onclick="event.preventDefault(); document.getElementById('logout-form').submit();"><em
                            class="fa fa-power-off">&nbsp;</em> Logout</a></li>

                <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                    @csrf
                </form>
            </ul>
        </div>
        @yield('content')
    </main>
    @endguest
    </div>
</body>

</html>
