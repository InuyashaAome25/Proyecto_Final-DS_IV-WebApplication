package BASE_DE_DATOS;

import java.sql.*;

public class Sesion extends Usuarios{
    private Statement stmt;
    private ResultSet recordset;
    private PreparedStatement pstmt;

    public boolean existeUsuario_sesion(Conexion obj1) throws Exception {
        Connection cnn = obj1.establecer_Conexion();
        stmt = cnn.createStatement();
        try {
            recordset = stmt.executeQuery("select idUsuario from Usuarios where idUsuario = '"+getId_usuario()+"'"+"and Contrasena = '"+getContraseña()+"'");
            boolean registro = recordset.next();
            cnn.close();
            return registro;
        } catch (SQLException e) {
            cnn.close();
            throw e;
        }
    }
}
