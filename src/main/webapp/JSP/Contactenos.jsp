<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Paginas Doradas S.A - Proyecto - CONTÁCTENOS</title>
    <link rel="stylesheet" href="../CSS/Plantilla.css">
    <link rel="stylesheet" href="../CSS/EstiloContactenos.css">
</head>
<body>
    <header>
        <div>
            <img src="../IMG/Logo.png" alt="logo compañia" class="logo">
            <h1 class="tituloPrincipal">paginas doradas</h1>
        </div>
    </header>
    <nav>
        <ul class="menu">
            <li> <a href="../JSP/Inicio.jsp" id="aInicio">Inicio</a> </li>
            <li> <a href="../JSP/CatalogoUser.jsp" >Catalogo</a> </li>
            <li> <a href="../JSP/login.jsp">Inicio de sesión</a> </li>
            <li> <a href="../JSP/Contactenos.jsp">Contáctenos</a> </li>
        </ul>
    </nav>
    <main>
        <h2>Contáctenos</h2>
        <div class="ubicacion">
            <h4>ubicación</h4>
            <img src="../IMG/mapa.png" alt="Ubicacion Local" class="tamañoC">
            <p>
                via brazil, vía brazil, panamá
            </p>
        </div>
        <div class="telefono">
            <h4>teléfonos</h4>
            <img src="../IMG/telefono-inteligente.png" alt="telefono compañia" class="tamañoC">
            <p>
                +507 456-8756
            </p>
            <p>
                +507 6745-1044
            </p>
        </div>
        <div class="email">
            <h4>email</h4>
            <img src="../IMG/email.png" alt="email compañia" class="tamañoC">
            <p>
                paginas.doradas@gmail.com
                doradas.info@hotmail.com
            </p>
        </div>
        <div class="horario">
            <h4>nuestro horario</h4>
            <img src="../IMG/horario-de-trabajo.png" alt="horario compañia" class="tamañoC">
            <p>
                horario: lun - sáb 9:00 a.m - 6:00 p.m
                domingo: 10:30 a.m - 5:00 p.m
            </p>
        </div>
        <div class="mapa">
            <h4>Mapa</h4>
            <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3940.8272677854643!2d-79.515433!3d8.988037!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8faca90275c4efc7%3A0x632b398b17ae85d9!2sP.H.%20Metric!5e0!3m2!1ses-419!2sus!4v1699864358210!5m2!1ses-419!2sus"
                    allowfullscreen=""
                    loading="lazy"
                    referrerpolicy="no-referrer-when-downgrade">
            </iframe>
        </div>
        <div id="contenedorForm">
            <form method="post">
                <fieldset class="formContate">
                    <legend>Estamos Aquí para Escucharte</legend>
                    <label for="nombre">nombre:</label>
                    <input type="text" name="nombreSoli" size="20" maxlength="25" placeholder="Su nombre y apellido" id="nombre" class="inputC">
                    <label for="direccion">dirección:</label>
                    <input type="text" name="nombreSoli" size="20" maxlength="35" placeholder="Su dirrección" id="direccion" class="inputC">
                    <label for="correo">correo electronico:</label>
                    <input type="text" name="nombreSoli" size="20" maxlength="35" placeholder="Su email" id="correo" class="inputC">
                    <label for="mensaje">escriba su mensaje</label>
                    <textarea name="comentario" id="mensaje" placeholder="Aquí escriba su mensaje"></textarea>
                    <input type="submit" name="enviarinfo" value="Enviar" id="subir">
                </fieldset>
            </form>
        </div>
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