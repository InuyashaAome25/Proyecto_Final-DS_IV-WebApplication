<%@ page import="OperacionesLogAdm.Devoluciones" %>
<%@ page import="BASE_DE_DATOS.Prestamos" %>
<%@ page import="BASE_DE_DATOS.Conexion" %>
<%@ page import="java.sql.Connection" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Paginas Doradas S.A - Proyecto - DEVOLUCIONES</title>
    <link rel="stylesheet" href="../CSS/PlantillaBibliotecario.css">
    <link rel="stylesheet" href="../CSS/estiloDevolucion.css">
    <link rel="stylesheet" href="../CSS/EstiloCrear.css">
</head>
<body>
<header>
    <div>
        <img src="../IMG/Logo.png" class="logo">
        <div>
            <h1 CLASS="tituloPrincipal">Paginas Doradas</h1>
        </div>
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
        Conexion obj = new Conexion("sa","Inuyasha25");
        obj.establecer_Conexion();
    %>
    <%
        String devolucionExitosMessage = (String) request.getSession().getAttribute("devolucionExitosa");
        request.getSession().removeAttribute("devolucionExitosa");
    %>
    <% if (devolucionExitosMessage != null){ %>
    <div class="exito">
        <%=devolucionExitosMessage%>
    </div>
    <%
        }
    %>
    <%
        String errorMessage = null;
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String title = request.getParameter("Title");
            String nombre = request.getParameter("Nombre");
            String fechaPrestamo = request.getParameter("fechaPrestamo");
            String fechaDevolucion = request.getParameter("fechaDevolucion");
            String revision = request.getParameter("revision");

            Devoluciones objDevolucion = new Devoluciones();
            objDevolucion.asignar(id,title,nombre,fechaDevolucion,fechaPrestamo,revision);

            int resultadoDevolucion = objDevolucion.devoluciones(obj,id);
            if(resultadoDevolucion > 0){
                request.getSession().setAttribute("devolucionExitosa","Devolución realizada con éxito");
            }
    %>
    <div id="formulario">
        <form action="" method="post" accept-charset="UTF-8">
            <fieldset class="estilo_formulario">
                <legend id="tituloDev">Devoluciones</legend>
                <div class="casilla">
                    <label class="devLabel">ID de préstamo:</label>
                    <input type="number"
                           name="id"
                           size="20"
                           maxlength="20"
                           required
                           placeholder="Identifiador del prestamo"
                           title="Ingrese el ID del prestamo">
                    <label class="devLabel">Titulo:</label>
                    <input type="text"
                           name="Title"
                           size="20"
                           maxlength="20"
                           title="Ingrese Titulo del libro">
                    <label class="devLabel">Nombres Prestatario:</label>
                    <input type="text"
                           name="Nombre"
                           size="20"
                           maxlength="20"
                           title="Ingrese Nombre del Prestatario">
                    <label class="devLabel">Fecha Préstamo:</label>
                    <input type="date"
                           name="fechaPrestamo"
                           required
                           title="Fecha de inicio del prestamos">
                    <label class="devLabel">Fecha Devolución:</label>
                    <input type="date"
                           name="fechaDevolucion"
                           required
                           title="Fecha de regreso del libro">
                </div>
                <h3>Estado</h3>
                <div class="casilla2">
                    <input type="radio" name="revision" value="bueno" checked id="buenEst">
                    <label for="buenEst">En Buen Estado</label>
                    <input type="radio" name="revision" value="dañado" id="reparar">
                    <label for="reparar">Dañado</label>
                    <input type="radio" name="revision" value="perdido" id="perdido">
                    <label for="perdido">Perdido</label>
                </div>
                <div id="enviar-button">
                    <input type="submit" value="Enviar" class="boton">
                </div>
            </fieldset>
        </form>
    </div>

    <div class="salida">
        <fieldset>
            <h2> <%=devolucionExitosMessage%></h2>
        </fieldset>
    </div>
    <%
        }catch (IllegalArgumentException e){
            errorMessage = "Error: Faltan parámetros. Por favor, complete el formulario correctamente.";
        }if (errorMessage != null){
    %>
    <div class="error">
        <%=errorMessage%>;
    </div>
    <%
        }
    %>
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
            © Copyright 2023 UTP - 1LS122 - Desarrollo de software iv  - grupo 1
        </p>
    </div>
</footer>
</body>
</html>
