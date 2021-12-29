<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link href="css/Login.css" rel="stylesheet">
    <title>Detalle denuncia Realizada</title>
</head>

<body class="fondo-login">

<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="home">AsegurApp</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="home">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="traerEspecialidades">Contratar</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="perfilUsuario">Perfil</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="mostrar-denuncias">Mis denuncias</a>
                </li>
                &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
                &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
                &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
                &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
                &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
                &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
                <form:form action="cerrarSesion" method="POST">
                    <button class="btn-primary border-white rounded-3">
                        cerrarSesion
                    </button>
                </form:form>
            </ul>
        </div>
    </div>
</nav>


<div class="w-100 container-fluid  mt-5  rounded-3 bg-light" style="max-width: 1024px;">
    <div class="card card-body p-5 mb-5">

        <div class="row">
            <div class="col text-center">
                <!-- Logo -->
                <img src="imagenes/logo.png" alt="..." class="img-fluid mb-4" style="max-width: 2.5rem;">
                <strong>AsegurAPP</strong>

                <h2 class="mb-2">
                    Detalle de denuncia realizada
                </h2>
            </div>
        </div>

        <div class="row">
            <div class="col-12 col-md-6">
                <h6 class="text-uppercase text-muted ">
                    Datos Personales<span class="badge bg-danger-soft">Danger</span>
                </h6>
                <p class="text-muted mb-4">
                    <strong class="text-body"> ${usuarioLogueado.nombre} ${usuarioLogueado.apellido}</strong>
                    <br>
                    ${usuarioLogueado.email}
                    <br>
                    Argentino
                    <br>
                    ${usuarioLogueado.provincia.nombre}
                </p>
            </div>
        </div>
        <div>

            <h5 class="card-title">Denuncia Realizada</h5>

            <p class="card-text ">Usuario Solicitante: ${denuncia.usuarioDenunciante.nombre} ${denuncia.usuarioDenunciante.apellido}</p>
            <p class="card-text ">Usuario Asistente: ${denuncia.usuarioDenunciado.nombre} ${denuncia.usuarioDenunciado.apellido}</p>
            <p class="card-text ">Prestación: ${denuncia.prestacion.especialidad.descripcion}</p>
            <p class="card-text ">Motivo: ${denuncia.motivoDenuncia.descripcion}</p>
            <p class="card-text ">Denuncia: ${denuncia.comentario}</p>
        </div>
        <br>

        <div class="row">
            <div class="col-12">
                <div class="container-fluid kanban-container">
                    <div class="row">
                        <div class="col-md-12">
                            <!-- Card -->
                            <div class="card">
                                <div class=" d-flex card-body align-items-center justify-content-center w-100 pt-4  m-0 ">
                                    <!-- Category -->
                                    <div class="kanban-category d-flex ">
                                        <strong><a href="mostrar-denuncias">Regresar a Mis denuncias</a></strong>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>




<footer class="page-footer font-small color-light bg-dark text-light">

    <div>
        <div class="container">

            <div class="col-md-6 col-lg-7 text-center text-md-right">

                <a class="fb-ic" href="https://www.facebook.com"/>
                <i class="fab fa-facebook-f white-text mr-4"> </i>
                </a>

                <a class="tw-ic" href="https://twitter.com"/>
                <i class="fab fa-twitter white-text mr-4"> </i>
                </a>

                <a class="gplus-ic" href="https://www.google.com.ar"/>
                <i class="fab fa-google-plus-g white-text mr-4"> </i>
                </a>

                <a class="li-ic" href="https://www.linkedin.com"/>
                <i class="fab fa-linkedin-in white-text mr-4"  > </i>
                </a>

                <a class="ins-ic"  href="https://www.instagram.com"/>
                <i class="fab fa-instagram white-text"> </i>
                </a>

            </div>


        </div>

    </div>
    </div>


    <div class="container text-center text-md-left mt-5">


        <div class="row mt-3">


            <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">

                <h6 class="text-uppercase font-weight-bold">Acceso directo</h6>
                <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
                <p>
                    <a href="login">Login</a>
                </p>
                <p>
                    <a href="ir-a-registrarme">Registro</a>
                </p>

                <p>
                    <a href="home">Ayuda</a>
                </p>

            </div>

            <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">

                <h6 class="text-uppercase font-weight-bold">Contacto</h6>
                <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
                <p>
                    <i class="fas fa-home mr-3"></i> calle Siempre viva 742, Springfield</p>
                <p>
                    <i class="fas fa-envelope mr-3"></i> info@asegurapp.com</p>
                <p>
                    <i class="fas fa-phone mr-3"></i> +011 4444-4444 </p>

            </div>

        </div>
        <div class="footer-copyright text-center py-3">� 2021 Copyright: AsegurAPP
        </div>
    </div>

</footer>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>

