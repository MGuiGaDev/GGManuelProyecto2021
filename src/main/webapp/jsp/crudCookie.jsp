<%-- 
    Document   : crudCookie
    Created on : 07-oct-2021, 18:36:21
    Author     : Manuel Guillén Gallardo
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta http-equiv="Content-Type" content ="text/html" charset="utf-8" />
        <title>COOKIES</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../estilos/estiloVista.css" type="text/css" rel="stylesheet">
        <link
            href="https://fonts.googleapis.com/css2?family=Prompt:wght@200&family=Permanent+Marker&display=swap"
            rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="shortcut icon" href="imagenes/favicon.ico" type="image/x-icon">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
              integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
              crossorigin="anonymous">

    </head>

    <body>
        <header>
            <nav class="search">
                <input type="text" placeholder="Eg. Formulario" id="buscador">
                <a href="" class="material-icons" id="boton-buscador">search</a>
            </nav>
            <a href="../inicio.html" class="logo">
                <h1>DweS</h1>
                <p>Desarrollo web en entorno servidor</p>
            </a>
            <nav class="espacio-hub">
                <a href="https://github.com/MGuiGaDev" class="logo-github" target="_blank"
                   title="Repositorio DWES"><i class="fab fa-github"></i></a>
                <a href="https://docs.oracle.com/javaee/7/api/toc.htm" class="logo-java" target="_blank"
                   title="API Java 7 EE"><i class="fab fa-java"></i> </a>
            </nav>
        </header>
        <nav class="menu">
            <a href="#">Inicio</a>
            <a href="#">Notas</a>
        </nav>
        <main>
            <div class="titulo-ejercicio">
                <p>Crud con Cookies</p>
            </div>
            <div class="contenedor izq">
                
            </div>
            <div class="contenedor der">
                <form action="controllerCrudCookies.jsp" method="post" class="modulo">
                    <label for="nombreC" >Nombre de la cookie: </label>
                    <input type="text" id="nombreC" name="nombreC" class="inputUser"></input>
                    <br>
                    <label for="valorC" id="valorC" name="valorC" >Valor de la cookie: </label>
                    <input type="text" id="valorC" name="valorC" class="inputUser"/>
                    <br>
                    <div class="menuBotones">
                        <input type="submit" name="enviar" value="crear"/>
                        <input type="submit" name="enviar" value="visualizar"/>
                        <input type="submit" name="enviar" value="modificar"/>
                        <input type="submit" name="enviar" value="eliminar"/>
                        <input type="submit" name="enviar" value="inicio"/>
                    </div>
                </form>
                <div class="respuesta">
                    <% //${respuesta} %>
                    <%
                        request.setCharacterEncoding("UTF-8");
                        String re = request.getParameter("clave");
                        
                        if(re!=null){
                            out.println(re); 
                        }
                    %>
                </div>
            </div>
        </main>
        <footer>
            <div class="info-pag">
                <p>Sitio creado por Manuel Guill&eacute;n Gallardo</p>
                <p>Alumno de DAW 2</p>
                <p>30 / 09 / 2021</p>
            </div>
        </footer>
        <script type="text/javascript" src="javascript/buscador.js"></script>
    </body>

</html>