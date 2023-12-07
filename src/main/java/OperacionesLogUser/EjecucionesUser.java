package OperacionesLogUser;

import BASE_DE_DATOS.Conexion;

import java.sql.*;

public class EjecucionesUser {
    private Statement stmt;
    private ResultSet resultSet;
    private PreparedStatement preparedStatement;

    //Metodo que verifica el id del usuario
    public boolean verificarUsuario(String id, Conexion obj) throws Exception{
        Connection cnn= obj.establecer_Conexion();

        try {
            // Consulta SQL con PreparedStatement para evitar inyección SQL
            String cadSQL = "SELECT * FROM Usuarios WHERE id_usuario = ?";
            PreparedStatement stmt = cnn.prepareStatement(cadSQL);
            stmt.setString(1, id);

            resultSet = stmt.executeQuery();
            boolean registro = resultSet.next();
            return registro;
        } catch (SQLException e) {
            throw new Exception("Error al verificar el ID del Usuario", e);
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

    //Metodos para agregar los datos del usuario
    public int insertarDireccion(String distrito, String corregimiento, String calle, String casa, Conexion obj) throws Exception {
        Connection cnn = obj.establecer_Conexion();
        int idDireccionU = -1;

        try {
            String cadSQL = "INSERT INTO DireccionU (distrito, corregimiento, calle, casa) VALUES (?, ?, ?, ?)";
            preparedStatement = cnn.prepareStatement(cadSQL);
            preparedStatement.setString(1, distrito);
            preparedStatement.setString(2, corregimiento);
            preparedStatement.setString(3, calle);
            preparedStatement.setString(4, casa);

            int filasAfectadas = preparedStatement.executeUpdate();
            if (filasAfectadas > 0) {
                // Obtener el ID generado
                ResultSet generatedKeys = preparedStatement.getGeneratedKeys();
                if (generatedKeys.next()) {
                    idDireccionU = generatedKeys.getInt(1);
                    System.out.println("ID generado para DireccionU: " + idDireccionU);
                } else {
                    throw new SQLException("No se pudo obtener el ID generado para DireccionU");
                }
            }
        } catch (SQLException e) {
            throw new Exception("Error al insertar datos en la tabla DireccionU", e);
        } finally {
            cerrarRecursos();
        }
        return idDireccionU;
    }
    public void insertarUsuario(String idUsuario, String nombre, String apellido, String loginUser, String contrasena, int idDireccionU, Conexion obj) throws Exception {
        Connection cnn = obj.establecer_Conexion();

        try {
            String cadSQL = "INSERT INTO Usuarios (id_usuario, nombre, apellido, loginUser, contraseña, id_direccionU) VALUES (?, ?, ?, ?, ?, ?)";
            preparedStatement = cnn.prepareStatement(cadSQL);
            preparedStatement.setString(1, idUsuario);
            preparedStatement.setString(2, nombre);
            preparedStatement.setString(3, apellido);
            preparedStatement.setString(4, loginUser);
            preparedStatement.setString(5, contrasena);
            preparedStatement.setInt(6, idDireccionU);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new Exception("Error al insertar datos en la tabla Usuarios", e);
        } finally {
            cerrarRecursos();
        }
    }

    public void insertarTelefono(int numTelefono,String idUusarioT, Conexion obj) throws Exception {
        Connection cnn = obj.establecer_Conexion();

        try {
            String cadSQL = "INSERT INTO Telefono (numTelefonoP, id_usuarioT) VALUES (?, ?)";
            preparedStatement = cnn.prepareStatement(cadSQL);
            preparedStatement.setInt(1, numTelefono);
            preparedStatement.setString(2, idUusarioT);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new Exception("Error al insertar datos en la tabla Usuarios", e);
        } finally {
            cerrarRecursos();
        }
    }

    public void insertarCorreo(String correoUser, String idUsuarioC, Conexion obj) throws Exception {
        Connection cnn = obj.establecer_Conexion();

        try {
            String cadSQL = "INSERT INTO Correo (correoUser, id_usuarioC) VALUES (?, ?)";
            preparedStatement = cnn.prepareStatement(cadSQL);
            preparedStatement.setString(1, correoUser);
            preparedStatement.setString(2, idUsuarioC);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new Exception("Error al insertar datos en la tabla Usuarios", e);
        } finally {
            cerrarRecursos();
        }
    }

    // Método para cerrar recursos
    private void cerrarRecursos() {
        if (preparedStatement != null) {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (resultSet != null) {
            try {
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
