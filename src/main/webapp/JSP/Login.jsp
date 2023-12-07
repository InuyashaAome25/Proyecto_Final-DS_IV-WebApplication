<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="BASE_DE_DATOS.Conexion" %>
<%@ page import="ValidarLogin.Sesion" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html>
<head>
    <title>Paginas Doradas S.A - Proyecto - LOGIN</title>
    <link rel="stylesheet" href="../CSS/Plantilla.css">
    <link rel="stylesheet" href="../CSS/login.css">
</head>
<body>
<header>
    <div>
        <img src="../IMG/Logo.png" alt="Logo" class="logo">
        <h1 class="tituloPrincipal">Paginas Doradas</h1>
    </div>
</header>
<nav>
    <ul class="menu">
        <li> <a href="Login.jsp" id="aInicio">Inicio</a> </li>
        <li> <a href="Login.jsp" >Catalogo</a> </li>
        <li> <a href="Login.jsp">Contáctenos</a> </li>
    </ul>
</nav>
<main>
    <%
        String usuario = request.getParameter("user");
        String contrasena = request.getParameter("password");

        if (usuario == null || contrasena == null) {
    %>
    <div class="login">
        <form method="post">
            <legend>Inicio de Sesión</legend>
            <div class="credenciales">
                <div class="user">
                    <label>nombre de usuario</label>
                    <input type="text" name="user" id="usuario" placeholder="ingrese su Usuario">
                </div>
                <div class="user">
                    <label>Contraseña</label>
                    <input type="password" name="password" id="password" placeholder="ingrese su Password">
                </div>
                <h5><a href="HTML/Recuperar.html">Olvidaste tu contraseña?</a></h5>
                <input type="submit" name="enviar" value="Iniciar Sesion">
            </div>
        </form>
    </div>
    <%
    } else {
        try {
            Conexion obj = new Conexion("sa", "Inuyasha25");
            Sesion obj1 = new Sesion();
            boolean esUsuarioComun = obj1.validarLoginUser(usuario, contrasena);
            boolean esPersonal = obj1.validarPersonal(usuario, contrasena);

            if (esUsuarioComun) {
                session.setAttribute("usuarioguardado", usuario);
    %>
    <%
        response.sendRedirect("Inicio.jsp");
    } else if (esPersonal) {
        session.setAttribute("usuarioguardado", usuario);
    %>
    <%
        response.sendRedirect("Bibliotecario.jsp");
    } else {
    %>
    <h1>Usuario o Contraseña incorrecta. Inténtelo nuevamente.</h1>
    <%
                    response.sendRedirect("Registrar.jsp");
                }
            } catch (SQLException e) {
                throw new RuntimeException("Error de SQL al procesar la autenticación.", e);
            } catch (Exception e) {
                e.printStackTrace();
                throw new RuntimeException("Error al procesar la autenticación.", e);
            }
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
</html>