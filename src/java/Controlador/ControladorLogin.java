package Controlador;

import java.io.IOException;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.dao.LoginDAO;
import modelo.dto.Usuario;

/**
 * Servlet controlador para manejar el inicio de sesión de usuarios. Este
 * servlet autentica a los usuarios y maneja las sesiones.
 */
@WebServlet(name = "ControladorLogin", urlPatterns = {"/ControladorLogin"})
public class ControladorLogin extends HttpServlet {

    /**
     * Procesa las solicitudes tanto GET como POST.
     *
     * @param request El objeto HttpServletRequest que contiene la solicitud del
     * cliente.
     * @param response El objeto HttpServletResponse que contiene la respuesta
     * del servlet.
     * @throws ServletException Si ocurre un error específico del servlet.
     * @throws IOException Si ocurre un error de E/S.
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            // Obtener la acción solicitada desde la solicitud HTTP
            String accion = request.getParameter("accion");
            if (accion != null && accion.equals("cerrar")) {
                // Si la acción es cerrar sesión
                cerrarSesion(request); // Llamar al método para cerrar sesión
                response.sendRedirect("index.jsp"); // Redirigir al usuario a la página de inicio de sesión
                return; // Terminar el procesamiento para evitar errores adicionales
            }

            // Obtener los parámetros del formulario de inicio de sesión
            String email = request.getParameter("Email");
            String contraseña = request.getParameter("Password");

            // Crear una instancia del DAO de login
            LoginDAO loginDAO = new LoginDAO();

            // Verificar las credenciales del usuario
            Usuario usuario = loginDAO.autenticarUsuario(email, contraseña);

            if (usuario != null) { // Si el usuario es autenticado correctamente
                HttpSession sesion = request.getSession();
                sesion.setAttribute("usuario", usuario); // Guardar el usuario en la sesión

                // Verificar el rol y redirigir a la página correspondiente
                if (usuario.getRol().equals("cliente")) {
                    // Si el usuario es un cliente
                    System.out.println("Cliente autenticado: " + usuario.getNombres()); // Depuración
                    response.sendRedirect("index.jsp"); // Redirigir a la página de cliente
                } else if (usuario.getRol().equals("administrador")) {
                    // Si el usuario es un administrador
                    response.sendRedirect("vista/indexAdministrador.jsp"); // Redirigir a la página de administrador
                }
            } else {
                // Si las credenciales son incorrectas, mostrar un mensaje de error
                // Si las credenciales son incorrectas
                request.setAttribute("mensajeError", "Usuario o contraseña incorrectos");
                request.getRequestDispatcher("/vista/login.jsp").forward(request, response);
                // Redirigir a la página de inicio de sesión con un mensaje de error

            }
        } catch (Exception e) {
            // Captura de excepciones generales
            e.printStackTrace(); // Imprimir el error en la consola
            System.err.println("Error al procesar la solicitud: " + e.getMessage()); // Imprimir un mensaje de error específico en la consola
            response.sendRedirect("error.jsp"); // Redirigir a una página de error
        }
    }

    /**
     * Método para cerrar la sesión del usuario.
     *
     * @param request El objeto HttpServletRequest que contiene la solicitud del
     * cliente.
     */
    private void cerrarSesion(HttpServletRequest request) {
        HttpSession session = request.getSession(false); // Obtener la sesión existente, si existe
        if (session != null) {
            session.invalidate(); // Invalidar la sesión para cerrarla
        }
    }

    /**
     * Maneja las solicitudes GET.
     *
     * @param request El objeto HttpServletRequest que contiene la solicitud del
     * cliente.
     * @param response El objeto HttpServletResponse que contiene la respuesta
     * del servlet.
     * @throws ServletException Si ocurre un error específico del servlet.
     * @throws IOException Si ocurre un error de E/S.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response); // Procesar solicitudes GET
    }

    /**
     * Maneja las solicitudes POST.
     *
     * @param request El objeto HttpServletRequest que contiene la solicitud del
     * cliente.
     * @param response El objeto HttpServletResponse que contiene la respuesta
     * del servlet.
     * @throws ServletException Si ocurre un error específico del servlet.
     * @throws IOException Si ocurre un error de E/S.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response); // Procesar solicitudes POST
    }

    /**
     * Devuelve una breve descripción del servlet.
     *
     * @return Una cadena que describe brevemente el servlet.
     */
    @Override
    public String getServletInfo() {
        return "Controlador para el inicio de sesión de usuarios";
    }
}
