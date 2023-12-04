package OperacionesLogAdm;

import BASE_DE_DATOS.Conexion;
import BASE_DE_DATOS.Prestamos;
import BASE_DE_DATOS.Usuarios_Prestamos;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.LinkedList;

public class InformenesAdm {
    private Statement stmt;
    private ResultSet recordSet;

    //Metodo de usuarios con mas prestamos
    public LinkedList<Usuarios_Prestamos> usuarioMasPrestamos (Conexion obj1) throws Exception {
        Connection cnn = null;

        try {
            cnn = obj1.establecer_Conexion();
            while (recordSet.next()) {

            }
            cnn.close();
            return null;
        } catch (SQLException e) {
            cnn.close();
            throw new Exception("Error en la consulta de libros");
        }
    }

    //Metodo de consulta de todos los prestamos
    public LinkedList<Prestamos> consultaTodoPrestamos(Conexion obj1 ) throws Exception {
        Connection cnn = null;

        try {
            cnn = obj1.establecer_Conexion();
            stmt = cnn.createStatement();
            recordSet = stmt.executeQuery("");

            while (recordSet.next()) {

            }
            cnn.close();
            return null;
        } catch (SQLException e) {
            cnn.close();
            throw new Exception("Error en la consulta");
        }
    }

    //Metodo que realiza la devoluvion del libro
    public int devolucionLibro (Conexion obj1) throws Exception {
        Connection cnn = null;
        int resp = 0;

        try {
            cnn = obj1.establecer_Conexion();
            stmt = cnn.createStatement();
            resp = stmt.executeUpdate("");
            cnn.close();
            return resp;
        } catch (SQLException e) {
            cnn.close();
            throw new Exception("Error al intentar la devolucion");
        }
    }

    //Metodo para saber la cantidad de prestamos
    public int cantidadPrestamo(Conexion obj) throws Exception{
        Connection cnn = null;

        try {
            stmt = cnn.createStatement();
            String cadSQL;
            cadSQL="";

        }catch (SQLException e) {
            cnn.close();
            throw new Exception("Error al intentar la devolucion");
        }
        return 0;
    }
}
