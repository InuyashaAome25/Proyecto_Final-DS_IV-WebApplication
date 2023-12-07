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
    public void insertarDireccion(String distrito, String corregimiento, String calle, String casa,String id_usuarioU, Conexion obj) throws Exception {
        Connection cnn = obj.establecer_Conexion();

        try {
            String cadSQL = "INSERT INTO DireccionU (distrito, corregimiento, calle, casa,id_usuarioU) VALUES (?, ?, ?, ?,?)";
            preparedStatement = cnn.prepareStatement(cadSQL);
            preparedStatement.setString(1, distrito);
            preparedStatement.setString(2, corregimiento);
            preparedStatement.setString(3, calle);
            preparedStatement.setString(4, casa);
            preparedStatement.setString(5,id_usuarioU);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new Exception("Error al insertar datos en la tabla DireccionU", e);
        } finally {
            cerrarRecursos();
        }
    }
    public void insertarUsuario(String idUsuario, String nombre, String apellido, String loginUser, String contrasena, Conexion obj) throws Exception {
        Connection cnn = obj.establecer_Conexion();

        try {
            String cadSQL = "INSERT INTO Usuarios (id_usuario, nombre, apellido, loginUser, contraseña) VALUES (?, ?, ?, ?, ?)";
            preparedStatement = cnn.prepareStatement(cadSQL);
            preparedStatement.setString(1, idUsuario);
            preparedStatement.setString(2, nombre);
            preparedStatement.setString(3, apellido);
            preparedStatement.setString(4, loginUser);
            preparedStatement.setString(5, contrasena);

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
