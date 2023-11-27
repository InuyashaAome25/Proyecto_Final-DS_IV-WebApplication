package OperacionesLogAdm;

import BASE_DE_DATOS.Conexion;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class EjecucionesAdm {
    private Statement stmt;
    private ResultSet recordSet;

    //Metodo para realizar el prestamo
    public void nuevoPrestamo(Conexion objc1) throws Exception {
        Connection cnn = null;
        try {
            cnn = objc1.establecer_Conexion();
            stmt = cnn.createStatement();
            String resp ="";
            stmt.executeUpdate(resp);
            cnn.close();
        } catch (SQLException e) {
            cnn.close();
            throw new Exception("Error al crear el prestamo");
        }
    }

    //Metodo para actualizar disponibilidad de los libros
    public void actualizar(Conexion objC) throws Exception{
        Connection cnn = null;
        try {
            cnn = objC.establecer_Conexion();
            stmt = cnn.createStatement();

            // Verificar si el libro está disponible para prestar
            String checkSQL = "";
            recordSet = stmt.executeQuery(checkSQL);
            if (recordSet.next()) {
                int disponible = recordSet.getInt("disponible");
                int prestado = recordSet.getInt("prestados");

                // Asegurarse de que hay copias disponibles para prestar
                if (disponible > 0) {
                    // Actualizar la base de datos con los nuevos valores
                    String updateSQL = "";
                    stmt.executeUpdate(updateSQL);
                    cnn.close();
                } else {
                    cnn.close();
                    throw new Exception("El libro no está disponible para préstamo.");
                }
            } else {
                cnn.close();
                throw new Exception("Libro no encontrado en la base de datos.");
            }
        } catch (SQLException e) {
            cnn.close();
            throw new Exception("Error al prestar el libro: " + e.getMessage());
        }
    }
}
