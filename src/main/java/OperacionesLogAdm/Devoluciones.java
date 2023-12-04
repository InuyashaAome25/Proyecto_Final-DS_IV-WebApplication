package OperacionesLogAdm;

import BASE_DE_DATOS.Conexion;
import BASE_DE_DATOS.Prestamos;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;

public class Devoluciones {
    private Statement stmt;
    private int idPrestamo;
    private  String name;
    private String titulo;
    private LocalDate fechaPres;
    private LocalDate fechaDev;
    private String  estado;

    public void asignar(int id,String title,String nombre,String fechaPrestamo,String fechaDevolucion,String revision) {
        idPrestamo = id;
        titulo = title;
        name = nombre;
        fechaPres = LocalDate.parse(fechaPrestamo);
        fechaDev = LocalDate.parse(fechaDevolucion);
        estado = revision;
    }

    public int devoluciones(Conexion obj1, int idPrestamo)throws Exception{
        Connection cnn = null;
        int resp = 0;
        java.sql.Date fecha = java.sql.Date.valueOf(fechaDev);

        try {
            cnn = obj1.establecer_Conexion();
            stmt = cnn.createStatement();
            resp = stmt.executeUpdate("UPDATE `Prestamos` SET fechaDevolucion = '"+fecha+"' WHERE idPrestamo = '"+idPrestamo+"' ");

            cnn.close();
            return resp;
        }catch (SQLException e){
            cnn.close();
            throw new Exception("Error al intentar crear un registro"+e.getMessage());
        }
    }


}
