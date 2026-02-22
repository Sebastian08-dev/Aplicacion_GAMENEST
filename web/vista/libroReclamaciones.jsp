<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/libroRec.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@ include file="../vista/header.jsp" %>

        <%
            // Obtener el usuario de la sesión
            String nombre = "";
            String correo = "";
            boolean usuarioAutenticado = false;
            if (usuario != null) {
                nombre = usuario.getNombres();
                correo = usuario.getEmail();
                usuarioAutenticado = true;
            }
        %>

        <div>
            <div class="form-container">
                <h1>Formulario de Reclamaciones</h1>
                <form action="<%=request.getContextPath()%>/ControladorGuardarRec" method="post" enctype="multipart/form-data">
                    <!------------------ Campos del formulario ------------------>
                    <div class="form-group">
                        <label for="nombre">Nombre</label>
                        <input type="text" id="nombre" name="nombre" value="<%=nombre%>" <% if (usuarioAutenticado) { %>readonly<% }%> required>
                    </div>
                    <div class="form-group">
                        <label for="apellidos">Apellidos</label>
                        <input type="text" id="apellidos" name="apellidos" required>
                    </div>
                    <div class="form-group">
                        <label for="correo">Correo</label>
                        <input type="email" id="correo" name="correo" value="<%=correo%>" <% if (usuarioAutenticado) { %>readonly<% }%> required>
                    </div>
                    <div class="form-group">
                        <label for="telefono">Teléfono</label>
                        <input type="tel" id="telefono" name="telefono" required>
                    </div>
                    <div class="form-group">
                        <label for="producto">Producto</label>
                        <input type="text" id="producto" name="producto" required>
                    </div>
                    <div class="form-group">
                        <label for="monto_reclamado">Monto reclamado</label>
                        <input type="number" id="monto_reclamado" name="monto_reclamado" required>
                    </div>
                    <div class="form-group">
                        <label for="descripcion_problema">Descripción del problema</label>
                        <textarea id="descripcion_problema" name="descripcion_problema" rows="4" required></textarea>
                    </div>
                    <div class="form-group">
                        <label for="evidencia">Evidencia</label>
                        <input type="file" id="evidencia" name="evidencia" accept="image/*">
                    </div>
                    <button type="submit">Enviar Reclamación</button>
                </form>
                <p class="info">
                    <strong>Normativa Local:</strong> Se va revisar que cumpla con todas las normativas y leyes locales pertinentes sobre derechos del consumidor y la gestión de reclamaciones.<br>
                    <strong>Plazo de Respuesta:</strong> Su reclamo pasará en estado de revisión y se le comunicará en un plazo máximo de 2 días para responder a las reclamaciones.
                </p>
            </div>
        </div>
    </body>
</html>

