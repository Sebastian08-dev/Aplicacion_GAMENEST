package modelo.dao;

import conexiones.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.dto.detalleJuego;

public class DetalleDao {
    private Connection con;
    private Conexion cn;
    private PreparedStatement ps;
    private ResultSet rs;

    public DetalleDao() {
        cn = new Conexion();
    }

    public List<detalleJuego> listar() {
        List<detalleJuego> lista = new ArrayList<>();
        String SQL = "SELECT detalleJuegoId, idJuego, descripcionJuego, fechaEstreno, plataforma, idiomaTexto, idiomaAudio FROM detallejuego ORDER BY fechaEstreno ASC";
        try {
            con = cn.getConection();
            ps = con.prepareStatement(SQL);
            rs = ps.executeQuery();
            while (rs.next()) {
                detalleJuego d = new detalleJuego();
                d.setDetalleJuegoId(rs.getInt("detalleJuegoId"));
                d.setIdJuego(rs.getInt("idJuego"));
                d.setDescripcionJuego(rs.getString("descripcionJuego"));
                d.setFechaEsterno(rs.getDate("fechaEstreno"));
                d.setPlataforma(rs.getString("plataforma"));
                d.setIdiomaTexto(rs.getString("idiomaTexto"));
                d.setIdiomaAudio(rs.getString("idiomaAudio"));
                lista.add(d);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

    public boolean agregar(detalleJuego d) {
        String SQL = "INSERT INTO detallejuego (idJuego, descripcionJuego, fechaEstreno, plataforma, idiomaTexto, idiomaAudio, urlVideo) VALUES (?, ?, ?, ?, ?, ?, 'NULL')";
        try {
            con = cn.getConection();
            ps = con.prepareStatement(SQL);
            ps.setInt(1, d.getIdJuego());
            ps.setString(2, d.getDescripcionJuego());
            ps.setDate(3, new java.sql.Date(d.getFechaEsterno().getTime()));
            ps.setString(4, d.getPlataforma());
            ps.setString(5, d.getIdiomaTexto());
            ps.setString(6, d.getIdiomaAudio());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean editar(detalleJuego d) {
        String SQL = "UPDATE detallejuego SET idJuego=?, descripcionJuego=?, fechaEstreno=?, plataforma=?, idiomaTexto=?, idiomaAudio=? WHERE detalleJuegoId=?";
        try {
            con = cn.getConection();
            ps = con.prepareStatement(SQL);
            ps.setInt(1, d.getIdJuego());
            ps.setString(2, d.getDescripcionJuego());
            ps.setDate(3, new java.sql.Date(d.getFechaEsterno().getTime()));
            ps.setString(4, d.getPlataforma());
            ps.setString(5, d.getIdiomaTexto());
            ps.setString(6, d.getIdiomaAudio());
            ps.setInt(7, d.getDetalleJuegoId());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean eliminar(int id) {
        String SQL = "DELETE FROM detallejuego WHERE detalleJuegoId=?";
        try {
            con = cn.getConection();
            ps = con.prepareStatement(SQL);
            ps.setInt(1, id);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
   public detalleJuego obtenerPorId(int id) throws SQLException {
    detalleJuego detalle = null;
    String SQL = "SELECT detalleJuegoId, idJuego, descripcionJuego, fechaEstreno, plataforma, idiomaTexto, idiomaAudio FROM detallejuego WHERE detalleJuegoId=?";
    try {
        con = cn.getConection();
        ps = con.prepareStatement(SQL);
        ps.setInt(1, id);
        rs = ps.executeQuery();
        if (rs.next()) {
            detalle = new detalleJuego();
            detalle.setDetalleJuegoId(rs.getInt("detalleJuegoId"));
            detalle.setIdJuego(rs.getInt("idJuego"));
            detalle.setDescripcionJuego(rs.getString("descripcionJuego"));
            detalle.setFechaEsterno(rs.getDate("fechaEstreno"));
            detalle.setPlataforma(rs.getString("plataforma"));
            detalle.setIdiomaTexto(rs.getString("idiomaTexto"));
            detalle.setIdiomaAudio(rs.getString("idiomaAudio"));
        }
    } catch (SQLException e) {
        throw e; // Propagar la excepción para manejarla en el servlet
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (ps != null) try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (con != null) try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
    return detalle;
}

}
