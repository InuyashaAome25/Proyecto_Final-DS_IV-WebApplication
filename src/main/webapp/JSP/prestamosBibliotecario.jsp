<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Paginas Doradas S.A - Proyecto - PRESTAMOS</title>
    <link rel="stylesheet" href="../CSS/PlantillaBibliotecario.css">
    <link rel="stylesheet" href="../CSS/prestamosBibliotecario.css">
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
        <div class="prestamosBibliotecario">
            <form>
                <legend>Registrar Prestamos</legend>
                <div class="info">
                    <div class="acomodo">
                        <label for="idLibro">ISBN del Libro:</label>
                        <input type="number" required id="idLibro">
                    </div>
                    <div class="acomodo">
                        <label for="nombrePrestario">Nombre del Prestario:</label>
                        <input type="text" required id="nombrePrestario">
                    </div>
                    <div class="acomodo">
                        <label for="fechaPrestamo">Fecha de Prestamo:</label>
                        <input type="date" required id="fechaPrestamo">
                    </div>
                    <div class="acomodo">
                        <label for="fechaDevolucion">Fecha de Devolucion:</label>
                        <input type="date" required id="fechaDevolucion">
                    </div>
                    <input type="submit" class="enviar" value="Registrar">
                </div>
            </form>
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
                © Copyright 2023 UTP - 1LS122 - Desarrollo de software iv  - grupo 1
            </p>
        </div>
    </footer>
</body>
</html>