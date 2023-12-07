<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="BASE_DE_DATOS.InformenesAdm" %>
<%@ page import="BASE_DE_DATOS.Conexion" %>
<%@ page import="BASE_DE_DATOS.Prestamos" %>
<%@ page import="java.util.LinkedList" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Paginas Doradas S.A - Proyecto - INFORMEN</title>
    <link rel="stylesheet" href="../CSS/PlantillaBibliotecario.css">
    <link rel="stylesheet" href="../CSS/InformenesEstilo.css">
</head>
<body>
    <header>
        <div>
            <img src="../IMG/Logo.png" alt="logo compañia" class="logo">
            <h1 class="tituloPrincipal">paginas doradas</h1>
        </div>
    </header>
    <nav>
        <ul class="menu">
            <li> <a href="../JSP/Bibliotecario.jsp" id="aInicio">Inicio</a> </li>
            <li> <a href="../JSP/CatalogoBibliotecario.jsp" >Catalogo</a> </li>
            <li> <a href="../JSP/Crear_Libro.jsp">registro</a>
                <ul class="submenu">
                    <li><a href="../JSP/prestamosBibliotecario.jsp">Prestamos</a></li>
                    <li><a href="../JSP/Devoluciones.jsp">Devoluciones</a></li>
                </ul>
            </li>
            <li> <a href="../JSP/">informenes</a></li>
            <li> <a href="../JSP/Avisar.jsp">avisar</a></li>
            <li> <a href="../JSP/Logout.jsp">Cerrar sesión</a> </li>
        </ul>
    </nav>
    <main>
        <%
            // Instancia de la clase Informes
            InformenesAdm informes = new InformenesAdm();
            // Instancia de la clase Conexion
            Conexion obj1 = new Conexion("sa", "Inuyasha25");

            if (request.getParameter("generarInforme") != null) {
                try {
                    // Llamada al método para obtener la cantidad de préstamos
                    Prestamos cantidadPrestamos = informes.consultaPrestamos(obj1);
                    // Llamada al método para obtener los libros más populares
                    LinkedList<Prestamos> librosPopulares = informes.consultaPopular(obj1);
                    // Llamada al método para obtener los usuarios con más préstamos
                    LinkedList<Prestamos> usuariosConMasPrestamos = informes.mayorPrestamos(obj1);

                    // Ahora puedes trabajar con los resultados como desees

                    // Aquí puedes imprimir los resultados directamente en el HTML del JSP
                    System.out.println("<p>Cantidad de Préstamos: " + cantidadPrestamos.getIdPrestamo() + "</p>");

                    System.out.println("<p>Los 5 libros más populares son: </p>");
                    System.out.println("<ul>");
                    for (Prestamos libro : librosPopulares) {
                        System.out.println("<li>" + libro.getTitulo() + " con una cantidad pedida de: " + libro.getIdLibro() + "</li>");
                    }
                    System.out.println("</ul>");

                    System.out.println("<p>Los 5 usuarios con más préstamos son: </p>");
                    System.out.println("<ul>");
                    for (Prestamos usuario : usuariosConMasPrestamos) {
                        System.out.println("<li>" + usuario.getNombre() + usuario.getApellido() + " IdUsuario: " + usuario.getIdUsuario() +
                                " con una cantidad de préstamos de: " + usuario.getCantidadPrestamo() + "</li>");
                    }
                    System.out.println("</ul>");

                } catch (Exception e) {
                    // Manejo de errores
                    e.printStackTrace();
                    System.out.println("<p>Error al generar el informe: " + e.getMessage() + "</p>");
                }
            }
        %>
        <form method="get">
            <div class="conterInfor">
                <div id="Reporte">
                    <button>Generar Reporte</button>
                </div>
                <div id="info-reporte">
                    <h3>Reporte</h3>
                    <h3>Cantidad de prestamos</h3>
                    <input type="text" name="cantidadP" readonly>
                </div>
            </div>
            <div class="contenedor">
                <div class="tablaLibro">
                    <table class="estiloTablas">
                        <caption>Libros más populares</caption>
                        <thead>
                        <tr>
                            <th>Titulo</th>
                            <th>Autor</th>
                            <th>Genero</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th>TEXTO</th>
                            <th>TEXTO</th>
                            <th>TEXTO</th>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="tablaUsuario">
                    <table class="estiloTablas">
                        <caption>Usuarios con más prestamos</caption>
                        <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Apellido</th>
                            <th>Prestamos hechos</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th>TEXTO</th>
                            <th>TEXTO</th>
                            <th>TEXTO</th>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </form>
    </main>
    <footer>
        <p class="piePag">
            Uzziel Aparicio -
            Cesar Castillo -
            Michael Perez -
            Victor Rodriguez -
            Richard Zhang
        </p>
        <p class="piePag">
            © Copyright 2023 UTP - 1LS122 - Desarrollo de software iv - grupo 1
        </p>
    </footer>
</body>
</html>