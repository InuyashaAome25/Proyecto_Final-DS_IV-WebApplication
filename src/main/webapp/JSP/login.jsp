<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="BASE_DE_DATOS" %>
<%@ page import="BASE_DE_DATOS.Conexion" %>
<%@ page import="BASE_DE_DATOS.Sesion" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
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
    <li> <a href="Inicio.html" id="aInicio">Inicio</a> </li>
    <li> <a href="CatalogoUser.html" >Catalogo</a> </li>
    <li> <a href="Login.html">Inicio de sesión</a> </li>
    <li> <a href="Contactenos.html">Contáctenos</a> </li>
  </ul>
</nav>
<main>
  <%
    Conexion obj = new Conexion("user", "password");
    obj.establecer_Conexion();
    Sesion obj1 = new Sesion();
  %>
  <%!
    String usuario;
    String contrasena;
  %>
  <%
    usuario = request.getParameter("usuario");
    contrasena = request.getParameter("password");
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
        <h5><a href="Recuperar.html">Olvidaste tu contraseña?</a></h5>
        <input type="submit" name="enviar" value="Iniciar Sesion">
      </div>
    </form>
  </div>
  <%
    } else {
      obj1.setId_usuario(request.getParameter("usuario"));
      obj1.setContraseña(request.getParameter("password"));
      if (obj1.existeUsuario_sesion(obj)) {
        session.setAttribute("nuguardado", usuario);
        response.sendRedirect("Inicio.jsp");
      } else {%>
    Usuario o Contraseña invalida. Intentelo nuevamente.
  <%
        response.sendRedirect("login.jsp");
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