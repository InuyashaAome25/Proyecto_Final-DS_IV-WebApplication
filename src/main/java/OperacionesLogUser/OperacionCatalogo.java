package OperacionesLogUser;

import BASE_DE_DATOS.*;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

public class OperacionCatalogo {
    private Statement stmt;
    private ResultSet recordSet;
    private String catalogo, genero, titulo, autor;

    public void asignar(String busqueda, String gen, String tit, String aut){
        this.catalogo = busqueda;
        this.genero = gen;
        this.titulo = tit;
        this.autor = aut;
    }

    //Metodo para la mostrar el catalogo completo y por búsqueda personalizada genero, titulo, autor

    public LinkedList<Libros> consultarCatalogo(Conexion objC) throws Exception{
        Connection cnn = null;
        String cadSQL;
        boolean catalogo_Genero = false;
        boolean catalogo_Titulo = false;
        boolean catalogo_Autor = false;

        Libros objL = new Libros();
        Imagenes objI = new Imagenes();
        Genero objG = new Genero();
        Autor objA = new Autor();

        try {
            cnn = objC.establecer_Conexion();
            LinkedList<Libros> libros = new LinkedList<>();
            LinkedList<Genero> genero = new LinkedList<>();
            LinkedList<Imagenes> imagenes = new LinkedList<>();
            LinkedList<Autor> autores = new LinkedList<>();
            stmt = cnn.createStatement();

            if (catalogo.equals("catalogo")){
                cadSQL = "SELECT" +
                        "    L.titulo," +
                        "    L.ISBN," +
                        "    L.editorial," +
                        "    L.dia," +
                        "    L.mes," +
                        "    L.año," +
                        "    L.descripcion," +
                        "    G.genero," +
                        "    I.nombreImg," +
                        "    I.imagen," +
                        "    A.nombreAct," +
                        "    A.apellidoAct" +
                        "   LA.descripcionAct"+
                        "FROM" +
                        "    Libros L" +
                        "        JOIN" +
                        "    Genero G ON L.id_generoL = G.id_genero" +
                        "        JOIN" +
                        "    Imagenes I ON L.id_libro = I.id_libroImg" +
                        "        JOIN" +
                        "    Libro_Autor LA ON L.id_libro = LA.id_libAct" +
                        "        JOIN" +
                        "    Autor A ON LA.id_actorLib = A.id_autor;";
                recordSet = stmt.executeQuery(cadSQL);
                while (recordSet.next()){
                    Libros objLib = new Libros();
                    objLib.setTitulo(recordSet.getString("titulo"));
                    objLib.setISBN(recordSet.getInt("ISBN"));
                    objLib.setEditorial(recordSet.getString("editorial"));
                    objLib.setDia(recordSet.getInt("dia"));
                    objLib.setMes(recordSet.getInt("mes"));
                    objLib.setAño(recordSet.getInt("año"));
                    objLib.setDescripcion(recordSet.getString("descripcion"));
                    libros.add(objLib);
                }
            }else {
                if(genero.equals("genero")){
                    cadSQL = "SELEC" +
                            "    L.id_libro," +
                            "    L.titulo," +
                            "    L.ISBN," +
                            "    L.editorial," +
                            "    L.dia," +
                            "    L.mes," +
                            "    L.año," +
                            "    L.descripcion," +
                            "    G.genero," +
                            "    I.nombreImg," +
                            "    I.imagen" +
                            "FROM" +
                            "    Libros L" +
                            "        JOIN" +
                            "    Genero G ON L.id_generoL = G.id_genero" +
                            "        JOIN" +
                            "    Imagenes I ON L.id_libro = I.id_libroImg;";
                    recordSet = stmt.executeQuery(cadSQL);
                    catalogo_Genero = recordSet.next();
                } else if (titulo.equals("titulo")) {
                    cadSQL = "SELECT" +
                            "    L.id_libro," +
                            "    L.titulo," +
                            "    L.ISBN," +
                            "    L.editorial," +
                            "    L.dia," +
                            "    L.mes," +
                            "    L.año," +
                            "    L.descripcion," +
                            "    G.genero," +
                            "    I.nombreImg," +
                            "    I.imagen" +
                            "FROM" +
                            "    Libros L" +
                            "JOIN" +
                            "    Genero G ON L.id_generoL = G.id_genero" +
                            "LEFT JOIN" +
                            "    Imagenes I ON L.id_libro = I.id_libroImg;";
                    recordSet = stmt.executeQuery(cadSQL);
                    catalogo_Titulo = recordSet.next();
                }else {
                    cadSQL = "SELECT" +
                            "    L.id_libro," +
                            "    L.titulo," +
                            "    L.ISBN," +
                            "    L.editorial," +
                            "    L.dia," +
                            "    L.mes," +
                            "    L.año," +
                            "    L.descripcion," +
                            "    G.genero," +
                            "    I.nombreImg," +
                            "    I.imagen," +
                            "    A.nombreAct," +
                            "    A.apellidoAct," +
                            "   LA.descripcionAct"+
                            "FROM" +
                            "    Libros L" +
                            "        JOIN" +
                            "    Genero G ON L.id_generoL = G.id_genero" +
                            "        LEFT JOIN" +
                            "    Imagenes I ON L.id_libro = I.id_libroImg" +
                            "        RIGHT JOIN" +
                            "    Libro_Autor LA ON L.id_libro = LA.id_libAct" +
                            "        RIGHT JOIN" +
                            "    Autor A ON LA.id_actorLib = A.id_autor;";
                    recordSet = stmt.executeQuery(cadSQL);
                    catalogo_Autor = recordSet.next();
                }

                if (catalogo_Genero){
                    do {
                        objL.setTitulo(recordSet.getString("titulo"));
                        objL.setISBN(recordSet.getInt("ISBN"));
                        objL.setEditorial(recordSet.getString("editorial"));
                        objL.setDia(recordSet.getInt("dia"));
                        objL.setMes(recordSet.getInt("mes"));
                        objL.setAño(recordSet.getInt("año"));
                        objL.setDescripcion(recordSet.getString("descripcion"));
                        objG.setGenero(recordSet.getString("genero"));
                        objI.setNombreImg(recordSet.getString("nombreImg"));
                        objI.setImagen(recordSet.getBytes("imagen"));
                        libros.add(objL);
                        genero.add(objG);
                        imagenes.add(objI);
                    }while (recordSet.next());
                } else if (catalogo_Titulo) {
                    do {
                        objL.setTitulo(recordSet.getString("titulo"));
                        objL.setISBN(recordSet.getInt("ISBN"));
                        objL.setEditorial(recordSet.getString("editorial"));
                        objL.setDia(recordSet.getInt("dia"));
                        objL.setMes(recordSet.getInt("mes"));
                        objL.setAño(recordSet.getInt("año"));
                        objL.setDescripcion(recordSet.getString("descripcion"));
                        objI.setNombreImg(recordSet.getString("nombreImg"));
                        objI.setImagen(recordSet.getBytes("imagen"));
                        objG.setGenero(recordSet.getString("genero"));
                        libros.add(objL);
                        imagenes.add(objI);
                        genero.add(objG);
                    }while (recordSet.next());
                } else if (catalogo_Autor) {
                    do {
                        objL.setTitulo(recordSet.getString("titulo"));
                        objL.setISBN(recordSet.getInt("ISBN"));
                        objL.setEditorial(recordSet.getString("editorial"));
                        objL.setDia(recordSet.getInt("dia"));
                        objL.setMes(recordSet.getInt("mes"));
                        objL.setAño(recordSet.getInt("año"));
                        objL.setDescripcion(recordSet.getString("descripcion"));
                        objI.setNombreImg(recordSet.getString("nombreImg"));
                        objI.setImagen(recordSet.getBytes("imagen"));
                        objG.setGenero(recordSet.getString("genero"));
                        libros.add(objL);
                        imagenes.add(objI);
                        genero.add(objG);
                        autores.add(objA);
                    }while (recordSet.next());
                }else {
                    cnn.close();
                    throw new Exception("Error. No se puedo extraer los datos de la BD");
                }
                cnn.close();
            }
            return libros;
        }catch (SQLException e){
            cnn.close();
            throw new Exception("Error en la busqueda del catalogo" + e.getMessage());
        }
    }
}
