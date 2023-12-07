<%--
  Created by IntelliJ IDEA.
  User: mary arosemena
  Date: 12/06/2023
  Time: 11:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error de Registro - Proyecto DS IV</title>
    <link rel="stylesheet" href="../CSS/Plantilla.css">
    <link rel="stylesheet" href="../CSS/EstiloError.css">
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
            <h1>Error de Registro</h1>
            <p>Hubo un problema al procesar tu registro.</p>
            <p>Por favor, inténtalo nuevamente más tarde.</p>
            <p>Redirigiendo al inicio...</p>
        </div>

        <script>
            // Esperar unos segundos y luego redirigir automáticamente al index.jsp
            setTimeout(function() {
                window.location.href = "Registrar.jsp";
            }, 7000); // Redirigir después de 3 segundos (puedes ajustar este valor)
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
