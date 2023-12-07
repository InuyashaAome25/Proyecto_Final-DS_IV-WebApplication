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
<%@ page import="BASE_DE_DATOS.Conexion" %>
<%@ page import="OperacionesLogAdm.LIbroInsert" %>
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
            String rutaCompletaImagen = "C:/Users/mary arosemena/Documents/UTP-LD/Programas Java IJ/Desarrollo IV - Programas/Multimedia" + rutaImagen;

            // Leer la imagen desde el archivo y convertirla a un arreglo de bytes
            File archivoImagen = new File(rutaCompletaImagen);
            byte[] datosImagen = new byte[(int) archivoImagen.length()];
            try (FileInputStream fis = new FileInputStream(archivoImagen)) {
                fis.read(datosImagen);
            }
            // Mostrar los datos antes de la inserción

            boolean libroExistente = false;
            Conexion obj = new Conexion("sa", "Inuyasha25");
            LIbroInsert libroInsert = new LIbroInsert();
            try {
                obj.establecer_Conexion();
                libroExistente = libroInsert.verificarUsuario(isbn, obj);
            } catch (Exception e) {
                e.printStackTrace();
                // Manejar la excepción según tus necesidades
            }
        %>
        <%
            // Mostrar mensaje si el libro ya existe
            if (libroExistente) {
        %>
        <div class="mensaje-error">
            <p>El libro con el ISBN <%= isbn %> ya existe en la base de datos.</p>
            <p>Por favor, ingresa un ISBN diferente.</p>
        </div>
        <%
        } else {

        %>
        <div>
            out.println("<h2>Datos a subir:</h2>");
            out.println("<label class="estilo_label">Nombre de la imagen: </label> + nombreImagen);
            out.println("<label class="estilo_label">Ruta de la imagen: </label> + rutaImagen);
            out.println("<label class="estilo_label">Título del libro: </label> + tituloLibro);
            out.println("<label class="estilo_label">Autor: </label> + autorNombre + " " + autorApellido);
            out.println("<label class="estilo_label">Descripción del autor: </label> + descripAutor);
            out.println("<label class="estilo_label">ISBN: </label> + isbn);
            out.println("<label class="estilo_label">Fecha de Publicación: </label> + fechaPublicacion);
            out.println("<label class="estilo_label">Descripción del libro: </label> + descripLibro);
            out.println("<label class="estilo_label">Género del libro: </label> + generoLibro);
            out.println("<label class="estilo_label">Estado del libro: </label> + estadoLibro);
        </div>

        <div class="botons">
            <input type="submit" name="guardar" value="Guardar Datos" class="estilo_botones">
        </div>
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