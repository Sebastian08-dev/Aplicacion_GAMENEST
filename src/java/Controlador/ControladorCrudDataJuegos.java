package Controlador;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import modelo.dao.TablaJuegosDao;
import modelo.dto.juego;

@MultipartConfig
@WebServlet(name = "ControladorCrudDataJuegos", urlPatterns = {"/ControladorCrudDataJuegos"})
public class ControladorCrudDataJuegos extends HttpServlet {
    

    private String pathFiles = "H:\\xamp\\htdocs\\GAMENEST\\web\\games\\";
    private File uploads = new File(pathFiles);
    private String[] extens = {".ico", ".png", ".jpg", ".jpeg"};

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String accion = request.getParameter("accion");
        if (accion != null) {
            switch (accion) {
                case "agregar":
                    agregarJuego(request, response);
                    break;
                case "editar":
                    editarJuego(request, response);
                    break;
                case "eliminar":
                    eliminarJuego(request, response);
                    break;
                default:
                    listarJuegos(request, response);
                    break;
            }
        } else {
            listarJuegos(request, response);
        }
    }

    private void agregarJuego(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String nombre = request.getParameter("nombre");
            Part part = request.getPart("imagen");
            String peso = request.getParameter("peso");
            String precio = request.getParameter("precio");
            String categoria = request.getParameter("categoria");

            if (part == null) {
                System.out.println("No ha seleccionado un archivo");
                return;
            }

            if (isExtension(part.getSubmittedFileName(), extens)) {
                String photo = saveFile(part, uploads);
                juego nuevoJuego = new juego();
                nuevoJuego.setNombreJuego(nombre);
                nuevoJuego.setImagenJuego(photo);
                nuevoJuego.setPesoJuego(peso);
                nuevoJuego.setPrecio(Double.parseDouble(precio));
                nuevoJuego.setCategoria(categoria);
                TablaJuegosDao dao = new TablaJuegosDao();
                dao.agregar(nuevoJuego);
            }
        } catch (Exception e) {
        }
        
        response.sendRedirect("vista/GestionarJuegos.jsp");
    }

    private void editarJuego(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idStr = request.getParameter("id");
        String nombre = request.getParameter("nombre");
        String imagen = request.getParameter("imagen");
        String peso = request.getParameter("peso");
        String precio = request.getParameter("precio");
        String categoria = request.getParameter("categoria");

        if (idStr != null && nombre != null && imagen != null && peso != null && precio != null && categoria != null) {
            try {
                int id = Integer.parseInt(idStr);

                juego juegoEditado = new juego();
                juegoEditado.setIdJuego(id);
                juegoEditado.setNombreJuego(nombre);
                juegoEditado.setImagenJuego(imagen);
                juegoEditado.setPesoJuego(peso);
                juegoEditado.setPrecio(Double.parseDouble(precio));
                juegoEditado.setCategoria(categoria);

                TablaJuegosDao dao = new TablaJuegosDao();
                dao.editar(juegoEditado);

                response.sendRedirect("vista/GestionarJuegos.jsp");
            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Formato de ID o precio inválido.");
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Faltan datos para editar el juego.");
        }
    }

    private void eliminarJuego(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idStr = request.getParameter("id");

        if (idStr != null) {
            try {
                int id = Integer.parseInt(idStr);

                TablaJuegosDao dao = new TablaJuegosDao();
                dao.eliminar(id);

                response.sendRedirect("vista/GestionarJuegos.jsp");
            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Formato de ID inválido.");
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Falta el ID para eliminar el juego.");
        }
    }

    private String saveFile(Part part, File pathUploads) {
        String pathAbsolute = "";

        try {
            Path path = Paths.get(part.getSubmittedFileName());
            String filename = path.getFileName().toString();
            InputStream input = part.getInputStream();

            if (input != null) {
                File file = new File(pathUploads, filename);
                pathAbsolute = "games/" + filename;
                Files.copy(input, file.toPath());
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return pathAbsolute;
    }

    private boolean isExtension(String filename, String[] extensions) {
        for (String et : extensions) {
            if (filename.toLowerCase().endsWith(et)) {
                return true;
            }
        }
        return false;
    }

    private void listarJuegos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        TablaJuegosDao dao = new TablaJuegosDao();
        request.setAttribute("juegos", dao.listar());
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
        return "Short description";
    }

}
