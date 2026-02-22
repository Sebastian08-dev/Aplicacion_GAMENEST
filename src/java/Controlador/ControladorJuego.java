package Controlador;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import modelo.dao.juegoDAO;
import modelo.dto.juego;

public class ControladorJuego extends HttpServlet {
    
   private static final long serialVersionUID = 1L;
   private static final int RECORDS_PER_PAGE = 15;

    juegoDAO juegodao = new juegoDAO();
    List<juego> lista = new ArrayList<>();
    

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        String accion = request.getParameter("accion");
        String page = request.getParameter("page");
        
        int currentPage = page == null ? 1 : Integer.parseInt(page);
        int offset = (currentPage - 1) * RECORDS_PER_PAGE;
        
        if (accion != null) {
            if (accion.equals("detalle")) {
                int idJuego = Integer.parseInt(request.getParameter("idJuego"));
                juego j = juegodao.obtenerJuego(idJuego);
                request.setAttribute("juego", j);
                request.getRequestDispatcher("./vista/detalleJuego.jsp").forward(request, response);
            } else if (accion.equals("filtrar")) {
                String categoria = request.getParameter("categoria");
                List<juego> juegosFiltrados = juegodao.getJuegosByCategory(categoria);
                String json = new Gson().toJson(juegosFiltrados);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
            }
        } else {
            lista = juegodao.getAllJuegos(RECORDS_PER_PAGE, offset);
            int totalRecords = juegodao.getTotalJuegos();
            int totalPages = (int) Math.ceil((double) totalRecords / RECORDS_PER_PAGE);
            
            request.setAttribute("juegos", lista);
            request.setAttribute("currentPage", currentPage);
            request.setAttribute("totalPages", totalPages);
            request.getRequestDispatcher("./vista/juegos.jsp").forward(request, response);
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
