package modelo.dao;

import modelo.dto.juego;
import modelo.dto.detalleJuego;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import conexiones.Conexion;
import java.util.stream.Collectors;

public class juegoDAO {

    Connection cnx;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;

    public List listar() {
        List<juego> lista = new ArrayList<>();
        String SQL = "SELECT idJuego, imagenJuego, nombreJuego, pesoJuego, categoria FROM juego order by nombreJuego asc";
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
                j.setCategoria(rs.getString(5));
                lista.add(j);
            }
        } catch (SQLException e) {
        }
        return lista;
    }

    public juego obtenerJuego(int idJuego) {
        juego j = null;
        String sql = "SELECT  j.idJuego, j.nombreJuego, j.imagenJuego, j.pesoJuego, j.categoria, j.precio, d.descripcionJuego, d.fechaEstreno, d.plataforma, d.idiomaTexto, d.idiomaAudio, d.urlVideo "
                + "FROM juego j "
                + "INNER JOIN detalleJuego d on j.idJuego = d.idJuego "
                + "WHERE j.idJuego = ?";
        try (Connection cnx = cn.getConection(); PreparedStatement ps = cnx.prepareStatement(sql)) {
            ps.setInt(1, idJuego);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    j = new juego();
                    j.setIdJuego(rs.getInt("idJuego"));
                    j.setNombreJuego(rs.getString("nombreJuego"));
                    j.setImagenJuego(rs.getString("imagenJuego"));
                    j.setPesoJuego(rs.getString("pesoJuego"));
                    j.setPrecio(rs.getDouble("precio"));
                    j.setCategoria(rs.getString("categoria"));
                    detalleJuego detalle = new detalleJuego();
                    detalle.setDescripcionJuego(rs.getString("descripcionJuego"));
                    detalle.setFechaEsterno(rs.getDate("fechaEstreno"));
                    detalle.setPlataforma(rs.getString("plataforma"));
                    detalle.setIdiomaTexto(rs.getString("idiomaTexto"));
                    detalle.setIdiomaAudio(rs.getString("idiomaAudio"));
                    detalle.setUrlVideo(rs.getString("urlVideo"));
                    j.setDetalleJuego(detalle);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener el juego: " + e.getMessage());
        }
        return j;
    }

    public List<juego> getJuegosByCategory(String categoria) {
        List<juego> lista = new ArrayList<>();
        String SQL = "SELECT idJuego, imagenJuego, nombreJuego, pesoJuego, categoria FROM juego WHERE categoria = ? ORDER BY nombreJuego ASC";
        try (Connection cnx = cn.getConection(); PreparedStatement ps = cnx.prepareStatement(SQL)) {
            ps.setString(1, categoria);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    juego j = new juego();
                    j.setIdJuego(rs.getInt(1));
                    j.setImagenJuego(rs.getString(2));
                    j.setNombreJuego(rs.getString(3));
                    j.setPesoJuego(rs.getString(4));
                    j.setCategoria(rs.getString(5));
                    lista.add(j);
                }
            }
        } catch (SQLException e) {
            // Log the exception or handle it appropriately
            e.printStackTrace();
        }
        return lista;
    }

    public List<juego> getAllJuegos(int limit, int offset) {
        List<juego> juegos = new ArrayList<>();
        String sql = "SELECT idJuego, imagenJuego, nombreJuego, pesoJuego, categoria FROM juego LIMIT ? OFFSET ?";

        try (Connection cnx = cn.getConection(); PreparedStatement ps = cnx.prepareStatement(sql);) {

            ps.setInt(1, limit);
            ps.setInt(2, offset);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                juego j = new juego();
                j.setIdJuego(rs.getInt("idJuego"));
                j.setImagenJuego(rs.getString("imagenJuego"));
                j.setNombreJuego(rs.getString("nombreJuego"));
                j.setPesoJuego(rs.getString("pesoJuego"));
                j.setCategoria(rs.getString("categoria"));
                juegos.add(j);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return juegos;
    }

    public int getTotalJuegos() {
        String sql = "SELECT COUNT(*) FROM juego";
        try (Connection cnx = cn.getConection(); PreparedStatement ps = cnx.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    // Método para obtener la conexión a la base de datos
    private Connection getConnection() {
        // Implementa la lógica para obtener una conexión a tu base de datos
        // Esto puede variar dependiendo de cómo hayas configurado tu conexión
        // Por ejemplo, podrías usar un DataSource o DriverManager
        return null;
        // Implementa la lógica para obtener una conexión a tu base de datos
        // Esto puede variar dependiendo de cómo hayas configurado tu conexión
        // Por ejemplo, podrías usar un DataSource o DriverManager
    }

}
