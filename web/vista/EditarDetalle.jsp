<%@ page import="modelo.dto.detalleJuego" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Editar Detalle del Juego</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-image: url('../img/fondoG.jpg');
            background-size: cover;
            background-position: center;
        }
        .container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Editar Detalle del Juego</h2>
        <form action="<%=request.getContextPath()%>/CCrudDetalleJuegos" method="post">
            <input type="hidden" id="detalleJuegoId" name="detalleJuegoId" value="<%= request.getParameter("detalleJuegoId") %>">

            <div class="form-group">
                <label for="idJuego">ID del Juego:</label>
                <input type="number" id="idJuego" name="idJuego" class="form-control" value="<%= request.getParameter("idJuego") %>" required>
            </div>

            <div class="form-group">
                <label for="descripcionJuego">Descripción:</label>
                <input type="text" id="descripcionJuego" name="descripcionJuego" class="form-control" value="<%= request.getParameter("descripcionJuego") %>" required>
            </div>

            <div class="form-group">
                <label for="fechaEstreno">Fecha de Estreno:</label>
                <input type="date" id="fechaEstreno" name="fechaEstreno" class="form-control" value="<%= request.getParameter("fechaEstreno") %>" required>
            </div>

            <div class="form-group">
                <label for="plataforma">Plataforma:</label>
                <input type="text" id="plataforma" name="plataforma" class="form-control" value="<%= request.getParameter("plataforma") %>" required>
            </div>

            <div class="form-group">
                <label for="idiomaTexto">Idioma de Texto:</label>
                <input type="text" id="idiomaTexto" name="idiomaTexto" class="form-control" value="<%= request.getParameter("idiomaTexto") %>" required>
            </div>

            <div class="form-group">
                <label for="idiomaAudio">Idioma de Audio:</label>
                <input type="text" id="idiomaAudio" name="idiomaAudio" class="form-control" value="<%= request.getParameter("idiomaAudio") %>" required>
            </div>

            <button type="submit" name="accion" value="editar" class="btn btn-primary">Guardar Cambios</button>

        </form>
    </div>
</body>
</html>
