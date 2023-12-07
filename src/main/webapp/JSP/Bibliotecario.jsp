<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html; charset=UTF-8"%>
<head>
    <meta charset="UTF-8">
    <title>Paginas Doradas S.A - Proyecto - INICIO</title>
    <link rel="stylesheet" type="text/css" href="../CSS/PlantillaBibliotecario.css">
    <link rel="stylesheet" href="../CSS/EstiloBiblio.css">
    <link rel="stylesheet" href="../CSS/EstiloInicio.css">
</head>
<body>
     <header>
         <div >
             <img src="../IMG/Logo.png" class="logo">
             <h1 class="tituloPrincipal">Paginas Doradas</h1>
         </div>
     </header>
     <nav>
         <ul class="menu">
             <li> <a href="Bibliotecario.html" id="aInicio">Inicio</a> </li>
             <li> <a href="CatalogoBibliotecario.html" >Catalogo</a> </li>
             <li> <a href="Crear_Libro.html">registro</a>
                 <ul class="submenu">
                     <li><a href="prestamosBibliotecario.html">Prestamos</a></li>
                     <li><a href="devoluciones.html">Devoluciones</a></li>
                 </ul>
             </li>
             <li> <a href="Informenes.html">informenes</a></li>
             <li> <a href="Avisar.html">avisar</a></li>
             <li> <a href="Logout.jsp">Cerrar sesión</a> </li>
         </ul>
     </nav>
      <main>
          <div class="tamañoDiv">
              <p id="parrafoCita">
                  "Mientras el corazón late, mientras el cuerpo y alma siguen juntos, no puedo admitir que cualquier criatura
                  dotada de voluntad tiene necesidad de perder la esperanza en la vida."
              </p>
              <h4 class="cita">Viaje al centro de la tierra, Julio verne</h4>
          </div>
          <div id="conteItemsCarrusel"> <!-Aquí se estará poniendo un carousel de fotos -->
              <div class="container">
                  <input type="radio" name="slider" id="item-1" checked>
                  <input type="radio" name="slider" id="item-2">
                  <input type="radio" name="slider" id="item-3">
                  <input type="radio" name="slider" id="item-4">
                  <input type="radio" name="slider" id="item-5">
                  <input type="radio" name="slider" id="item-6">
                  <input type="radio" name="slider" id="item-7">
                  <input type="radio" name="slider" id="item-8">
                  <input type="radio" name="slider" id="item-9">
                  <input type="radio" name="slider" id="item-10">

                  <div class="cardsIMG">
                      <label class="card" for="item-1" id="selector-1">
                          <img src="../IMG/Fuego_Sangre_Tomo_1.png" alt="Fuego Y Sangre">
                      </label>
                      <label class="card" for="item-2" id="selector-2">
                          <img src="../IMG/La_reina_roja.png" alt="La Reina Roja">
                      </label>
                      <label class="card" for="item-3" id="selector-3">
                          <img src="../IMG/Viaje_Centro_Julio.png" alt="Viaje Al Centro De La Tierra">
                      </label>
                      <label class="card" for="item-4" id="selector-4">
                          <img src="../IMG/IMG-4.png" alt="Asesino De Brujas - Dioses Y Monstruos">
                      </label>
                      <label class="card" for="item-5" id="selector-5">
                          <img src="../IMG/IMG-5.png" alt="El Principe Cruel">
                      </label>
                      <label class="card" for="item-6" id="selector-6">
                          <img src="../IMG/IMG-6.png" alt="Asesino De Brujas - La Bruja Blanca">
                      </label>
                      <label class="card" for="item-7" id="selector-7">
                          <img src="../IMG/IMG-7.png" alt="La Balada De Nunca Jamas">
                      </label>
                      <label class="card" for="item-8" id="selector-8">
                          <img src="../IMG/IMG-8.png" alt="De Sangre Y Cenizas">
                      </label>
                      <label class="card" for="item-9" id="selector-9">
                          <img src="../IMG/IMG-9.png" alt="Un Reino De Carne Y Fuego">
                      </label>
                      <label class="card" for="item-10" id="selector-10">
                          <img src="../IMG/IMG-10.png" alt="Asesino De Brujas - Los Hijos Del Rey">
                      </label>
                  </div>
              </div>
          </div>
          <article>
              <h3 class="articuloT">La lectura y su importancia en la adolescencia</h3>
              <p id="textoArt">
                  Actualmente con las nuevas tecnología de información y comunicación nos facilitan a través de varios programas
                  hacer varias tipos de lectura, pero desafortunadamente existen jóvenes que en lugar de aprovechar estas lecturas
                  que para su edad les parece aburrida y poco provechosa, los adolescentes solo usan las nuevas tecnologías para
                  juegos que en ocasiones bloquean sus pensamientos y por lo tantos los conocimientos.

                  Para más informacion de este articulo la referencia esta en nuestra area de articulo sobre lectura
              </p>
              <p class="cita">Ref. Universidad Autónoma del estado de hidalgo</p>
          </article>
      </main>
      <aside>
          <h4 id="tituloAsideBlio">Artículos referente a la letura</h4>
          <div class="divAside">
              <h4 class="textTila">Autora: Marisela vital carrillo</h4>
              <a href="https://www.uaeh.edu.mx/scige/boletin/prepa4/n10/e5.html" class="linkAside">
                  La lectura y su importancia en la adolescencia</a>
              <h4 class="textTila">Universidad Autónoma del estado de hidalgo</h4>
          </div>
          <div class="divAside">
              <h4 class="textTila">Autor: juan pablo perez mendez</h4>
              <a href="https://blog.up.edu.mx/prepaup/femenil/la-importancia-de-la-lectura-en-las-adolescentes" class="linkAside">
                  La importancia de la lectura en los adolescentes</a>
              <h4 class="textTila">preparatoria panamericana</h4>
          </div>
      </aside>
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