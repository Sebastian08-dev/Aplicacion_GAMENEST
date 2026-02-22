package Controlador;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.dao.DetalleDao;
import modelo.dto.detalleJuego;

@WebServlet(name = "CCrudDetalleJuegos", urlPatterns = {"/CCrudDetalleJuegos"})
public class CCrudDetalleJuegos extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion != null) {
            switch (accion) {
                case "agregar":
                    agregarDetalleJuego(request, response);
                    break;
                case "editar":
                    editarDetalleJuego(request, response);
                    break;
                case "eliminar":
                    eliminarDetalleJuego(request, response);
                    break;
                case "cargar":
                    cargarDetalleJuego(request, response);
                    break;
                default:
                    listarDetalleJuegos(request, response);
                    break;
            }
        } else {
            listarDetalleJuegos(request, response);
        }
    }

    private void agregarDetalleJuego(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idJuegoStr = request.getParameter("idJuego");
        String descripcion = request.getParameter("descripcion");
        String fechaEstrenoStr = request.getParameter("fechaEstreno");
        String plataforma = request.getParameter("plataforma");
        String idiomaTexto = request.getParameter("idiomaTexto");
        String idiomaAudio = request.getParameter("idiomaAudio");

        if (idJuegoStr == null || descripcion == null || fechaEstrenoStr == null || plataforma == null || idiomaTexto == null || idiomaAudio == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Faltan datos para agregar el detalle del juego.");
            return;
        }

        try {
            int idJuego = Integer.parseInt(idJuegoStr);
            java.sql.Date fechaEstreno = java.sql.Date.valueOf(fechaEstrenoStr);

            detalleJuego nuevoDetalle = new detalleJuego();
            nuevoDetalle.setIdJuego(idJuego);
            nuevoDetalle.setDescripcionJuego(descripcion);
            nuevoDetalle.setFechaEsterno(fechaEstreno);
            nuevoDetalle.setPlataforma(plataforma);
            nuevoDetalle.setIdiomaTexto(idiomaTexto);
            nuevoDetalle.setIdiomaAudio(idiomaAudio);

            DetalleDao dao = new DetalleDao();
            if (dao.agregar(nuevoDetalle)) {
                response.sendRedirect("vista/GestionarJuegos.jsp");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al agregar el detalle del juego.");
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Formato de ID de juego inválido.");
        } catch (IllegalArgumentException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Fecha de estreno inválida.");
        }
    }

    private void editarDetalleJuego(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idStr = request.getParameter("id");
        String idJuegoStr = request.getParameter("idJuego");
        String descripcion = request.getParameter("descripcion");
        String fechaEstrenoStr = request.getParameter("fechaEstreno");
        String plataforma = request.getParameter("plataforma");
        String idiomaTexto = request.getParameter("idiomaTexto");
        String idiomaAudio = request.getParameter("idiomaAudio");

        if (idStr == null || idJuegoStr == null || descripcion == null || fechaEstrenoStr == null || plataforma == null || idiomaTexto == null || idiomaAudio == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Faltan datos para editar el detalle del juego.");
            return;
        }

        try {
            int id = Integer.parseInt(idStr);
            int idJuego = Integer.parseInt(idJuegoStr);
            java.sql.Date fechaEstreno = java.sql.Date.valueOf(fechaEstrenoStr);

            detalleJuego detalleEditado = new detalleJuego();
            detalleEditado.setDetalleJuegoId(id);
            detalleEditado.setIdJuego(idJuego);
            detalleEditado.setDescripcionJuego(descripcion);
            detalleEditado.setFechaEsterno(fechaEstreno);
            detalleEditado.setPlataforma(plataforma);
            detalleEditado.setIdiomaTexto(idiomaTexto);
            detalleEditado.setIdiomaAudio(idiomaAudio);

            DetalleDao dao = new DetalleDao();
            if (dao.editar(detalleEditado)) {
                response.sendRedirect("vista/GestionarJuegos.jsp");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al editar el detalle del juego.");
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Formato de ID o ID de juego inválido.");
        } catch (IllegalArgumentException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Fecha de estreno inválida.");
        }
    }

    private void eliminarDetalleJuego(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idStr = request.getParameter("id");

        if (idStr == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Falta el ID para eliminar el detalle del juego.");
            return;
        }

        try {
            int id = Integer.parseInt(idStr);

            DetalleDao dao = new DetalleDao();
            if (dao.eliminar(id)) {
                response.sendRedirect("vista/GestionarJuegos.jsp");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al eliminar el detalle del juego.");
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Formato de ID inválido.");
        }
    }

    private void cargarDetalleJuego(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idStr = request.getParameter("id");
        if (idStr == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Falta el ID para cargar el detalle del juego.");
            return;
        }

        try {
            int id = Integer.parseInt(idStr);

            DetalleDao dao = new DetalleDao();
            detalleJuego detalle = dao.obtenerPorId(id);

            if (detalle != null) {
                request.setAttribute("detalleJuego", detalle);
                request.getRequestDispatcher("vista/EditarDetalle.jsp").forward(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Detalle de juego no encontrado.");
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Formato de ID inválido.");
        } catch (SQLException e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al acceder a la base de datos.");
        }
    }

    private void listarDetalleJuegos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DetalleDao dao = new DetalleDao();
        request.setAttribute("detalleJuegos", dao.listar());
        request.getRequestDispatcher("vista/GestionarJuegos.jsp").forward(request, response);
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
        return "Servlet para manejar operaciones CRUD de detalles de juegos.";
    }
}
