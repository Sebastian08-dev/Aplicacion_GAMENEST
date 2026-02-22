package modelo.dao;

import modelo.dto.juego;
import conexiones.Conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class GestionarJDao {

    private Conexion conexion;

    public GestionarJDao() {
        conexion = new Conexion();
    }
  public boolean insertarJuego(juego j) {
        String sql = "INSERT INTO juego (nombreJuego, imagenJuego, pesoJuego, precio, categoria) VALUES (?, ?, ?, ?, ?)";
        try (Connection con = conexion.getConection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, j.getNombreJuego());
            ps.setString(2, j.getImagenJuego());
            ps.setString(3, j.getPesoJuego());
            ps.setDouble(4, j.getPrecio());
            ps.setString(5, j.getCategoria());

            int resultado = ps.executeUpdate();
            return resultado > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
