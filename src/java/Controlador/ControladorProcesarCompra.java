package Controlador;

import conexiones.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ControladorProcesarCompra", urlPatterns = {"/ControladorProcesarCompra"})
public class ControladorProcesarCompra extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String idClienteStr = request.getParameter("idCliente");
    String totalStr = request.getParameter("total");
    String nombres = request.getParameter("nombres");
    String email = request.getParameter("email");

    // Imprimir los valores de los parámetros para depurar
    System.out.println("idCliente: " + idClienteStr);
    System.out.println("total: " + totalStr);
    System.out.println("nombres: " + nombres);
    System.out.println("email: " + email);

    if (idClienteStr == null || totalStr == null || nombres == null || email == null) {
        System.out.println("Uno o más parámetros son null");
        response.sendRedirect("vista/error.jsp");
        return;
    }

    int idCliente = 0;
    double monto = 0.0;

    try {
        idCliente = Integer.parseInt(idClienteStr);
        monto = Double.parseDouble(totalStr);
    } catch (NumberFormatException e) {
        e.printStackTrace();
        response.sendRedirect("vista/error.jsp");
        return;
    }

    Conexion conn = new Conexion();
    Connection con = null;
    PreparedStatement ps = null;

    try {
        con = conn.getConection();

        // Obtener la fecha y hora actual
        LocalDateTime fechaCompra = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String fechaCompraStr = fechaCompra.format(formatter);

        String query = "INSERT INTO compras (idCliente, FechaCompra, Monto, Nombres, Email) VALUES (?, ?, ?, ?, ?)";
        ps = con.prepareStatement(query);
        ps.setInt(1, idCliente);
        ps.setString(2, fechaCompraStr);
        ps.setDouble(3, monto);
        ps.setString(4, nombres);
        ps.setString(5, email);

        int resultado = ps.executeUpdate();
        if (resultado > 0) {
            response.sendRedirect("vista/confirmacion.jsp");
        } else {
            response.sendRedirect("vista/error.jsp");
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("error.jsp");
    } finally {
        try {
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
}
