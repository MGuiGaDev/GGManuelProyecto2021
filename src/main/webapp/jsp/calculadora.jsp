<%-- 
    Document   : calculadora
    Created on : 01-oct-2021, 17:01:16
    Author     : Manuel Guillén Gallardo
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta http-equiv="Content-Type" content ="text/html" charset="utf-8" />
        <title>GESTOR DE SESIONES</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../estilos/estiloVista.css" type="text/css" rel="stylesheet">
        <link href="../estilos/prism.css" rel="stylesheet">
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
                <a href="https://docs.oracle.com/javaee/7/api/toc.htm" class="logo-java" target="_blank"
                   title="Cómo moverte por el sitio"><i class="fas fa-info-circle"></i> </a>
            </nav>
        </header>
        <nav class="menu">
            <a href="../inicio.html">Inicio</a>
            <a href="#">Notas</a>
        </nav>
        <main>
            <div class="titulo-ejercicio">
                <p>Calculadora muy básica</p>
            </div>
            <div class="contenedor">

                <div class="arriba">
                    <%/* Método para sumar dos números enteros */%>
                    <%!
                        public int sumar(int param1, int param2) {
                            return param1 + param2;
                        }
                    %>
                    <%
                        if (request.getParameter("switch") == null) {
                    %>
                    <form method="post" action="calculadora.jsp" class="modulo">
                        <input type="hidden" name="switch" value="true">
                        <label for="param1" >Segundo número: </label>
                        <input id="param1" name="param1" placeholder="Eg. 1"  class="inputUser"></input>
                        <br>
                        <input type="hidden" name="switch" value="true">
                        <label for="param2" >Segundo número: </label>
                        <input id="param2" name="param2" placeholder="Eg. 1"  class="inputUser"></input>
                        <br>
                        <div class="menuBotones">
                            <input type="submit" value="Sumar" class="botonAccion"/>
                            <a href="../inicio.html" class="botonAccion">volver</a>
                        </div>
                    </form>
                </div>

                <%
                } else {
                    try {
                        int param1 = Integer.parseInt(request.getParameter("param1"));
                        int param2 = Integer.parseInt(request.getParameter("param2"));
                        int result = param1 + param2;
                %>
                <div class="valido">
                    <p>El resultado de la suma es: <%= sumar(param1, param2)%></p>
                    <p><%= Calendar.getInstance().getTime()%></p>
                </div><br>
                <a href="../inicio.html" class="botonAccion">volver</a>
                <%
                } catch (NumberFormatException ex) {
                %>
                <div class="valido">
                    <p>Alguno de los números no contenía dígitos válidos...</p>
                    <p><%= Calendar.getInstance().getTime()%></p>


                </div><br>
                <a href="../inicio.html" class="botonAccion">volver</a>
                
                    <%
                        }
                    }
                %>


            </div>

        </main>
        <footer class='footerFix'>
            <div class="info-pag">
                <p>Sitio creado por Manuel Guill&eacute;n Gallardo</p>
                <p>Alumno de DAW 2</p>
                <p>30 / 09 / 2021</p>
            </div>
            <div class="info-pag">
                <p>Asignatura: Desarrollo web en entorno servidor</p>
                <p>Profesor: Jesús García Garijo</p>
                <p>IES Albarregas (Mérida)</p>
            </div>
        </footer>
        <script type="text/javascript" src="../javascript/buscador.js"></script>
        <script type="text/javascript" src="../javascript/prism.js"></script>
    </body>

</html>


