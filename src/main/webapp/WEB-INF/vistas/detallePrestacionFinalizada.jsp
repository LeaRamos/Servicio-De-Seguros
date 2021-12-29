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
    <title>Document</title>
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
                    <a class="nav-link" href="suscripcion">Suscripción</a>
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

                <!-- Title -->
                <h2 class="mb-2">
                    Servicio de ${prestacion.usuarioAsistente.especialidad.descripcion}
                </h2>

                <!-- Text -->
                <p class="text-muted mb-6">
                    N° Factura: ${prestacion.id}
                </p>

            </div>
        </div> <!-- / .row -->

        <div class="row">
            <div class="col-12 col-md-6">

                <!-- Heading -->
                <h6 class="text-uppercase text-muted">
                    Usuario Solicitante<span class="badge bg-danger-soft">Danger</span>
                </h6>

                <!-- Text -->
                <p class="text-muted mb-4">
                    <strong class="text-body"> ${prestacion.usuarioSolicitante.nombre} ${prestacion.usuarioSolicitante.apellido}</strong>
                    <br>
                    ${prestacion.usuarioSolicitante.email} <br>
                    Argentino <br>
                    ${prestacion.usuarioSolicitante.provincia.nombre}
                </p>
            </div>
            <div class="col-12 col-md-6 text-md-end">

                <!-- Heading -->
                <h6 class="text-uppercase text-muted">
                    Usuario Asistente
                </h6>

                <!-- Text -->
                <p class="text-muted mb-4">
                    <strong class="text-body">${prestacion.usuarioAsistente.nombre} ${prestacion.usuarioAsistente.apellido}</strong>
                    <br>
                    ${prestacion.usuarioAsistente.email}<br>
                    Argentino <br>
                    ${prestacion.usuarioAsistente.provincia.nombre}
                </p>

            </div>
        </div> <!-- / .row -->

        <div class="row">
            <div class="col-12">

                <!-- Table -->
                <div class="table-responsive">
                    <table class="table my-4">
                        <thead>
                        <tr>
                            <th class="px-0 bg-transparent border-top-0">
                                <span class="h6">Descripción</span>
                            </th>
                            <th class="px-0 bg-transparent border-top-0">
                                <span class="h6">Horas</span>
                            </th>
                            <th class="px-0 bg-transparent border-top-0 text-end">
                                <span class="h6">Costo</span>
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td class="px-0">
                                Servicios prestados
                            </td>
                            <td class="px-0">
                                125
                            </td>
                            <td class="px-0 text-end">
                                $6,250
                            </td>
                        </tr>
                        <tr>
                            <td class="px-0">
                                Gastos administrativos
                            </td>
                            <td class="px-0">
                                15
                            </td>
                            <td class="px-0 text-end">
                                $750
                            </td>
                        </tr>
                        <tr>
                            <td class="px-0 border-top border-top-2">
                                <strong>Total </strong>
                            </td>
                            <td colspan="2" class="px-0 text-end border-top border-top-2">
                                    <span class="h3">
                                        $7,000
                                    </span>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <hr class="my-3">


                <!-- Title -->
                <h2 class="text-uppercase">
                   ¿Deseas hacer algo ?
                </h2>

                <!-- Text -->
                <div class="container-fluid kanban-container">
                    <div class="row">
                        <div class="col-md-6">
                            <!-- Card -->
                            <div class="card">
                                <div class=" d-flex card-body align-items-center justify-content-center w-100 pt-4  m-0 ">
                                    <!-- Category -->
                                    <div class="kanban-category d-flex ">
                                        <c:if test="${prestacion.estado=='finalizado'}">

                                            <!-- Item -->
                                            <div class="kanban-item"><h4 class="text-uppercase">Califica el
                                                Servicio</h4>
                                                    <%--@elvariable id="prestacion" type="ar.edu.unlam.tallerweb1.modelo.Prestacion"--%>
                                                <form:form action="clienteCalifica" method="post" modelAttribute="prestacion">

                                                    <p class="clasificacion">
                                                        <form:radiobutton path="calificacionDadaPorElCliente" id="radio1"  value="5"/>
                                                         <label class="labelFormCalificar" for="radio1">★</label>

                                             <form:radiobutton path="calificacionDadaPorElCliente" id="radio2"
                                                               name="estrellas" value="4"/>
                                                        <label class="labelFormCalificar" for="radio2">★</label>

                                                        <form:radiobutton path="calificacionDadaPorElCliente" id="radio3"
                                                                     name="estrellas" value="3"/>
                                                        <label class="labelFormCalificar" for="radio3">★</label>

                                                        <form:radiobutton path="calificacionDadaPorElCliente" id="radio4"
                                                                   name="estrellas" value="2"/>
                                                        <label class="labelFormCalificar" for="radio4">★</label>


                                               <form:radiobutton  path="calificacionDadaPorElCliente" id="radio5"
                                                                 name="estrellas" value="1"/>
                                              <label class="labelFormCalificar" for="radio5">★</label>
                                                    </p>

                                                    <form:hidden path="id" id="id" value="${prestacion.id}"/>

                                                    <button type="submit" class="btn btn-primary">Calificar Prestacion
                                                    </button>
                                                </form:form>
                                            </div>
                                        </c:if>

                                        <c:if test="${prestacion.estado=='activo'}">
                                        <div class="mr-4">
                                                <%--@elvariable id="prestacion" type="ar.edu.unlam.tallerweb1.modelo.Prestacion"--%>
                                            <form:form action="finalizarPrestacion" method="post" modelAttribute="prestacion">
                                            <form:hidden  path="id" id="id" value="${prestacion.id}"/>
                                            <form:hidden  path="estado" id="estado" value="${prestacion.estado}"/>
                                            <button type="submit" class="btn btn-primary">Finalizar Prestacion</button>
                                            </form:form>
                                        </div>

                                            <div class="mr-1">
                                                    <%--@elvariable id="prestacion" type="ar.edu.unlam.tallerweb1.modelo.Prestacion"--%>
                                                <form:form action="clienteCancelaPrestacion" method="post" modelAttribute="prestacion">
                                                    <form:hidden  path="id" id="id" value="${prestacion.id}"/>
                                                    <button type="submit" class="btn btn-danger ">Cancelar Prestacion</button>
                                                </form:form>
                                            </div>

                                        </c:if>

                                        <c:if test="${prestacion.estado=='cancelado'}">
                                            <!-- Item -->
                                            <div class="kanban-item"><h4 class="text-uppercase">Califica el
                                                Servicio</h4>
                                                    <%--@elvariable id="prestacion" type="ar.edu.unlam.tallerweb1.modelo.Prestacion"--%>
                                                <form:form action="clienteCalifica" method="post" modelAttribute="prestacion">

                                                    <p class="clasificacion">
                                                        <form:radiobutton path="calificacionDadaPorElCliente" id="radio1"  value="5"/>
                                                        <label class="labelFormCalificar" for="radio1">★</label>

                                                        <form:radiobutton path="calificacionDadaPorElCliente" id="radio2"
                                                                          name="estrellas" value="4"/>
                                                        <label class="labelFormCalificar" for="radio2">★</label>

                                                        <form:radiobutton path="calificacionDadaPorElCliente" id="radio3"
                                                                          name="estrellas" value="3"/>
                                                        <label class="labelFormCalificar" for="radio3">★</label>

                                                        <form:radiobutton path="calificacionDadaPorElCliente" id="radio4"
                                                                          name="estrellas" value="2"/>
                                                        <label class="labelFormCalificar" for="radio4">★</label>


                                                        <form:radiobutton  path="calificacionDadaPorElCliente" id="radio5"
                                                                           name="estrellas" value="1"/>
                                                        <label class="labelFormCalificar" for="radio5">★</label>
                                                    </p>

                                                    <form:hidden path="id" id="id" value="${prestacion.id}"/>

                                                    <button type="submit" class="btn btn-primary">Calificar Prestacion
                                                    </button>
                                                </form:form>
                                            </div>
                                        </c:if>
                                    </div>


                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">

                            <!-- Card -->
                            <div class="card">
                                <div class="card-body">

                                    <!-- Category -->
                                    <div class="kanban-category">

                                        <!-- Item -->
                                        <div class="kanban-item">...</div>

                                    </div>

                                </div>
                            </div>

                        </div>
                    </div> <!-- / .row -->
                </div>

            </div>
        </div> <!-- / .row -->
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
