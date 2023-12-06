<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Paginas Doradas S.A - Proyecto - AVISAR</title>
    <link rel="stylesheet" type="text/css" href="../CSS/PlantillaBibliotecario.css">
    <link rel="stylesheet" type="text/css" href="../CSS/Estilo-Aviso.css">
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
              <li> <a href="Login.html">Inicio de sesión</a> </li>
          </ul>
      </nav>
      <main>
           <form action="" method="get" >
               <fieldset id="estilo_formulario">
                   <legend id="avisar_legend"> Aviso </legend>
                   <label class="label_avisar">ID del Usuario:</label>
                       <input  type="text"
                               name="id_Usuario"
                               requerided
                               size="35"
                               lass="input_avisar"
                               class="input_avisar"
                               placeholder="Coloque la cedula del usuario">
                   <label class="label_avisar">Correo Electrónico:</label>
                       <input name="correo"
                              type="email"
                              placeholder="usuario@dominio.com"
                              size="40"
                              title="Escribe tu correo electrónico..."
                              required
                              class="input_avisar">
                   <label class="label_avisar">Asunto del aviso:</label>
                       <input name="asunto"
                              type="text"
                              size="35"
                              required
                              class="input_avisar"
                              placeholder="diga el asunto del correo">
                   <div id="tamaño_mensaje">
                       <h4>Mensaje del aviso:</h4>
                       <textarea name="mensaje" rows="7" cols="45" requerided id="estilo_area"> </textarea>
                   </div>
               </fieldset>
               <div id="divInput">
                   <input type="submit" name="submit"
                          value="Enviar los datos" id="estilo_input">
               </div>
           </form>
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