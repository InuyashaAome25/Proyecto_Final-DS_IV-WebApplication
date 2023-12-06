<%--
  Created by IntelliJ IDEA.
  User: mary arosemena
  Date: 12/04/2023
  Time: 3:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.InputStream" %>
<html>
<head>
    <title>Paginas Doradas S.A - Proyecto - CREAR_LIBRO</title>
    <LINK REL="stylesheet" HREF="../CSS/PlantillaBibliotecario.css">
    <link rel="stylesheet" href="../CSS/EstiloCrear.css">
</head>
<body>
    <header>
        <img src="../IMG/Logo.png" alt="logo compañía" class="logo">
        <h1 class="tituloPrincipal">registros</h1>
    </header>
    <nav>
        <ul class="menu">
            <li> <a href="Bibliotecario.html" id="aInicio">Inicio</a> </li>
            <li> <a href="CatalogoBibliotecario.html" >Catalogo</a> </li>
            <li> <a href="Crear_Libro.html">registro</a>
                <ul class="submenu">
                    <li><a href="prestamosBibliotecario.html">Prestamos</a></li>
                    <li><a href="devoluciones.html">Devoluciones</a></li>
                </ul>
            </li>
            <li> <a href="Informenes.html">informenes</a></li>
            <li> <a href="Avisar.html">avisar</a></li>
            <li> <a href="Login.html">Inicio de sesión</a> </li>
        </ul>
    </nav>
    <main>
        <%
            // Obtener los datos del formulario
            String nombreImagen = request.getParameter("nomIMG");
            String rutaImagen = request.getParameter("imagenBD");
            String tituloLibro = request.getParameter("tituloLibro");
            String autorNombre = request.getParameter("autor_nombre");
            String autorApellido = request.getParameter("autor_apellido");
            String descripAutor = request.getParameter("descripAutor");
            String isbn = request.getParameter("isbn");
            String fechaPublicacion = request.getParameter("fechaPlub");
            String descripLibro = request.getParameter("descripLibro");
            String generoLibro = request.getParameter("generolibro");
            String estadoLibro = request.getParameter("libro");

            // Construir la ruta completa del archivo de imagen
            String rutaCompletaImagen = "ruta/a/tu/" + rutaImagen;

            // Leer la imagen desde el archivo y convertirla a un arreglo de bytes
            File archivoImagen = new File(rutaCompletaImagen);
            byte[] datosImagen = new byte[(int) archivoImagen.length()];
            try (FileInputStream fis = new FileInputStream(archivoImagen)) {
                fis.read(datosImagen);
            }
            // Mostrar los datos antes de la inserción
        %>
        <div>
            out.println("<h2>Datos a subir:</h2>");
            out.println("<label class="estilo_label">Nombre de la imagen: </label>" + nombreImagen);
            out.println("Ruta de la imagen: " + rutaImagen + "<br>");
            out.println("Título del libro: " + tituloLibro + "<br>");
            out.println("Autor: " + autorNombre + " " + autorApellido + "<br>");
            out.println("Descripción del autor: " + descripAutor + "<br>");
            out.println("ISBN: " + isbn + "<br>");
            out.println("Fecha de Publicación: " + fechaPublicacion + "<br>");
            out.println("Descripción del libro: " + descripLibro + "<br>");
            out.println("Género del libro: " + generoLibro + "<br>");
            out.println("Estado del libro: " + estadoLibro + "<br>");
        </div>
        <%

        %>
        <h2>¡Información del nuevo libro subida con éxito!</h2>
        <p><a href='Crear_Libro.jsp'>Volver al formulario</a></p>
    </main>
    <footer>
        <div>
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
        </div>
    </footer>
</body>
</html>
