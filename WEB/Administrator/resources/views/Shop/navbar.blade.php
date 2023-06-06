<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Ar-Course</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="<?php echo asset('assets/favicon.ico') ?>" />
        <!-- Bootstrap icons-->
        <link href="<?php echo asset('https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css')?>" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="<?php echo asset('css/styles.css')?>" rel="stylesheet" />
        @yield('link')
    </head>
    <body>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="#!">Arrian-Course</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="/home">Special Offer</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Categories</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="/sd-mi">SD / MI</a></li>
                                <li><a class="dropdown-item" href="/smp-mts">SMP / MTs</a></li>
                                <li><a class="dropdown-item" href="/sma-ma">SMA / MA</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">All Products</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">Popular Items</a></li>
                                <li><a class="dropdown-item" href="#!">New Arrivals</a></li>
                            </ul>
                        </li>
                    </ul>
                    <form class="d-flex">
                        <?php $status = Session::get('status');?>
                        @if ($status == "login")
                            <a href="/profile" class="btn btn-outline-light">
                                <i class="bi-person-fill me-1"></i>
                                <?php echo Session::get('user')?>
                                <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                            </a>
                        @else
                            <a href="/login" class="btn btn-outline-light">
                                <i class="bi-person-fill me-1"></i>
                                Profile
                                <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                            </a>    
                        @endif
                        
                    </form>
                </div>
            </div>
        </nav>
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Did you have choose your order?</h1>
                    <p class="lead fw-normal text-white-50 mb-0">Make your world shiny with our product</p>
                </div>
            </div>
        </header>
        <!-- Section-->
        @yield('section')
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2022</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="<?php echo asset('https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js')?>"></script>
        <!-- Core theme JS-->
        <script src="<?php echo asset('js/scripts.js')?>"></script>
    </body>
</html>
