package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.dao.SugerenciaDAO;
import modelo.dto.sugerencias;

@WebServlet(name = "ControladorSugerencia", urlPatterns = {"/ControladorSugerencia"})
public class ControladorSugerencia extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Obtener parámetros del formulario de sugerencias
        String nombre = request.getParameter("nombre");
        String correo = request.getParameter("correo");
        String telefono = request.getParameter("telefono");
        String categoria = request.getParameter("categoria");
        String asunto = request.getParameter("asunto");
        String descripcion = request.getParameter("descripcion");

        // Validar datos del formulario
        if (nombre.isEmpty() || correo.isEmpty() || categoria.isEmpty() || asunto.isEmpty() || descripcion.isEmpty()) {
            out.println("<div class='error'>Por favor, complete todos los campos requeridos</div>");
            return;
        }

        // Crear un objeto Sugerencia con la información del formulario
        sugerencias nuevaSugerencia = new sugerencias (0, nombre, correo, telefono, categoria, asunto, descripcion);

        // Crear una instancia del DAO para el registro de sugerencias
        SugerenciaDAO dao = new SugerenciaDAO();

        // Intentar registrar la sugerencia
        boolean registrado = dao.registrarSugerencia(nuevaSugerencia);

        // Mostrar mensaje de éxito o error según el resultado del registro
        if (registrado) {
            // Si el registro fue exitoso, mostrar mensaje de éxito y redireccionar
            out.println("<script type=\"text/javascript\">");
            out.println("alert('¡Sugerencia registrada exitosamente!');");
            out.println("window.location.href = 'index.jsp';");
            out.println("</script>");
        } else {
            // Si hubo un error en el registro, mostrar mensaje de error
            out.println("<div class='error'>Error al registrar la sugerencia. Intente nuevamente más tarde</div>");
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
        return "Short description";
    }
}
