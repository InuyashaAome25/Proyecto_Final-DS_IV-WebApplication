<%--
  Created by IntelliJ IDEA.
  User: mary arosemena
  Date: 12/06/2023
  Time: 11:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error de Registro - Proyecto DS IV</title>
    <link rel="stylesheet" href="../CSS/Plantilla.css">
    <link rel="stylesheet" href="../CSS/EstilosDuplicado.css">
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
            <p>El identificador ya está registrado.</p>
            <!-- Puedes agregar más detalles o personalizar el mensaje según tus necesidades -->
            <p>Redirigiendo al inicio...</p>
        </div>

        <script>
            // Esperar unos segundos y luego redirigir automáticamente al index.jsp
            setTimeout(function() {
                window.location.href = "index.jsp";
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
