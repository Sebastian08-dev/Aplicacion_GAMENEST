<%@page import="modelo.dto.Usuario"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>GameNest</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" 
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="../css/header.css" rel="stylesheet" type="text/css"/>
    <link href="../css/login.css" rel="stylesheet" type="text/css"/>
    <link href="../css/carrusel.css" rel="stylesheet" type="text/css"/>

    <header class="main-header">
        <i class="fa-solid fa-dragon"></i>
        <div class="search-bar">
            <input type="text" placeholder="Buscar...">
            <button type="button">
                <i class="fa-solid fa-search"></i>
            </button>
        </div>
        <div class="container">
            <%
                Usuario usuario = (Usuario) session.getAttribute("usuario");
                if (usuario != null && usuario.getRol().equals("administrador")) {
                    out.print("Hola " + usuario.getNombres() + ", bienvenido como administrador.");
            %>
            <a href="${pageContext.request.contextPath}/ControladorLogin?accion=cerrar"><i class="fa-solid fa-right-to-bracket cerrar"></i></a>
                <% } else { %>
            <a href="${pageContext.request.contextPath}/vista/login.jsp"><i class="fa-solid fa-user usuario"></i></a>
                <% }%>
        </div>






    </header>
    <body>
        <!--
        <div class="container mt-2">
            <div class="row">
        <c:forEach var="p" items="${productos}">
            <div class="col-sm-4">
                <div class="card">
                    <div class="card-header">
                        <label>${p.getNombres()}</label>
                    </div>                            
                    <div class="card-body">
                        <i>$56.00</i>
                        <img src="" width="200" height="180"/>
                    </div>
                    <div class="card-footer text-center">
                        <label>DESCRIPCION</label>
                        <div>
                            <a href="" class="btn btn-outline-info">Agredar a Carrito</a>
                            <a href="" class="btn btn-danger">Comprar</a>
                        </div>
                    </div>
                </div>
            </div>  
        </c:forEach>
    </div> 
