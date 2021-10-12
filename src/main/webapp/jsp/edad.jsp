<%-- 
    Document   : edad.jsp
    Created on : 05-oct-2021, 0:24:56
    Author     : Manuel Guillén Gallardo
--%>

<%@page import="java.util.Date"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Calendar"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8" %>
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
                <p>Calculando edad</p>
            </div>
            <div class="contenedor">
                <%/* Método para calcular edad */%>
                <%!
                    public String responderEdad(String nombre, String edad) {

                        String[] fechaNac = edad.split("-");
                        StringBuilder mensaje = new StringBuilder();
                        mensaje.append("<h2>!Hola, " + nombre + "!</h2><h3>Tienes: </h3>");
                        int[] totalEdad = new int[3];
                        Calendar fechaActual = Calendar.getInstance();

                        totalEdad[0] = fechaActual.get(Calendar.YEAR) - Integer.parseInt(fechaNac[0]);
                        mensaje = totalEdad[0] >= 1 ? configurarMensajePluralAnnio(totalEdad[0], mensaje) : mensaje;

                        totalEdad[1] = fechaActual.get(Calendar.MONTH) - Integer.parseInt(fechaNac[1]);
                        mensaje = totalEdad[1] >= 1 ? configurarMensajePluralMes(totalEdad[1], mensaje) : mensaje;

                        totalEdad[2] = fechaActual.get(Calendar.DAY_OF_MONTH) - Integer.parseInt(fechaNac[2]);
                        mensaje = totalEdad[2] >= 1 ? configurarMensajePluralDia(totalEdad[2], mensaje) : mensaje;

                        String mensajeFin = mensaje.toString();
                        return mensajeFin;

                    }

                    public StringBuilder configurarMensajePluralAnnio(int cantidad, StringBuilder mensaje) {
                        mensaje = cantidad > 1 ? mensaje.append("<li>" + cantidad + " años</li>") : mensaje.append("<li>" + cantidad + " año</li>");
                        return mensaje;
                    }

                    public StringBuilder configurarMensajePluralMes(int cantidad, StringBuilder mensaje) {
                        mensaje = cantidad > 1 ? mensaje.append("<li>" + cantidad + " meses</li>") : mensaje.append("<li>" + cantidad + " mes </li>");
                        return mensaje;
                    }

                    public StringBuilder configurarMensajePluralDia(int cantidad, StringBuilder mensaje) {
                        mensaje = cantidad > 1 ? mensaje.append("<li>" + cantidad + " días</li>") : mensaje.append("<li>" + cantidad + " día</li>");
                        return mensaje;
                    }

                %>
                <%
                    if (request.getParameter("switch") == null) {
                %>

                <form method="post" action="edad.jsp" class="modulo">
                    <input type="hidden" name="switch" value="true">
                    <p>Introduce tu nombre:</p>
                    <input name="param1" class="inputUser"><br>
                    <p>Sexo:</p>
                    <div>
                        <input type="radio" id="hombre" name="param1" value="hombre" checked="checked" class="inputUser"> Hombre
                        <input type="radio" id="mujer" name="param2" value="mujer" class="inputUser"> Mujer
                    </div><br>
                    <p>Introduce tu fecha de nacimiento:</p>
                    <input type="date" id="fecha" name="param2" class="inputUser">
                    <br>
                    <input type="submit" value="Enviar" class="botonAccion">
                </form>
                <%
                } else {
                    try {
                        String nombre = request.getParameter("param1");
                        String edad = request.getParameter("param2");
                %>
                <div class="valido">
                    <%= "<p>" + responderEdad(nombre, edad) + "</p>" %>
                    <%
                    } catch (NumberFormatException ex) {
                    %>
                    <p>Debe completar todos los campos correctamente...</p>
                    <%
                        }
                    %>

                    
                </div>
                    <br>
                    <a href="edad.jsp" class="botonAccion">volver</a>
                <%
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
