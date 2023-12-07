<%--
  Created by IntelliJ IDEA.
  User: mary arosemena
  Date: 12/06/2023
  Time: 11:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registro Exitoso - Proyecto DS IV</title>
    <link rel="stylesheet" href="../CSS/Plantilla.css">
    <link rel="stylesheet" href="../CSS/EstiloExitoso.css">
</head>
<body>
    <header>
        <div>
            <img src="../IMG/Logo.png" alt="logo compañia" class="logo">
            <h1 class="tituloPrincipal">paginas doradas</h1>
        </div>
    </header>
    <nav>

    </nav>
    <main>
        <div>
            <h1>Registro Exitoso</h1>
            <p>Tu registro se ha completado con éxito.</p>
            <p>Redirigiendo al inicio...</p>
        </div>

        <script>
            // Esperar unos segundos y luego redirigir automáticamente al index.jsp
            setTimeout(function() {
                window.location.href = "Inicio.jsp";
            }, 3000); // Redirigir después de 3 segundos (puedes ajustar este valor)
        </script>
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