</div>
        -->

        <!-- Carrusel de imagenes -->

        <div class="carrusel-body">
            <!---------------------------------------- BARRA LATERAL ---------------------------------------->                  
            <div class='sidebar'>   
                <div class='top'> <!-- ICONO MENU -->
                    <i class="fa-solid fa-bars" id='btn'></i>
                </div>     
                <ul>
                    <li>
                        <a href='../vista/indexAdministrador.jsp'>
                            <i class="fa-solid fa-house"></i>
                            
                        </a>

                    </li>
                    <li>
                        <a href="<%=request.getContextPath()%>/ControladorJuego">
                            <i class="fa-solid fa-gamepad"></i>
                            
                        </a>                   

                    </li>
                    <li>
                        <a href="<%=request.getContextPath()%>/ControladorDataTable">
                            <i class="fa-solid fa-file-circle-exclamation"></i>
                            
                        </a>
                    </li>
                    <li>
                      <a href="../vista/FAQ.jsp">
                            <i class="fa-regular fa-circle-question"></i>
                            
                        </a>                    
                    </li>
                    <li>
                        <a href="../vista/GestionarJuegos.jsp">
                            <i class="fa-solid fa-gamepad"></i>
                            
                        </a>
                    </li>

                </ul>
            </div>         
    <script><!-- NO CAMBIAR -->
                let btn = document.querySelector('#btn');
                let sidebar = document.querySelector('.sidebar');

                btn.onclick = function () {
                    sidebar.classList.toggle('active');
                };
                </script>
                <!------------------------------------------------------------------------------------------------->   
                <div class="carrusel">
                    <h4>Ultimas Publicaciones</h4>
                    <div class="carrusel-lista" id="carrusel-lista">
                        <button class="carrusel-arrow carrusel-prev" id="button-prev" data-button="button-prev"
                                onclick="app.processingButton(event)">
                            <svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="chevron-left"
                                 class="svg-inline--fa fa-chevron-left fa-w-10" role="img" xmlns="http://www.w3.org/2000/svg"
                                 viewBox="0 0 320 512">
                            <path fill="currentColor"
                                  d="M34.52 239.03L228.87 44.69c9.37-9.37 24.57-9.37 33.94 0l22.67 22.67c9.36 9.36 9.37 24.52.04 33.9L131.49 256l154.02 154.75c9.34 9.38 9.32 24.54-.04 33.9l-22.67 22.67c-9.37 9.37-24.57 9.37-33.94 0L34.52 272.97c-9.37-9.37-9.37-24.57 0-33.94z">
                            </path>
                            </svg>
                        </button>

                        <div class="carrusel-track" id="track">
                            <div class="carousel" id="carousel">
                                <div>
                                    <a href="/">
                                        <h4> <small>Estreno</small></h4>
                                        <picture>
                                            <img src="../img/1.jpg" alt="imagen"/>
                                        </picture>
                                    </a>
                                    <div class="name-game">
                                        <a href="/" title="Horizon Forbidden West Complete Edition">
                                            <h5>Horizon Forbidden West Complete Edition</h5>
                                        </a>
                                        <p>Tamaño: 98,9 GB</p>
                                        <p>Categoria: Aventura</p>
                                    </div>
                                </div>
                            </div>

                            <div class="carousel">

                                <div>
                                    <a href="/">
                                        <h4> <small>Estreno</small></h4>
                                        <picture>
                                            <img src="../img/2.jpg" alt="imagen"/>
                                        </picture>
                                        <div class="name-game">
                                            <a href="/" title="Inmortals of Aveum Deluxe Edition">
                                                <h5>Inmortals of Aveum Deluxe Edition</h5>
                                            </a>
                                            <p>Tamaño: 55,3 GB</p>
                                            <p>Categoria: Accion</p>
                                        </div>

                                    </a>
                                </div>
                            </div>

                            <div class="carousel">

                                <div>
                                    <a href="/">
                                        <h4> <small>Estreno</small></h4>
                                        <picture>
                                            <img src="../img/3.jpg" alt="imagen"/>
                                        </picture>
                                        <div class="name-game">
                                            <a href="/" title="MotorGP 24">
                                                <h5>MotorGP 24</h5>
                                            </a>
                                            <p>Tamaño: 13,2 GB</p>
                                            <p>Categoria: Carrera</p>
                                        </div>
                                    </a>
                                </div>
                            </div>

                            <div class="carousel">

                                <div>
                                    <a href="/">
                                        <h4> <small>Estreno</small></h4>
                                        <picture>
                                            <img src="../img/4.jpg" alt="imagen"/>
                                        </picture>
                                        <div class="name-game">
                                            <a href="/" title="Tekken 8 Ultimate Edition">
                                                <h5>Tekken 8 Ultimate Edition</h5>
                                            </a>
                                            <p>Tamaño: 76,8 GB</p>
                                            <p>Categoria: Lucha</p>
                                        </div>
                                    </a>
                                </div>
                            </div>

                            <div class="carousel">

                                <div>
                                    <a href="/">
                                        <h4> <small>Estreno</small></h4>
                                        <picture>
                                            <img src="../img/5.jpg" alt="imagen"/>
                                        </picture>
                                        <div class="name-game">
                                            <a href="/" title="Call Of Duty Black Ops Cold War">
                                                <h5>Call Of Duty Black Ops Cold War</h5>
                                            </a>
                                            <p>Tamaño: 80,6 GB</p>
                                            <p>Categoria: Accion</p>
                                        </div>
                                    </a>
                                </div>
                            </div>

                            <div class="carousel">

                                <div>
                                    <a href="/">
                                        <h4> <small>Estreno</small></h4>
                                        <picture>
                                            <img src="../img/6.jpg" alt="imagen"/>
                                        </picture>
                                        <div class="name-game">
                                            <a href="/" title="Grand theft Auto V">
                                                <h5>Grand Theft Auto V</h5>
                                            </a>
                                            <p>Tamaño: 60,9 GB</p>
                                            <p>Categoria: Accion</p>
                                        </div>
                                    </a>
                                </div>
                            </div>

                            <div class="carousel">

                                <div>
                                    <a href="/">
                                        <h4> <small>Estreno</small></h4>
                                        <picture>
                                            <img src="../img/7.jpg" alt="imagen"/>
                                        </picture>
                                        <div class="name-game">
                                            <a href="/" title="Red Dead Redemption 2">
                                                <h5>Red Dead Redemption 2</h5>
                                            </a>
                                            <p>Tamaño: 103 GB</p>
                                            <p>Categoria: Aventura</p>
                                        </div>
                                    </a>
                                </div>
                            </div>


                        </div>
                        <button class="carrusel-arrow carrusel-next" id="button-next" data-button="button-next"
                                onclick="app.processingButton(event)">
                            <svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="chevron-right"
                                 class="svg-inline--fa fa-chevron-right fa-w-10" role="img" xmlns="http://www.w3.org/2000/svg"
                                 viewBox="0 0 320 512">
                            <path fill="currentColor"
                                  d="M285.476 272.971L91.132 467.314c-9.373 9.373-24.569 9.373-33.941 0l-22.667-22.667c-9.357-9.357-9.375-24.522-.04-33.901L188.505 256 34.484 101.255c-9.335-9.379-9.317-24.544.04-33.901l22.667-22.667c9.373-9.373 24.569-9.373 33.941 0L285.475 239.03c9.373 9.372 9.373 24.568.001 33.941z">
                            </path>
                            </svg>
                        </button>

                    </div>

                </div>
            </div>



            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
            <script src="js/carrusel.js" type="text/javascript"></script>
        </body>

    </html>

