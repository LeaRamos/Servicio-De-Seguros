<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="command" class="ar.edu.unlam.tallerweb1.modelo.Suscripcion" scope="request"></jsp:useBean>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link href="css/Login.css" rel="stylesheet">
    <title>Suscripción</title>
</head>
<body class="">
<header>
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
                        <a class="nav-link" href="perfilUsuario">Perfil</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link active" href="suscripcion">Suscripción</a>
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
</header>
<div class=" h-100 w-100">
    <div class="fondo-login container-fluid px-2 h-100 w-100 d-flex justify-content-center">
        <div class="row p-0  container-xl m-0 mt-5 h-75 align-content-around justify-content-around">

            <c:forEach items="${listaSuscripcion}" var="suscripcion" varStatus="status">
                <div class="col-12 col-md-3 p-5 pb-0 p-md-1 bg-white rounded-3 mx-1">
                    <h2 class="text-center mb-lg-5 mb-5">
                            ${suscripcion.descripcion}
                    </h2>

                    <div class="mb-5 mt-5 text-center">
                        <c:if test="${status.first}">
                            <i class="fas fa-shield-alt fa-8x"></i>
                        </c:if>
                        <c:if test="${status.last}">
                            <i class="fas fa-khanda fa-8x"></i>
                        </c:if>
                    </div>

                    <div class="mb-3 mt-5">
                        <h4 style="text-align: center">
                            Servicios disponibles
                        </h4>
                        <div class="fs-3">
                            <c:if test="${status.first}">
                                <i class="fas fa-wrench mr-4"></i>
                                <i class="fas fa-ambulance mr-4"></i>
                                <i class="fas fa-truck-pickup mr-4"></i>

                            </c:if>
                            <c:if test="${status.last}">
                                <i class="fas fa-wrench mr-4"></i>
                                <i class="fas fa-ambulance mr-4"></i>
                                <i class="fas fa-truck-pickup mr-4"></i>
                                <i class="fas fa-wrench mr-4"></i>
                                <i class="fas fa-ambulance mr-4"></i>
                                <i class="fas fa-truck-pickup mr-4"></i>
                            </c:if>
                        </div>
                    </div>
                    <h4 class="mb-3 mt-5" style="text-align: center">
                        Precio : $${suscripcion.precio}/mes
                    </h4>
                    <div class="mt-5">
                        <c:if test="${status.first}">
                            <button type="button" class="fondo-login rounded-3 btn btn-primary border-0 w-100 shadow-sm mt-0" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                                Suscribirme
                            </button>
                        </c:if>
                        <c:if test="${status.last}">
                            <button type="submit" class="fondo-login rounded-3 btn btn-primary border-0 w-100 shadow-sm mt-0" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                Suscribirme
                            </button>
                        </c:if>
                    </div>


                    <!-- Modal 1-->
                    <c:if test="${status.first}">
                        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false"
                             tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="staticBackdropLabel">${suscripcion.descripcion}</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="mb-5 mt-5 text-center">
                                             Por $100 mensuales estas por  contratar nuestra suscripción Basica que incluye:
                                            <br>
                                            <p>Servicio de Grúa</p>
                                            <p>Servicio Médico</p>
                                            <p>Servicio Policial</p>

                                            <small>Si preferis contar con todos nuestros servicios, podes optar por nuestra Suscripcíón Premium.</small>

                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar
                                        </button>
                                        <a href="irAFactura/${suscripcion.id}" class="btn btn-primary">Contratar Suscripcion basica</a>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </c:if>

                    <!-- Modal 2-->
                    <c:if test="${status.last}">
                        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title"
                                            id="exampleModalLabel">${suscripcion.descripcion}</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="mb-5 mt-5 text-center">
                                            <div class="mb-5 mt-5 text-center">
                                                Por $300 mensuales estas por  contratar nuestra suscripción Premium que incluye:
                                                <br>
                                                <p>Servicio de Grúa</p>
                                                <p>Servicio Médico</p>
                                                <p>Servicio Policial</p>
                                                <p>Servicio Mecánico</p>
                                                <p>Chofer</p>
                                                <p>Repuestos Livianos</p>
                                                <p>Asistencia Legal</p>
                                            </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                            Cancelar
                                        </button>
                                        <a href="irAFactura/${suscripcion.id}" class="btn btn-primary">Contratar Suscripcion Premium</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </div>
                    </c:if>

                </div>
            </c:forEach>

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


<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"
        integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU"
        crossorigin="anonymous">
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js"
        integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj"
        crossorigin="anonymous">
</script>
<script src="js/bootstrap.min.js"
        integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU"
        crossorigin="anonymous">
</script>
<script src="js/popper.min.js"
        integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj"
        crossorigin="anonymous"></script>

</body>

</html>
