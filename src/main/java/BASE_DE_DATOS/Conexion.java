package BASE_DE_DATOS;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    private String user;
    private String password;
    private Connection cnn;

    public Conexion(String user, String password) {
        this.user = user;
        this.password = password;
    }

    public Connection establecer_Conexion() throws Exception{
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            cnn = DriverManager.getConnection("jdbc:sqlserver://LAPTOP-469NVCC0:1433;database=PaginasDoradasBD;" +
                    "user=" +user+ ";password=" +password+ ";encrypt=false;logStatement=true");
            return cnn;
        }catch (ClassNotFoundException e){
            throw  new Exception("Error de carga del driver puente" + e.getMessage());
        }catch (SQLException e){
            throw new Exception("Error no se pudo realizar a conexion ala base de datos" + e.getMessage());
        }
    }
    public void cerrarConexion() {
        try {
            if (cnn != null && !cnn.isClosed()) {
                cnn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
