package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.dao.GestionarJDao;
import modelo.dto.juego;

@WebServlet(name = "ControladorGestionarJuegos", urlPatterns = {"/ControladorGestionarJuegos"})
public class ControladorGestionarJuegos extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Resultado de la Operación</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Resultado de la Operación</h1>");
            out.println("<p>No se debería acceder a este servlet directamente.</p>");
            out.println("</body>");
            out.println("</html>");
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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Recuperar los parámetros del formulario
        String nombre = request.getParameter("nombre");
        String imagen = request.getParameter("imagen");
        String peso = request.getParameter("peso");
        double precio = Double.parseDouble(request.getParameter("precio"));
        String categoria = request.getParameter("categoria");

        // Crear un objeto juego con los datos recibidos
        juego nuevoJuego = new juego();
        nuevoJuego.setNombreJuego(nombre);
        nuevoJuego.setImagenJuego(imagen);
        nuevoJuego.setPesoJuego(peso);
        nuevoJuego.setPrecio(precio);
        nuevoJuego.setCategoria(categoria);

        // Instanciar el DAO para gestionar juegos
        GestionarJDao dao = new GestionarJDao();
        boolean insercionExitosa = false;
        try {
            insercionExitosa = dao.insertarJuego(nuevoJuego);
            if (insercionExitosa) {
                out.println("<html><body><h2>Juego agregado correctamente.</h2></body></html>");
            } else {
                out.println("<html><body><h2>Error al agregar el juego.</h2></body></html>");
            }
        } catch (Exception e) {
            out.println("<html><body><h2>Error al agregar el juego: " + e.getMessage() + "</h2></body></html>");
            e.printStackTrace(out); // Imprimir detalles del error en consola
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
