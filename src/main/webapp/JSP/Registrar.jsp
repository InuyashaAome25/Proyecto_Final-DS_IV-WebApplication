<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="OperacionesLogUser.EjecucionesUser" %>
<%@ page import="BASE_DE_DATOS.Conexion" %>
<head>
    <meta charset="UTF-8">
    <title>Paginas Doradas S.A - Proyecto -  REGISTRAR</title>
    <link rel="stylesheet" href="../CSS/Plantilla.css">
    <link rel="stylesheet" href="../CSS/registrar.css">
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
            <li> <a href="#" id="aInicio">Inicio</a> </li>
            <li> <a href="#" >Catalogo</a> </li>
            <li> <a href="#">Inicio de sesión</a> </li>
            <li> <a href="#">Contáctenos</a> </li>
        </ul>
    </nav>
    <main>
        <div class="registrar">
            <form method="post" class="formularioRegistrar">
                <legend>Unete a la familia</legend>
                <div class="documento">
                    <h4>elije tipo de documento</h4>
                    <input type="radio" name="indentificacion" value="documentoId" checked id="documentoId">
                    <label for="documentoId">cedula</label>
                    <input type="radio" name="indentificacion" value="documentoP" id="documentoP">
                    <label for="documentoP">pasaporte</label>
                </div>
                <div class="credenciales">
                    <h4>documento de identificación</h4>
                    <input type="text" name="identificador" maxlength="16" required>
                    <h4>Nombre</h4>
                    <input type="text" name="nombre" maxlength="20" required>
                    <h4>apellido</h4>
                    <input type="text" name="apellido" maxlength="20" required>
                    <h4>dirección</h4>
                    <input type="text" name="distrito" maxlength="25" required
                           placeholder="Ingrese su distrito">
                    <input type="text" name="corregimiento" maxlength="25" required placeholder="Ingrese su corregimiento">
                    <input type="text" name="calle" maxlength="25" required placeholder="Ingrese su calle">
                    <input type="text" name="casa" maxlength="15" required placeholder="Ingrese su numero de casa">
                    <h4>Teléfono</h4>
                    <input type="tel" name="telefonoU" pattern="[0-9]{8}" required placeholder="Ingrese su número de teléfono">
                    <h4>correo electronico</h4>
                    <input type="email" name="correo" class="correo" maxlength="30" required>
                    <h4>confirmación de correo electronico</h4>
                    <input type="email" name="correoVeri" class="password" maxlength="30" required>
                    <h4>nombre de usuario</h4>
                    <input type="text" name="user" maxlength="30" required>
                    <h4>contraseña</h4>
                    <input type="password" name="password" class="password" maxlength="15" required>
                    <h4>confirmar contraseña</h4>
                    <input type="password" name="passwordVeri" class="password" maxlength="15" required>
                    <div id="enviarR">
                        <input type="submit" name="enviar" id="registrar" value="Registrar">
                    </div>
                    <h5>¿Ya tienes una cuenta? <a href="index.jsp">Inicia sesion</a></h5>
                </div>
            </form>
            <!-- Lógica de registro directamente en el JSP -->
        <%
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                // Obtener parámetros del formulario
                String identificador = request.getParameter("identificador");
                String nombre = request.getParameter("nombre");
                String apellido = request.getParameter("apellido");
                String distrito = request.getParameter("distrito");
                String corregimiento = request.getParameter("corregimiento");
                String calle = request.getParameter("calle");
                String casa = request.getParameter("casa");
                String telefono = request.getParameter("telefonoU");
                String correo = request.getParameter("correo");
                String userName = request.getParameter("user");
                String passwordUser = request.getParameter("password");

                // Validaciones y lógica de registro en la base de datos
                // Validar el identificador utilizando la clase EjecucionesUser
                Conexion conexionBD = new Conexion("sa", "Inuyasha25");
                EjecucionesUser ejecucionesUser = new EjecucionesUser();

                try {
                    boolean identificadorValido = !ejecucionesUser.verificarUsuario(identificador, conexionBD);

                    if (identificadorValido) {
                        // Continuar con el proceso de registro
                        int idDireccionU = ejecucionesUser.insertarDireccion(distrito,corregimiento,calle,casa,conexionBD);
                        ejecucionesUser.insertarUsuario(identificador,nombre,apellido,userName,passwordUser,idDireccionU,conexionBD);
                        ejecucionesUser.insertarTelefono(Integer.parseInt(telefono),identificador,conexionBD);
                        ejecucionesUser.insertarCorreo(correo,identificador,conexionBD);

                        // Redirigir a una página de éxito
                        response.sendRedirect("registroExitoso.jsp");
                    } else {
                        // Redirigir a una página de error por identificador duplicado
                        response.sendRedirect("errorRegistroDuplicado.jsp");
                    }
                } catch (Exception e) {
                    // Manejar la excepción (puede ser un problema al verificar el identificador)
                    e.printStackTrace();
                    // Redirigir a una página de error
                    response.sendRedirect("errorRegistro.jsp");
                }
            }
        %>
        </div>
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