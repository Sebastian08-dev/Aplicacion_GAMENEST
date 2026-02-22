package Controlador;

import modelo.dto.reclamaciones;
import modelo.dao.ReclamacionDAO;
import modelo.dao.correo;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class srvReclamaciones extends HttpServlet {

    ReclamacionDAO reclamacionDAO = new ReclamacionDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        int id = Integer.parseInt(request.getParameter("id"));
        String correoUsuario = request.getParameter("correo");
        String nombreUsuario = request.getParameter("nombre");
        
        boolean resultado = false;

        if ("success".equals(action)) {
            resultado = reclamacionDAO.actualizarEstado(id, "A");
            if (resultado) {
                // correo de aprobación
                correo.enviarCorreoAprobacion(correoUsuario, nombreUsuario);
            }
        } else if ("danger".equals(action)) {
            resultado = reclamacionDAO.eliminarReclamacion(id);
            if (resultado) {
                // correo de eliminación
                correo.enviarCorreoRechazo(correoUsuario, nombreUsuario);
            }
        }

        response.setContentType("application/json");
        response.getWriter().write("{\"resultado\": " + resultado + "}");

    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
