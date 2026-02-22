
package modelo.dao;

import conexiones.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.dto.juego;

public class TablaJuegosDao {
    Connection cnx;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;

    public List<juego> listar() {
        List<juego> lista = new ArrayList<>();
        String SQL = "SELECT idJuego, imagenJuego, nombreJuego, pesoJuego, precio, categoria FROM juego order by nombreJuego asc";
        try {
            cnx = cn.getConection();
            ps = cnx.prepareStatement(SQL);
            rs = ps.executeQuery();
            while (rs.next()) {
                juego j = new juego();
                j.setIdJuego(rs.getInt(1));
                j.setImagenJuego(rs.getString(2));
                j.setNombreJuego(rs.getString(3));
                j.setPesoJuego(rs.getString(4));
                j.setPrecio(rs.getDouble(5));
                j.setCategoria(rs.getString(6));
                lista.add(j);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

    public boolean agregar(juego j) {
        String SQL = "INSERT INTO juego (imagenJuego, nombreJuego, pesoJuego, precio, categoria) VALUES (?, ?, ?, ?, ?)";
        try {
            cnx = cn.getConection();
            ps = cnx.prepareStatement(SQL);
            ps.setString(1, j.getImagenJuego());
            ps.setString(2, j.getNombreJuego());
            ps.setString(3, j.getPesoJuego());
            ps.setDouble(4, j.getPrecio());
            ps.setString(5, j.getCategoria());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean editar(juego j) {
        String SQL = "UPDATE juego SET imagenJuego=?, nombreJuego=?, pesoJuego=?, precio=?, categoria=? WHERE idJuego=?";
        try {
            cnx = cn.getConection();
            ps = cnx.prepareStatement(SQL);
            ps.setString(1, j.getImagenJuego());
            ps.setString(2, j.getNombreJuego());
            ps.setString(3, j.getPesoJuego());
            ps.setDouble(4, j.getPrecio());
            ps.setString(5, j.getCategoria());
            ps.setInt(6, j.getIdJuego());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean eliminar(int id) {
        String SQL = "DELETE FROM juego WHERE idJuego=?";
        try {
            cnx = cn.getConection();
            ps = cnx.prepareStatement(SQL);
            ps.setInt(1, id);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
