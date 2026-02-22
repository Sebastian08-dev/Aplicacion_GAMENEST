<%@ page import="modelo.dto.juego" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Editar Juego</title>
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
        <h2>Editar Juego</h2>
        <form action="<%=request.getContextPath()%>/ControladorCrudDataJuegos" method="post">
            <input type="hidden" id="id" name="id" value="<%= request.getParameter("id") %>">

            <div class="form-group">
                <label for="nombre">Nombre del Juego:</label>
                <input type="text" id="nombre" name="nombre" class="form-control" value="<%= request.getParameter("nombre") %>" required>
            </div>

            <div class="form-group">
                <label for="imagen">URL de la Imagen:</label>
                <input type="text" id="imagen" name="imagen" class="form-control" value="<%= request.getParameter("imagen") %>" required>
            </div>

            <div class="form-group">
                <label for="peso">Peso del Juego:</label>
                <input type="text" id="peso" name="peso" class="form-control" value="<%= request.getParameter("peso") %>" required>
            </div>

            <div class="form-group">
                <label for="precio">Precio:</label>
                <input type="text" id="precio" name="precio" class="form-control" value="<%= request.getParameter("precio") %>" required>
            </div>

            <div class="form-group">
                <label for="categoria">Categoría:</label>
                <select id="categoria" name="categoria" class="form-control" required>
                    <option value="accion" <%= "accion".equals(request.getParameter("categoria")) ? "selected" : "" %>>Acción</option>
                    <option value="aventura" <%= "aventura".equals(request.getParameter("categoria")) ? "selected" : "" %>>Aventura</option>
                    <option value="estrategia" <%= "estrategia".equals(request.getParameter("categoria")) ? "selected" : "" %>>Estrategia</option>
                    <option value="Mundo Abierto" <%= "Mundo Abierto".equals(request.getParameter("categoria")) ? "selected" : "" %>>Mundo Abierto</option>
                    <option value="Lucha" <%= "Lucha".equals(request.getParameter("categoria")) ? "selected" : "" %>>Lucha</option>
                    <option value="Simulacion" <%= "Simulacion".equals(request.getParameter("categoria")) ? "selected" : "" %>>Simulacion</option>
                    <option value="Puzles" <%= "Puzles".equals(request.getParameter("categoria")) ? "selected" : "" %>>Puzles</option>
                    <option value="Terror" <%= "Terror".equals(request.getParameter("categoria")) ? "selected" : "" %>>Terror</option>
                    <option value="Estrategia" <%= "Estrategia".equals(request.getParameter("categoria")) ? "selected" : "" %>>Estrategia</option>
                    <option value="Carreras" <%= "Carreras".equals(request.getParameter("categoria")) ? "selected" : "" %>>Carreras</option>
                    <option value="Deporte" <%= "Deporte".equals(request.getParameter("categoria")) ? "selected" : "" %>>Deporte</option>
                </select>
            </div>

            <button type="submit" name="accion" value="editar" class="btn btn-primary">Guardar Cambios</button>
        </form>
    </div>
</body>
</html>