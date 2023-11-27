package OperacionesLogUser;

import BASE_DE_DATOS.Conexion;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class EjecucionesUser {
    private Statement stmt;
    private ResultSet recordSet;

    //Metodo que verifica el id del usuario
    public boolean verificarUsuario(String id, Conexion obj) throws Exception{
        Connection cnn= obj.establecer_Conexion();
        try {
            stmt = cnn.createStatement();
            String cadSQL;
            cadSQL="";
            recordSet=stmt.executeQuery(cadSQL);
            boolean registro = recordSet.next();
            cnn.close();
            return registro;
        }catch (SQLException e){
            cnn.close();
            throw new Exception("Error... al verificar el ID del Usuario");
        }
    }

    //Metodo para agregar los datos del usuario
    public void adicionar(Conexion objC2) throws Exception{
        Connection cnn = null;
        try {
            cnn = objC2.establecer_Conexion();
            stmt = cnn.createStatement();
            String cadSQL ="";
            stmt.executeUpdate(cadSQL);
            cnn.close();
        }catch (SQLException r){
            cnn.close();
            throw new Exception("Error de insertar los datos");
        }
    }
}
