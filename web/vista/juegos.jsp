<%@page import="modelo.dto.Usuario"%>
<%@ include file="../vista/header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Catalogo de Juegos</title>
        <link href="${pageContext.request.contextPath}/css/juegos.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="css/header.css" rel="stylesheet" type="text/css"/>
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    </head>
    <style>
        /* Paginación */
        .pagination {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
        }

        .pagination a {
            color: #fff;
            padding: 8px 12px;
            text-decoration: none;
            transition: background-color 0.3s;
            border: 1px solid #ddd;
            margin: 0 -1px; /* Eliminar el margen entre los elementos */
            border-radius: 4px 0 0 4px; /* Borde izquierdo redondeado */
        }

        .pagination a:first-child {
            border-radius: 4px 0 0 4px; /* Borde izquierdo redondeado */
        }

        .pagination a:last-child {
            border-radius: 0 4px 4px 0; /* Borde derecho redondeado */
        }

        .pagination a.active {
            background-color: #007bff;
            color: white;
            border: 1px solid #007bff;
        }

        .pagination a:hover:not(.active) {
            background-color: #201E43;
        }

        .pagination a.prev,
        .pagination a.next {
            font-weight: bold;
            border-radius: 4px; /* Borde completo redondeado */
        }

        .pagination a.prev {
            margin-right: 5px; /* Ajustar el margen */
        }

        .pagination a.next {
            margin-left: 5px; /* Ajustar el margen */
        }

    </style>
    <body>

        <div class="main-content">
            <div class="sidebar">
                <ul>
                    <li><a href="index.jsp"><i class="fa-solid fa-house"></i></a></li>
                    <li><a href="<%=request.getContextPath()%>/ControladorJuego"><i class="fa-solid fa-gamepad"></i></a></li>
                    <li><a href="vista/sugerencias.jsp"><i class="fa-regular fa-comment"></i></a></li>
                    <li><a href="vista/libroReclamaciones.jsp"><i class="fa-solid fa-file-circle-exclamation"></i></a></li>
                    <li><a href="vista/FAQ.jsp"><i class="fa-regular fa-circle-question"></i></a></li>
                </ul>
            </div>

            <div class="content-wrapper">
                <div class="filter-container">
                    <label for="categoria" class="filter-label">Filtrar por categoría:</label>
                    <select id="categoria" name="categoria" class="filter-select">
                        <option value="accion">Acción</option>
                        <option value="aventura">Aventura</option>
                        <option value="deporte">Deporte</option>
                        <!-- Añade más categorías según tu base de datos -->
                    </select>
                </div>
                <div id="listaJuegos" class="listaJuegos">
                    <c:forEach var="j" items="${juegos}">
                        <div class="juegos">
                            <div>
                                <a href="${pageContext.request.contextPath}/ControladorJuego?accion=detalle&idJuego=${j.idJuego}">
                                    <picture>
                                        <img src="${pageContext.request.contextPath}/${j.imagenJuego}" alt="${j.nombreJuego}"/>
                                    </picture>
                                </a>
                                <div class="name-game">
                                    <a href="${pageContext.request.contextPath}/ControladorJuego?accion=detalle&idJuego=${j.idJuego}" title="${j.nombreJuego}">
                                        <h5>${j.nombreJuego}</h5>
                                    </a>
                                    <p>Peso: ${j.pesoJuego}</p>
                                    <p>Categoria: ${j.categoria}</p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <div class="pagination">
                    <c:if test="${currentPage > 1}">
                        <a href="${pageContext.request.contextPath}/ControladorJuego?page=${currentPage - 1}" class="prev">&laquo; Anterior</a>
                    </c:if>
                    <c:forEach var="i" begin="1" end="${totalPages}">
                        <a href="${pageContext.request.contextPath}/ControladorJuego?page=${i}" class="${currentPage == i ? 'active' : ''}">${i}</a>
                    </c:forEach>
                    <c:if test="${currentPage < totalPages}">
                        <a href="${pageContext.request.contextPath}/ControladorJuego?page=${currentPage + 1}" class="next">Siguiente &raquo;</a>
                    </c:if>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function () {
                $('#categoria').change(function () {
                    var categoria = $(this).val();
                    $.ajax({
                        url: '<%=request.getContextPath()%>/ControladorJuego',
                        type: 'GET',
                        data: {accion: 'filtrar', categoria: categoria},
                        dataType: 'json',
                        success: function (data) {
                            console.log(data);
                            if (!data || data.length === 0) {
                                alert('No se encontraron juegos para esta categoría.');
                                return;
                            }
                            var listaJuegos = $('#listaJuegos');
                            listaJuegos.empty();
                            data.forEach(item => {
                                listaJuegos.append(`
                                    <div class="juegos">
                                        <div>
                                            <a href="${pageContext.request.contextPath}/ControladorJuego?accion=detalle&idJuego=` + item.idJuego + `">
                                                <picture>
                                                    <img src="${pageContext.request.contextPath}/` + item.imagenJuego + `" alt="` + item.nombreJuego + `"/>
                                                </picture>
                                            </a>
                                            <div class="name-game">
                                                <a href="${pageContext.request.contextPath}/ControladorJuego?accion=detalle&idJuego=` + item.idJuego + `" title="` + item.nombreJuego + `">
                                                    <h5>` + item.nombreJuego + `</h5>
                                                </a>
                                                <p>Peso: ` + item.pesoJuego + `</p>
                                                <p>Categoria: ` + item.categoria + ` </p>
                                            </div>
                                        </div>
                                    </div>
                                `);
                            });
                        },
                        error: function () {
                            alert('Error al filtrar los juegos.');
                        }
                    });
                });
            });
        </script>
    </body>
</html>
