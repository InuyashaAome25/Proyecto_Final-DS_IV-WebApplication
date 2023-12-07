<%@ page import="OperacionesLogAdm.BusqueCatalogo"%>
<%@ page import="BASE_DE_DATOS.*" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="java.util.Base64" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Paginas Doradas S.A - Proyecto - CATALOGO</title>
    <link rel="stylesheet" href="../CSS/PlantillaBibliotecario.css">
    <link rel="stylesheet" href="../CSS/EstiloCatalogo.css">
    <link rel="stylesheet" href="../CSS/estiloCatologoUser.css">

</head>
<body>
<header>
    <div>
        <img src="../IMG/Logo.png" class="logo">
        <div>
            <h1 class="tituloPrincipal">Paginas Doradas</h1>
        </div>
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
        LinkedList<Libros> libros = null;
        String errorMessague = null;

        try {
            Conexion obj = new Conexion("sa", "Inuyasha25");
            obj.establecer_Conexion();

            String catalogo = request.getParameter("catalogo");
            String genero = request.getParameter("genero");
            String titulo = request.getParameter("titulo");
            String autor = request.getParameter("autor");

            BusqueCatalogo objBusqueda = new BusqueCatalogo();
            objBusqueda.asignar(catalogo, genero, titulo, autor);

            libros = objBusqueda.consultarCatalogo(obj);
        }catch (Exception e){
            errorMessague = "Error durante la busqueda: "+e.getMessage();
        }
    %>
    <form action="CatalogoBibliotecario.jsp" method="post" id="cajaBlio">
        <div class="cajaBusqueda-blio">
            <div id="seleccion-blio">
                <h3>Buscar</h3>
                <select name="avanzado" class="avanzadoOpc">
                    <option value="catalogo">Catálogo de biblioteca</option>
                    <option value="titulo">Título</option>
                    <option value="autor">Autor</option>
                    <option value="genero">Genero</option>
                </select>
            </div>
            <div id="BotonTexto">
                <input type="text"
                       name="Titulo"
                       size="30"
                       maxlength="30"
                       autofocus
                       title="Ingrese un libro a buscar">
            </div>
            <div id="Busqueda-blio">
                <button>Generar Reporte</button>
            </div>
        </div>
    </form>
    <%
        if (errorMessague != null) {
    %>
    <div class="error">
        <%=errorMessague%>
    </div>
    <%
    }else { %>
    <div class="cuadricula">
        <% for (Libros libro : libros){ %>
        <article class="estilo-libro">
            <div class="libros">
                <figure>
                    <img src="<%= "data:image/jpeg;base64," + Base64.getEncoder().encodeToString() %>" alt="<%= libro.getTitulo() %>">
                </figure>
                <div class="dato-libro">
                    <h2><%= libro.getTitulo() %></h2>
                    <p class="info-libro">
                        <span>Autor: <%= libro.getDescripcion() %></span>
                        <span>Género: <%= libro.getGenero() %></span>
                        <span>ISBN: <%= libro.getISBN() %></span>
                    </p>
                    <button>Ver descripción del libro</button>
                </div>
            </div>
        </article>
        <%
            }
        %>
    </div>
    <%
        }
    %>
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
                            <span>ID:</span>
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
                            <span>ID:</span>
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
                            <span>ID:</span>
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
                            <span>ID:</span>
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
                            <span>ID:</span>
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
                            <span>ID:</span>
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
                            <span>ID:</span>
                        </p>
                        <button>ver descripción del libro</button>
                    </div>
                </div>
            </article>
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