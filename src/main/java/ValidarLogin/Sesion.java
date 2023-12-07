package ValidarLogin;

import BASE_DE_DATOS.Conexion;
import java.sql.*;

public class Sesion {
    private Statement stmt;
    private ResultSet resultSet;

    String user="sa";
    String password="Inuyasha25";
    Conexion obj = new Conexion(user,password);
    //Metodo para validar user y contraseña de la tabla Usuario
    public boolean validarLoginUser(String loginUser, String contraseña) throws Exception {
        Connection cnn = obj.establecer_Conexion();

        try {
            // Consulta SQL con PreparedStatement para evitar inyección SQL
            String cadSQL = "SELECT * FROM Usuarios WHERE loginUser = ? AND contraseña = ?";
            PreparedStatement stmt = cnn.prepareStatement(cadSQL);
            stmt.setString(1, loginUser);
            stmt.setString(2, contraseña);

            ResultSet resultSet = stmt.executeQuery();
            boolean validacion = resultSet.next();
            return validacion;
        } catch (SQLException e) {
            throw new Exception("Error al validar el loginUser", e);
        } finally {
            // Cierra recursos (ResultSet, PreparedStatement, Connection)
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (cnn != null) {
                try {
                    cnn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    //Metodo para validar user y password de Personal
    public boolean validarPersonal(String userNameP, String passwordP) throws Exception {
        Connection cnn = obj.establecer_Conexion();

        try {
            // Consulta SQL con PreparedStatement para evitar inyección SQL
            String cadSQL = "SELECT * FROM Personal WHERE userNameP = ? AND passwordP = ?";
            PreparedStatement stmt = cnn.prepareStatement(cadSQL);
            stmt.setString(1, userNameP);
            stmt.setString(2, passwordP);

            ResultSet resultSet = stmt.executeQuery();
            boolean validacion = resultSet.next();
            return validacion;
        } catch (SQLException e) {
            throw new Exception("Error al validar el Personal", e);
        } finally {
            // Cierra recursos (ResultSet, PreparedStatement, Connection)
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (cnn != null) {
                try {
                    cnn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
