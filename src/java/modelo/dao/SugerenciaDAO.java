package modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import modelo.dto.sugerencias;
import conexiones.Conexion;

public class SugerenciaDAO {
    private final Conexion conexion;

    public SugerenciaDAO() {
        this.conexion = new Conexion();
    }

    public boolean registrarSugerencia(sugerencias nuevaSugerencia) {
        boolean registrado = false;
        String query = "INSERT INTO sugerencias (nombre, correo, telefono, categoria, asunto, descripcion) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection con = conexion.getConection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, nuevaSugerencia.getNombre());
            ps.setString(2, nuevaSugerencia.getCorreo());
            ps.setString(3, nuevaSugerencia.getTelefono());
            ps.setString(4, nuevaSugerencia.getCategoria());
            ps.setString(5, nuevaSugerencia.getAsunto());
            ps.setString(6, nuevaSugerencia.getDescripcion());
            int rowsAffected = ps.executeUpdate();
            registrado = rowsAffected > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return registrado;
    }
}
