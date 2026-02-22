package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.dao.registrarDAO;
import modelo.dto.Usuario;
import modelo.dao.correo;

@WebServlet(name = "ControladorRegistrarUs", urlPatterns = {"/ControladorRegistrarUs"})
public class ControladorRegistrarUs extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            // Obtener parámetros del formulario de registro
            String dni = request.getParameter("Dni");
            String nombres = request.getParameter("Nombres");
            String direccion = request.getParameter("Direccion");
            String email = request.getParameter("Email");
            String contraseña = request.getParameter("Password"); // Corregir el nombre del parámetro
            String rol = "cliente"; // Establecer el rol predeterminado

            // Validar datos del formulario (puedes implementar validaciones adicionales)
            if (dni.isEmpty() || nombres.isEmpty() || direccion.isEmpty() || email.isEmpty() || contraseña == null || contraseña.isEmpty()) {
                out.println("<div class='error'>Por favor, complete todos los campos</div>");
                return;
            }

            // Crear un objeto Usuario con la información del formulario
            Usuario nuevoCliente = new Usuario(0, dni, nombres, direccion, email, contraseña, rol);

            // Crear una instancia del DAO para el registro de usuarios
            registrarDAO dao = new registrarDAO();

            // Intentar registrar al usuario
            try {
                if (dao.existeUsuarioPorDni(dni)) {
                    System.out.println("DNI ya está en uso");
                    response.sendRedirect("./vista/registrar.jsp?registro=dni");
                } else {
                    if (dao.existeUsuarioPorCorreo(email)) {
                        System.out.println("Correo ya está en uso");
                        response.sendRedirect("./vista/registrar.jsp?registro=correo");
                    } else {
                        boolean registrado = dao.registrarUsuario(nuevoCliente);
                        if (registrado) {
                            correo.enviarCorreoBienvenida(email, nombres);
                            response.sendRedirect("./vista/login.jsp?registro=exito");
                        } else {
                            out.println("<div class='error'>Error al registrar. Intente nuevamente más tarde</div>");
                        }
                    }
                }
            } catch (Exception e) {
                e.printStackTrace(); // Mejor opción para ver los errores completos
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Controlador para registrar nuevos usuarios";
    }
}
