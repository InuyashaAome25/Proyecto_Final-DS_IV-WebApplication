<%@ page import="BASE_DE_DATOS.Conexion" %>
<%@ page import="OperacionesLogAdm.EjecucionesAdm" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Paginas Doradas S.A - Proyecto - AVISAR</title>
    <link rel="stylesheet" type="text/css" href="../CSS/PlantillaBibliotecario.css">
    <link rel="stylesheet" type="text/css" href="../CSS/Estilo-Aviso.css">
</head>
<body>
<header>
    <div>
        <img src="../IMG/Logo.png" class="logo">
        <h1 class="tituloPrincipal">Paginas Doradas</h1>
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
        String errorMessague = null;

        try {
            Conexion obj = new Conexion("sa", "Inuyasha25");
            obj.establecer_Conexion();

            String id_Usuario = request.getParameter("id_Usuario");
            String correo = request.getParameter("correo");
            String asunto = request.getParameter("asunto");
            String mensaje = request.getParameter("mensaje");

            EjecucionesAdm objCorreo = new EjecucionesAdm();
            objCorreo.enviarNotificacion(id_Usuario,correo,asunto,mensaje);

        }catch (Exception e){
            errorMessague = "Error durante el envio "+e.getMessage();
        }
    %>
    <%
        String correoEnviadoMessage = (String) request.getSession().getAttribute("Correo Enviado");
        request.getSession().removeAttribute("Correo Enviado");
    %>
    <% if (correoEnviadoMessage != null){ %>
    <div class="exito">
        <%=correoEnviadoMessage%>
    </div>
    <%
        }
    %>
    <form method="get" >
        <fieldset id="estilo_formulario">
            <legend id="avisar_legend"> Aviso </legend>
            <label class="label_avisar">ID del Usuario:</label>
            <input  type="text"
                    name="id_Usuario"
                    required
                    size="35"
                    lass="input_avisar"
                    class="input_avisar"
                    placeholder="Coloque la cedula del usuario">
            <label class="label_avisar">Correo Electrónico:</label>
            <input name="correo"
                   type="email"
                   placeholder="usuario@dominio.com"
                   size="40"
                   title="Escribe tu correo electrónico..."
                   required
                   class="input_avisar">
            <label class="label_avisar">Asunto del aviso:</label>
            <input name="asunto"
                   type="text"
                   size="35"
                   required
                   class="input_avisar"
                   placeholder="diga el asunto del correo">
            <div id="tamaño_mensaje">
                <h4>Mensaje del aviso:</h4>
                <textarea name="mensaje" rows="7" cols="45" requerided id="estilo_area"> </textarea>
            </div>
        </fieldset>
        <div id="divInput">
            <input type="submit" name="submit"
                   value="Enviar los datos" id="estilo_input">
        </div>
    </form>
    <div class="salida">
        <fieldset>
            <h2> <%=correoEnviadoMessage%></h2>
        </fieldset>
    </div>
    <%
        if (errorMessague != null) {
    %>
    <div class="error">
        <%=errorMessague%>
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
            Richard Zhang -
        </p>
        <p class="piePag">
            © Copyright 2023 UTP - 1LS122 - Desarrollo de software iv - grupo 1
        </p>
    </div>
</footer>
</body>