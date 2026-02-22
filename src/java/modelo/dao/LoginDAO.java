package modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import conexiones.Conexion;
import modelo.dto.Usuario;

public class LoginDAO {

    private final Connection conexion;

    // Constructor de la clase LoginDAO que inicializa la conexión a la base de datos
    public LoginDAO() throws SQLException {
        this.conexion = new Conexion().getConection(); // Se obtiene la conexión a la base de datos usando la clase Conexion
    }

    // Método para autenticar un usuario dado su email y contraseña
    public Usuario autenticarUsuario(String email, String contraseña) {
        Usuario usuario = null; // Se inicializa como nulo el objeto Usuario
        try {
            String query = "SELECT * FROM usuario WHERE Email = ? AND Contraseña = ?"; // Consulta SQL para obtener el usuario con el email y contraseña dados
            PreparedStatement ps = conexion.prepareStatement(query); // Se prepara la consulta SQL
            ps.setString(1, email); // Se establece el primer parámetro de la consulta como el email
            ps.setString(2, contraseña); // Se establece el segundo parámetro de la consulta como la contraseña
            ResultSet rs = ps.executeQuery(); // Se ejecuta la consulta y se obtiene el resultado
            if (rs.next()) { // Si hay un resultado
                // Se crea un nuevo objeto Usuario con los datos obtenidos de la consulta
                usuario = new Usuario(
                    rs.getInt("idCliente"),
                    rs.getString("Dni"),
                    rs.getString("Nombres"),
                    rs.getString("Direccion"),
                    rs.getString("Email"),
                    rs.getString("Contraseña"),
                    rs.getString("Rol")
                );
            }
            rs.close(); // Se cierra el ResultSet
            ps.close(); // Se cierra el PreparedStatement
        } catch (SQLException ex) { // Captura de excepciones SQL
            ex.printStackTrace(); // Impresión del error
        }
        return usuario; // Se devuelve el objeto Usuario
    }

    // Método para validar las credenciales de un usuario y devolver su rol
    public String validarCredenciales(String email, String contraseña) {
        String rol = null; // Se inicializa como nulo el rol
        try {
            String query = "SELECT Rol FROM Usuario WHERE Email = ? AND Contraseña = ?"; // Consulta SQL para obtener el rol del usuario con el email y contraseña dados
            PreparedStatement ps = conexion.prepareStatement(query); // Se prepara la consulta SQL
            ps.setString(1, email); // Se establece el primer parámetro de la consulta como el email
            ps.setString(2, contraseña); // Se establece el segundo parámetro de la consulta como la contraseña
            ResultSet rs = ps.executeQuery(); // Se ejecuta la consulta y se obtiene el resultado
            if (rs.next()) { // Si hay un resultado
                rol = rs.getString("Rol"); // Se obtiene el rol del resultado
            }
            rs.close(); // Se cierra el ResultSet
            ps.close(); // Se cierra el PreparedStatement
        } catch (SQLException ex) { // Captura de excepciones SQL
            ex.printStackTrace(); // Impresión del error
        }
        return rol; // Se devuelve el rol
    }
}
