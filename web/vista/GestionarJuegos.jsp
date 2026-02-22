<%@page import="modelo.dto.detalleJuego"%>
<%@page import="modelo.dao.DetalleDao"%>
<%@page import="modelo.dao.TablaJuegosDao"%>
<%@page import="modelo.dto.juego"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>GameNest</title>
        <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
        <link href="${pageContext.request.contextPath}/css/lightbox/lightbox.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.css">
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>
        <link href="../css/gestionarjuegos.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>

        <button class="btn btn-success mx-3 mt-3" data-bs-toggle="offcanvas" data-bs-target="#intro">Administrar</button>
        <div class="offcanvas offcanvas-start" id="intro">
            <div class="offcanvas-header">
                <div class="offcanvas-title">
                    <button class="btn btn-danger" data-bs-dismiss="offcanvas">Cerrar</button>
                </div>
            </div>

            <div class="offcanvas-body">
                <p><a href="${pageContext.request.contextPath}/vista/indexAdministrador.jsp"><i class="fa-solid fa-house"></i> Inicio</a></p>
                <p><a href="<%=request.getContextPath()%>/ControladorDataTable"> Reclamaciones Pendientes</a></p>
                <p><a href="<%=request.getContextPath()%>/vista/GestionarJuegos.jsp"> Agregar Juegos</a></p>
            </div>
        </div>
        <div class="container-row">

            <div class="container">
                <h4>Tabla de Juegos</h4>
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#AddJuego">
                    Agregar juego +
                </button>
                <table id="table_id" class="display table table-bordered" style="width:100%">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Imagen</th>
                            <th>Peso</th>
                            <th>Precio</th>
                            <th>Categoría</th>
                            <th>Operaciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            TablaJuegosDao juegosDao = new TablaJuegosDao();
                            List<juego> juegos = juegosDao.listar();
                            int i = 1;
                            for (juego j : juegos) {
                            i = i + 1;
                        %>
                        <tr>
                            <td><%= j.getIdJuego()%></td>
                            <td><%= j.getNombreJuego()%></td>
                            <td><a href="${pageContext.request.contextPath}/<%= j.getImagenJuego()%>" data-lightbox="image-<%= i %>"><img src="${pageContext.request.contextPath}/<%= j.getImagenJuego()%>" alt="Imagen del juego" style="width: 100px; height: auto;"/></a></td>
                            <td><%= j.getPesoJuego()%></td>
                            <td><%= j.getPrecio()%></td>
                            <td><%= j.getCategoria()%></td>
                            <td>
                                <form action="editarJuego.jsp" method="get" style="display:inline;">
                                    <input type="hidden" name="id" value="<%= j.getIdJuego()%>">
                                    <input type="hidden" name="nombre" value="<%= j.getNombreJuego()%>">
                                    <input type="hidden" name="imagen" value="<%= j.getImagenJuego()%>">
                                    <input type="hidden" name="peso" value="<%= j.getPesoJuego()%>">
                                    <input type="hidden" name="precio" value="<%= j.getPrecio()%>">
                                    <input type="hidden" name="categoria" value="<%= j.getCategoria()%>">
                                    <button type="submit" class="btn btn-warning btn-sm">Editar</button>
                                </form>
                                <form action="<%=request.getContextPath()%>/ControladorCrudDataJuegos" method="post" style="display:inline;">
                                    <input type="hidden" name="id" value="<%= j.getIdJuego()%>">
                                    <input type="hidden" name="accion" value="eliminar">
                                    <button type="submit" class="btn btn-danger btn-sm">Eliminar</button>
                                </form>
                            </td>
                        </tr>
                        <%
                            i++;
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="modal fade" id="AddJuego" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="ContenedorAgregarJuego">
                            <h4>Agregar Nuevo Juego</h4>
                            <form action="<%=request.getContextPath()%>/ControladorCrudDataJuegos" method="post" enctype="multipart/form-data">
                                <label for="nombre">Nombre del Juego:</label>
                                <input type="text" id="nombre" name="nombre" required><br>

                                <label for="imagen">Imagen:</label>
                                <input type="file" id="imagen" name="imagen" required><br>

                                <label for="peso">Peso del Juego:</label>
                                <input type="text" id="peso" name="peso" required><br>

                                <label for="precio">Precio:</label>
                                <input type="text" id="precio" name="precio" required><br>

                                <label for="categoria">Categoría:</label>
                                <select id="categoria" name="categoria" required>
                                    <option value="accion">Acción</option>
                                    <option value="aventura">Aventura</option>
                                    <option value="estrategia">Estrategia</option>
                                    <option value="Mundo Abierto">Mundo Abierto</option>
                                    <option value="Lucha">Lucha</option>
                                    <option value="Simulacion">Simulacion</option>
                                    <option value="Puzles">Puzles</option>
                                    <option value="Terror">Terror</option>
                                    <option value="Estrategia">Estrategia</option>
                                    <option value="Carreras">Carreras</option>
                                    <option value="Deporte">Deporte</option>
                                </select><br>

                                <button type="submit" name="accion" value="agregar">Agregar Juego</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container-row">
            <div class="container">
                <h4>Tabla Detalles del Juego</h4>
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#AddDetalle">
                    Agregar Detalles +
                </button>
                <table id="table_detalle_id" class="display table table-bordered" style="width:100%">
                    <thead>
                        <tr>
                            <th>Detalle ID</th>
                            <th>ID Juego</th>
                            <th>Descripción</th>
                            <th>Fecha de Estreno</th>
                            <th>Plataforma</th>
                            <th>Idioma Texto</th>
                            <th>Idioma Audio</th>
                            <th>Operaciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            // Instanciar el DAO para obtener los datos
                            DetalleDao detalleDao = new DetalleDao();
                            List<detalleJuego> detalles = detalleDao.listar();
                            for (detalleJuego d : detalles) {
                        %>
                        <tr>
                            <td><%= d.getDetalleJuegoId()%></td>
                            <td><%= d.getIdJuego()%></td>
                            <td><%= d.getDescripcionJuego()%></td>
                            <td><%= d.getFechaEsterno()%></td>
                            <td><%= d.getPlataforma()%></td>
                            <td><%= d.getIdiomaTexto()%></td>
                            <td><%= d.getIdiomaAudio()%></td>
                            <td>
                                <form action="EditarDetalle.jsp" method="get" style="display:inline;">
                                    <input type="hidden" name="detalleId" value="<%= d.getDetalleJuegoId()%>">
                                    <input type="hidden" name="idJuego" value="<%= d.getIdJuego()%>">
                                    <input type="hidden" name="descripcionJuego" value="<%= d.getDescripcionJuego()%>">
                                    <input type="hidden" name="fechaEstreno" value="<%= d.getFechaEsterno()%>">
                                    <input type="hidden" name="plataforma" value="<%= d.getPlataforma()%>">
                                    <input type="hidden" name="idiomaTexto" value="<%= d.getIdiomaTexto()%>">
                                    <input type="hidden" name="idiomaAudio" value="<%= d.getIdiomaAudio()%>">
                                    <button type="submit" class="btn btn-warning btn-sm">Editar</button>
                                </form>
                                <form action="<%=request.getContextPath()%>/CCrudDetalleJuegos" method="post" style="display:inline;">
                                    <input type="hidden" name="detalleId" value="<%= d.getDetalleJuegoId()%>">
                                    <input type="hidden" name="accion" value="eliminar">
                                    <button type="submit" class="btn btn-danger btn-sm">Eliminar</button>
                                </form>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="modal fade" id="AddDetalle" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="staticBackdropLabel">Modal title</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="ContenedorAgregarJuego">
                            <h4>Agregar Detalle del Juego</h4>
                            <form action="<%=request.getContextPath()%>/CCrudDetalleJuegos" method="post">
                                <input type="hidden" name="accion" value="agregar">

                                <label for="idJuego">ID del Juego:</label>
                                <input type="text" id="idJuego" name="idJuego" required>

                                <label for="descripcion">Descripción:</label>
                                <input type="text" id="descripcion" name="descripcion" required>

                                <label for="fechaEstreno">Fecha de Estreno:</label>
                                <input type="date" id="fechaEstreno" name="fechaEstreno" required>

                                <label for="plataforma">Plataforma:</label>
                                <input type="text" id="plataforma" name="plataforma" required>

                                <label for="idiomaTexto">Idioma del Texto:</label>
                                <input type="text" id="idiomaTexto" name="idiomaTexto" required>

                                <label for="idiomaAudio">Idioma del Audio:</label>
                                <input type="text" id="idiomaAudio" name="idiomaAudio" required>

                                <button type="submit">Agregar Detalle</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            $(document).ready(function () {
                $('#table_id').DataTable();
                $('#table_detalle_id').DataTable();
            });
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/js/lightbox/lightbox.js"></script>
    </body>
</html>
