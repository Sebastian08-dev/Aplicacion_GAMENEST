<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <link href="../css/login.css" rel="stylesheet" type="text/css"/>
        <link href="<%=request.getContextPath()%>/css/login.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="successful-mesage">
                <%
                    String registroExito = request.getParameter("registro");
                    if ("exito".equals(registroExito)) {
                %>  
                <div class="alert alert-dismissible alert-success">
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    <strong>¡Listo!</strong> Se ha registrado correctamente.
                </div>
                <%
                    }
                %>
            </div>
        <main class="CC">
            <div class="C1">
                <form action="<%=request.getContextPath()%>/ControladorLogin" method="post">
                    <h1>Iniciar sesión</h1>
                    <%-- Mostrar mensaje de error si está presente --%>
                    <c:if test="${not empty mensajeError}">
                        <div class="C3-error">
                            <p>${mensajeError}</p>
                        </div>
                    </c:if>
                    <div class="C2-usuario">
                        <input type="email" placeholder="Correo electrónico" name="Email" required>
                        <i class='bx bxs-envelope'></i>
                    </div>
                    <div class="C2-usuario">
                        <input type="password" placeholder="Contraseña" name="Password" required>
                        <i class='bx bxs-lock-alt'></i>
                    </div>
                    <div class="C4-recuerdame">
                        <label><input type="checkbox">Recuérdame</label>
                        <a href="#">¿Olvidaste tu contraseña?</a>
                    </div>
                    <button type="submit" class="btn">Iniciar Sesión</button>
                    <div class="C5-registrar">
                        <p>¿No tienes una cuenta? <a href="../vista/registrar.jsp">Registrarse</a></p>
                        <p>Volver al <a href="../index.jsp">Inicio</a></p>
                    </div>
                </form>
            </div>
        </main>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
