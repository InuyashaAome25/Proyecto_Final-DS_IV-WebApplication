package BASE_DE_DATOS;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

public class InformenesAdm extends Prestamos{

    private Statement stmt;
    private ResultSet recordset;
    String user="sa";
    String password="Inuyasha25";
    Conexion obj = new Conexion(user,password);

    public  LinkedList<Prestamos> consultaPopular(Conexion obj1) throws Exception {
        Connection cnn = obj.establecer_Conexion();
        LinkedList<OperacionesLogAdm.Prestamos> listaPopular = new LinkedList<OperacionesLogAdm.Prestamos>();

        try {

            cnn = obj1.establecer_Conexion();
            stmt = cnn.createStatement();

            // Consulta para obtener los 5 libros más populares (con más préstamos) y la cantidad de veces que han sido prestados
            recordset = stmt.executeQuery("Select top 5 count(p.idLibro) as Cantidad_Pedida, l.titulo from Prestamos p join Libros l on p.idLibro = l.idLibro group by l.titulo order by Cantidad_Pedida desc");//ejecutando el sql de consulta

            while (recordset.next()) {

                OperacionesLogAdm.Prestamos objPopular = new OperacionesLogAdm.Prestamos();

                // Se asigna la cantidad de veces que ha sido prestado cada libro al objeto Prestamos "objPopular"
                objPopular.setIdLibro(recordset.getInt("Cantidad_Pedida"));
                objPopular.setTitulo(recordset.getString("titulo"));
                // Se agrega el objeto Prestamos "objPopular" a la lista "listaPopular"
                listaPopular.add(objPopular);
            }
            cnn.close();
            // Se devuelve la lista con los libros más populares y su cantidad de préstamos
            return listaPopular;
        }
        catch (SQLException e){
            cnn.close();
            throw new Exception ("Error...en la consulta de todos los registros");
        }
    }

    public BASE_DE_DATOS.Prestamos consultaPrestamos (Conexion obj1) throws Exception{
        Connection cnn = obj.establecer_Conexion();
        stmt = cnn.createStatement();
        String cadSQL;
        Prestamos objPrestamos = new OperacionesLogAdm.Prestamos();
        try{
            // Consulta para obtener el número total de préstamos registrados en la tabla Prestamos
            cadSQL = "Select count(idPréstamo) as idPrestamo from Prestamos";
            recordset = stmt.executeQuery(cadSQL);

            // Verificando si la consulta SQL devolvió algún resultado
            boolean registroPrestamos = recordset.next();
            if (!(registroPrestamos)){
                // Si no hay resultados, lanza una excepción indicando que no hay registros seleccionados
                throw new Exception ("Error...no hay registro seleccionado");
            }else{
                // Si hay resultados, se extrae el valor del campo "idPrestamo" del primer resultado
                // y se asigna al objeto Prestamos "objPrestamos"
                objPrestamos.setIdPrestamo(recordset.getInt("idPrestamo"));
                cnn.close();
                // Se devuelve el objeto Prestamos con el valor del campo "idPrestamo"
                return objPrestamos;
            }
        }catch(SQLException e){
            cnn.close();
            throw new Exception ("Error...al generar el informe");
        }
    }

    public  LinkedList<Prestamos> mayorPrestamos(Conexion obj1) throws Exception {
        Connection cnn = obj.establecer_Conexion();
        LinkedList<Prestamos> listaPrestamos = new LinkedList<OperacionesLogAdm.Prestamos>();

        try {

            cnn = obj.establecer_Conexion();
            stmt = cnn.createStatement();

            // Consulta para obtener los 5 usuarios que más préstamos han realizado y la cantidad de préstamos realizados por cada uno
            recordset = stmt.executeQuery("SELECT TOP 5 p.idUsuario, u.nombre ,u.apellido, COUNT(p.idUsuario) AS Cantidad_Prestamo\n" +
                    "FROM Usuarios u\n" +
                    "JOIN Prestamos p ON u.idUsuario = p.idUsuario\n" +
                    "GROUP BY p.idUsuario, u.nombre, u.apellido\n" +
                    "ORDER BY Cantidad_Prestamo DESC;");//ejecutando el sql de consulta

            while (recordset.next()) {

                Prestamos objPrestamos = new Prestamos();
                // Se asigna la información de los usuarios que más préstamos han realizado al objeto Prestamos "objPrestamos"
                objPrestamos.setNombre(recordset.getString("Nombre"));
                objPrestamos.setApellido(recordset.getString("Apellido"));
                objPrestamos.setIdUsuario(recordset.getString("idUsuario"));
                objPrestamos.setCantidadPrestamo(recordset.getInt("Cantidad_Prestamo"));
                // Se agrega el objeto Prestamos "objPrestamos" a la lista "listaPrestamos"
                listaPrestamos.add(objPrestamos);
            }
            cnn.close();
            // Se devuelve la lista con la información de los usuarios con más préstamos realizados
            return listaPrestamos;
        }
        catch (SQLException e){
            cnn.close();
            throw new Exception ("Error...en la consulta de todos los registros");
        }
    }
}
