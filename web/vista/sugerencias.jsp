<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="../vista/header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/formsugerencias.css" rel="stylesheet" type="text/css"/>
        <title>Formulario de Sugerencias</title>
    </head>
    <body>
        <div class="main-content">
            <div class="sidebar">
                <ul>
                    <li><a href="<%=request.getContextPath()%>/index.jsp"><i class="fa-solid fa-house"></i></a></li>
                    <li><a href="<%=request.getContextPath()%>/ControladorJuego"><i class="fa-solid fa-gamepad"></i></a></li>
                    <li><a href="<%=request.getContextPath()%>/vista/sugerencias.jsp"><i class="fa-regular fa-comment"></i></a></li>
                    <li><a href="<%=request.getContextPath()%>/vista/libroReclamaciones.jsp"><i class="fa-solid fa-file-circle-exclamation"></i></a></li>
                    <li><a href="<%=request.getContextPath()%>/vista/FAQ.jsp"><i class="fa-regular fa-circle-question"></i></a></li>
                </ul>
            </div>
        </div>
        <div class="form-container">
            <h1>Formulario de Sugerencias</h1>
            <form action="<%=request.getContextPath()%>/ControladorSugerencia" method="post">
                <!------------------ Campos del Usuario ------------------>
                <div class="form-group">
                    <label for="nombre">Nombre</label>
                    <input type="text" id="nombre" name="nombre" required>
                </div>
                <div class="form-group">
                    <label for="correo">Correo Electrónico</label>
                    <input type="email" id="correo" name="correo" required>
                </div>
                <div class="form-group">
                    <label for="telefono">Número de Teléfono</label>
                    <input type="tel" id="telefono" name="telefono">
                </div>

                <!------------------ Detalles de la Sugerencia ------------------>
                <div class="form-group">
                    <label for="categoria">Categoría de la Sugerencia</label>
                    <select id="categoria" name="categoria" required>
                        <option value="usabilidad">Usabilidad del sitio web</option>
                        <option value="catalogo">Catálogo de juegos</option>
                        <option value="precios">Precios y promociones</option>
                        <option value="soporte">Soporte al cliente</option>
                        <option value="metodos_pago">Métodos de pago</option>
                        <option value="otros">Otros</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="asunto">Asunto</label>
                    <input type="text" id="asunto" name="asunto" required>
                </div>
                <div class="form-group">
                    <label for="descripcion">Descripción</label>
                    <textarea id="descripcion" name="descripcion" rows="4" required></textarea>
                </div>

                <!------------------ Campos de Control ------------------>
                <div class="form-group">
                    <label for="privacidad">
                        <input type="checkbox" id="privacidad" name="privacidad" required>
                        He leído y acepto los términos de uso y la política de privacidad.
                    </label>
                </div>

                <button type="submit">Enviar Sugerencia</button>
            </form>
        </div>
    </body>
</html>
