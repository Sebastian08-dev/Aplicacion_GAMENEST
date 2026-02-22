package modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import modelo.dto.reclamaciones;
import conexiones.Conexion;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ReclamacionDAO {

    private final Conexion conexion;
    Connection cnx;
    PreparedStatement ps;
    ResultSet rs;

    public ReclamacionDAO() {
        this.conexion = new Conexion();
    }

    public boolean reclamaciones(reclamaciones nuevaReclamacion) {
        boolean registrado = false;
        String query = "INSERT INTO reclamaciones (nombre, apellidos, correo, telefono, producto, monto_reclamado, descripcion_problema, evidencia, estado) VALUES (?, ?, ?, ?, ?, ?, ?, ?, 'P')";
        try (Connection con = conexion.getConection(); PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, nuevaReclamacion.getNombre());
            ps.setString(2, nuevaReclamacion.getApellidos());
            ps.setString(3, nuevaReclamacion.getCorreo());
            ps.setString(4, nuevaReclamacion.getTelefono());
            ps.setString(5, nuevaReclamacion.getProducto());
            ps.setDouble(6, nuevaReclamacion.getMonto_reclamado());
            ps.setString(7, nuevaReclamacion.getDescripcion_problema());
            ps.setString(8, nuevaReclamacion.getEvidencia());
            int rowsAffected = ps.executeUpdate();
            registrado = rowsAffected > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return registrado;
    }

    public List listar() {
        List<reclamaciones> lista = new ArrayList<>();
        String SQL = "SELECT id, nombre, apellidos, correo, telefono, producto, monto_reclamado, descripcion_problema, evidencia FROM reclamaciones where estado = 'P' ";
        try {
            cnx = conexion.getConection();
            ps = cnx.prepareStatement(SQL);
            rs = ps.executeQuery();
            while (rs.next()) {
                reclamaciones r = new reclamaciones();
                r.setId(rs.getInt(1));
                r.setNombre(rs.getString(2));
                r.setApellidos(rs.getString(3));
                r.setCorreo(rs.getString(4));
                r.setTelefono(rs.getString(5));
                r.setProducto(rs.getString(6));
                r.setMonto_reclamado(rs.getDouble(7));
                r.setDescripcion_problema(rs.getString(8));
                r.setEvidencia(rs.getString(9));
                lista.add(r);
            }
        } catch (SQLException e) {
        }
        return lista;
    }

    public boolean actualizarEstado(int id, String nuevoEstado) {
        String query = "UPDATE reclamaciones SET estado = ? WHERE id = ?";
        try (Connection con = conexion.getConection(); PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, nuevoEstado);
            ps.setInt(2, id);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public boolean eliminarReclamacion(int id) {
        String query = "DELETE FROM reclamaciones WHERE id = ?";
        try (Connection con = conexion.getConection(); PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, id);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

}
