package OperacionesLogAdm;

import BASE_DE_DATOS.Conexion;

import java.sql.*;

public class LIbroInsert {
    private Statement stmt;
    private ResultSet resultSet;
    private PreparedStatement preparedStatement;

    public int insertLibroYRelaciones(String genero, String titulo, int ISBN, String editorial, int dia, int mes, int año,
                                      String descripcion, String idAutor, String descripcionAct,
                                      String nombreImg, byte[] imagen, Conexion obj) throws Exception {
        Connection cnn = obj.establecer_Conexion();
        int idLibroInsertado = -1;

        try {
            // Inicio de la transacción
            cnn.setAutoCommit(false);

            // Inserción en la tabla Genero
            int idGeneroInsertado = insertarGenero(genero, obj);

            // Inserción en la tabla Libros
            idLibroInsertado = insertLibro(titulo, ISBN, editorial, dia, mes, año, descripcion, idGeneroInsertado, obj);

            // Inserción en la tabla Libro_Autor
            insertLibroAutor(idLibroInsertado, idAutor, descripcionAct, obj);

            // Inserción en la tabla Imagenes
            insertImagen(nombreImg, imagen, idLibroInsertado, obj);

            // Otros métodos que deseas ejecutar

            // Commit de la transacción
            cnn.commit();
        } catch (SQLException e) {
            e.printStackTrace();
            // Rollback en caso de error
            cnn.rollback();
            throw new Exception("Error al realizar la transacción", e);
        } finally {
            // Asegúrate de cerrar la conexión
            if (cnn != null) {
                // Restaurar el modo de autocommit antes de cerrar la conexión
                cnn.setAutoCommit(true);
                cnn.close();
            }
        }

        return idLibroInsertado;
    }
    private int insertarGenero(String genero, Conexion obj) throws Exception {
        Connection cnn = obj.establecer_Conexion();
        int idGeneroInsertado = -1;
        try {
            String cadSQL = "INSERT INTO Genero (genero) VALUES (?)";
            preparedStatement = cnn.prepareStatement(cadSQL);
            preparedStatement.setString(1, genero);
            
            int filasAfectadasG = preparedStatement.executeUpdate();
            if (filasAfectadasG > 0) {
                ResultSet generatedKeys = preparedStatement.getGeneratedKeys();
                if (generatedKeys.next()) {
                    idGeneroInsertado = generatedKeys.getInt(1);
                } else {
                    // No se pudo obtener el id_genero generado
                    throw new SQLException("Error al obtener el id_genero generado después de la inserción.");
                }
            } else {
                // No se insertaron filas
                throw new SQLException("Error al insertar datos en la tabla Libros. No se insertaron filas.");
            }
        } catch (SQLException e) {
            throw new Exception("Error al insertar datos en la tabla Genero", e);
        } finally {
            cerrarRecursos();
        }
        return idGeneroInsertado;
    }

    private int insertLibro(String titulo, int ISBN, String editorial, int dia, int mes, int año, String descripcion, int idGenero,Conexion obj) throws Exception {
        Connection cnn = obj.establecer_Conexion();
        int idLibroInsertado = -1;
        try {
            String sql = "INSERT INTO Libros (titulo, ISBN, editorial, dia, mes, año, descripcion, id_generoL) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            preparedStatement = cnn.prepareStatement(sql);
            preparedStatement.setString(1,titulo);
            preparedStatement.setInt(2,ISBN);
            preparedStatement.setString(3,editorial);
            preparedStatement.setInt(4,dia);
            preparedStatement.setInt(5,mes);
            preparedStatement.setInt(6,año);
            preparedStatement.setString(7,descripcion);
            preparedStatement.setInt(8,idGenero);

            int filasAfectadas = preparedStatement.executeUpdate();

            if (filasAfectadas > 0) {
                ResultSet generatedKeys = preparedStatement.getGeneratedKeys();
                if (generatedKeys.next()) {
                    idLibroInsertado = generatedKeys.getInt(1);
                } else {
                    // No se pudo obtener el id_genero generado
                    throw new SQLException("Error al obtener el id_genero generado después de la inserción.");
                }
            } else {
                // No se insertaron filas
                throw new SQLException("Error al insertar datos en la tabla Libros. No se insertaron filas.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new Exception("Error al insertar datos en la tabla Libros", e);
        }finally {
            cerrarRecursos();
        }
        return idLibroInsertado;
    }

    private int insertImagen(String nombreImg, byte[] imagen, int idLibro,Conexion obj) throws Exception {
        Connection cnn = obj.establecer_Conexion();
        int idLibroInsertado = -1;
        try{
            String sql = "INSERT INTO Imagenes (nombreImg, imagen, id_libroImg) VALUES (?, ?, ?)";
            preparedStatement = cnn.prepareStatement(sql);
            preparedStatement.setString(1,nombreImg);
            preparedStatement.setBytes(2,imagen);
            preparedStatement.setInt(3,idLibro);

            int filasAfectadas = preparedStatement.executeUpdate();

            if (filasAfectadas > 0) {
                ResultSet generatedKeys = preparedStatement.getGeneratedKeys();
                if (generatedKeys.next()) {
                    idLibroInsertado = generatedKeys.getInt(1);
                } else {
                    throw new SQLException("Error al obtener el id_libro generado después de la inserción.");
                }
            } else {
                throw new SQLException("Error al insertar datos en la tabla Imagenes. No se insertaron filas.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new Exception("Error al insertar datos en la tabla Imagen", e);
        }finally {
            cerrarRecursos();
        }
        return idLibroInsertado;
    }

    private void insertAutor(String idAutor, String nombreAct, String apellidoAct,Conexion obj) throws Exception {
        Connection cnn = obj.establecer_Conexion();
        try{
            String sql = "INSERT INTO Autor (id_autor, nombreAct, apellidoAct) VALUES (?, ?, ?)";
            preparedStatement = cnn.prepareStatement(sql);
            preparedStatement.setString(1,idAutor);
            preparedStatement.setString(2,nombreAct);
            preparedStatement.setString(3,apellidoAct);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new Exception("Error al insertar datos en la tabla Autor", e);
        }finally {
            cerrarRecursos();
        }
    }

    private void insertLibroAutor(int idLibro, String idAutor, String descripcionAct, Conexion obj) throws Exception {
        Connection cnn = obj.establecer_Conexion();
        try{
            String sql = "INSERT INTO Libro_Autor (id_libAct, id_actorLib, descripcionAct) VALUES (?, ?, ?)";
            preparedStatement = cnn.prepareStatement(sql);
            preparedStatement.setInt(1,idLibro);
            preparedStatement.setString(2,idAutor);
            preparedStatement.setString(3,descripcionAct);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new Exception("Error al insertar datos en la tabla Libro_Autor", e);
        }finally {
            cerrarRecursos();
        }
    }

    //Metodo para validar existencia del libro
    public boolean verificarUsuario(String ISBN, Conexion obj) throws Exception{
        Connection cnn= obj.establecer_Conexion();

        try {
            // Consulta SQL con PreparedStatement para evitar inyección SQL
            String cadSQL = "SELECT * FROM Libros WHERE ISBN = ?";
            PreparedStatement stmt = cnn.prepareStatement(cadSQL);
            stmt.setString(1, ISBN);

            resultSet = stmt.executeQuery();
            boolean registro = resultSet.next();
            return registro;
        } catch (SQLException e) {
            throw new Exception("Error al verificar el ID del Usuario", e);
        } finally {
            cerrarRecursos();
        }
    }

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
