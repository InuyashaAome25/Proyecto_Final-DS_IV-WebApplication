<%@ page import="BASE_DE_DATOS.Conexion" %>
<%@ page import="OperacionesLogUser.OperacionCatalogo" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Paginas Doradas S.A - Proyecto - CATALOGO</title>
    <link rel="stylesheet" href="../CSS/estiloCatologoUser.css">
    <link rel="stylesheet" href="../CSS/Plantilla.css">
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
        <li> <a href="../HTML/Inicio.html" id="aInicio">Inicio</a> </li>
        <li> <a href="../HTML/CatalogoUser.html" >Catalogo</a> </li>
        <li> <a href="../HTML/Login.html">Inicio de sesión</a> </li>
        <li> <a href="../HTML/Contactenos.html">Contáctenos</a> </li>
    </ul>
</nav>
<main>
    <%
        String errorMessague = null;
        try {
            String opcionSeleccionada = request.getParameter("avanzado");
            String titulo = request.getParameter("titulo");

            OperacionCatalogo objBusqueda = new OperacionCatalogo();
            objBusqueda.asignar(opcionSeleccionada,titulo);
            

    %>
    <form action="" method="post" id="Caja">
        <div class="cajaBusqueda">
            <div id="seleccion">
                <h3>Buscar</h3>
                <select name="avanzado" class="avanzadoOpc">
                    <option value="catalogo">Catálogo de biblioteca</option>
                    <option value="titulo">Título</option>
                    <option value="autor">Autor</option>
                    <option value="genero">Genero</option>
                </select>
            </div>
            <div id="BotonTex">
                <input type="text"
                       name="Titulo"
                       size="30"
                       maxlength="30"
                       autofocus
                       title="Ingrese un libro a buscar">
            </div>
            <div id="Busqueda">
                <button>Generar Reporte</button>
            </div>
        </div>
    </form>
    <div class="cuadricula">
        <article class="estilo-libro">
            <div class="libros">
                <figure>
                    <img src="../IMG/El_Guayacal.png" alt="libro_cat1">
                </figure>
                <div class="dato-libro">
                    <h2>Bajo la niebla del guayacal</h2>
                    <p class="info-libro">
                        <span>Autor: miguel estevan</span>
                        <span>genero: miedo</span>
                        <span>ISBN:</span>
                    </p>
                    <button>ver descripción del libro</button>
                </div>
            </div>
        </article>

        <article class="estilo-libro">
            <div class="libros">
                <figure>
                    <img src="../IMG/Fuego_Sangre_Tomo_1.png" alt="libro_cat2">
                </figure>
                <div class="dato-libro">
                    <h2>fuego y sangre</h2>
                    <p class="info-libro">
                        <span>Autor: george r.r martin</span>
                        <span>genero: ficcion</span>
                        <span>ISBN:</span>
                    </p>
                    <button>ver descripción del libro</button>
                </div>
            </div>
        </article>

        <article class="estilo-libro">
            <div class="libros">
                <figure>
                    <img src="../IMG/La_reina_roja.png" alt="libro_cat3">
                </figure>
                <div class="dato-libro">
                    <h2>la reina roja</h2>
                    <p class="info-libro">
                        <span>autor: victoria aveyard</span>
                        <span>genero: ficcion</span>
                        <span>ISBN:</span>
                    </p>
                    <button>ver descripción del libro</button>
                </div>
            </div>
        </article>

        <article class="estilo-libro">
            <div class="libros">
                <figure class="estilo_img">
                    <img src="../IMG/IMG-1982.png" alt="libro_cat4">
                </figure>
                <div class="dato-libro">
                    <h2>asesino de brujas</h2>
                    <p class="info-libro">
                        <span>autor: shelby mahurin</span>
                        <span>genero: ficcion</span>
                        <span>ISBN:</span>
                    </p>
                    <button>ver descripción del libro</button>
                </div>
            </div>
        </article>

        <article class="estilo-libro">
            <div class="libros">
                <figure class="estilo_img">
                    <img src="../IMG/IMG-1984.png" alt="libro_cat5">
                </figure>
                <div class="dato-libro">
                    <h2>el principe cruel</h2>
                    <p class="info-libro">
                        <span>autor: holly black</span>
                        <span>genero: accion</span>
                        <span>ISBN:</span>
                    </p>
                    <button>ver descripción del libro</button>
                </div>
            </div>
        </article>

        <article class="estilo-libro">
            <div class="libros">
                <figure class="estilo_img">
                    <img src="../IMG/IMG-1992.png" alt="libro_cat6">
                </figure>
                <div class="dato-libro">
                    <h2>la balanza de nunca jamás</h2>
                    <p class="info-libro">
                        <span>autor: stephanie garber</span>
                        <span>genero: romantico</span>
                        <span>ISBN:</span>
                    </p>
                    <button>ver descripción del libro</button>
                </div>
            </div>
        </article>

        <article class="estilo-libro">
            <div class="libros">
                <figure class="estilo_img">
                    <img src="../IMG/IMG-3429.png" alt="libro_cat7">
                </figure>
                <div class="dato-libro">
                    <h2>de sangre y ceniza</h2>
                    <p class="info-libro">
                        <span>autor: jennifer l. armentrout</span>
                        <span>genero:</span>
                        <span>ISBN:</span>
                    </p>
                    <button>ver descripción del libro</button>
                </div>
            </div>
        </article>
    </div>
    <%
        }catch (Exception e){
            errorMessague = ("Error durante la búsqueda: "+e.getMessage());
        }if (errorMessague != null){
    %>
    <div class="error">
        <%=errorMessague%>;
    </div>
    <%
        }
    %>
</main>

<footer>
    <div>
        <p class="piePag">
            Uzziel Aparicio-
            Cesar Castillo-
            Michael Perez-
            Victor Rodriguez-
            Richard Zhang
        </p>
        <p class="piePag">
            © Copyright 2023 UTP - 1LS122 - Desarrollo de software iv - grupo 1
        </p>
    </div>
</footer>
</body>
</html>
