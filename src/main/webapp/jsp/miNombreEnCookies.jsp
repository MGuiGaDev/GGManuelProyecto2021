<%@page import="java.net.URLDecoder" %>
<%@page import="java.net.URLEncoder" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">

    <head>
        <title>INICIO</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../estilos/estiloOtros.css" type="text/css" rel="stylesheet">
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
            <a href="inicio.html" class="logo">
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
            <div class="contenedor izq">

            </div>
            <div class="contenedor der">

                <% if (request.getParameter("switch") == null) { %>


                <form action="miNombreEnCookies.jsp" method="post">

                    <h1> No tenemos info </h1>
                    <input type="hidden" name="switch" value="true">
                    <h1> </h1>
                    <button type="submit" name="recargar" value="true">Recargar</button>


                    <input type="submit" name="enviar" value="Enviar" />

                </form>
                <% } else {
                    Cookie p = new Cookie("o", URLEncoder.encode("HOla tio", "UTF-8"));
                    p.setMaxAge(3600);
                    response.addCookie(p);
                    String resultado = p.getName() + ": "
                                        + URLDecoder.decode(p.getValue(), "UTF-8");%>
                <p>
                    <%= resultado%>
                </p>
                <% }%>
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