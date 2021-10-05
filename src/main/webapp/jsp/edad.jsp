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
<html>
    <head>
        <title>EDAD</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../estilos/estiloJSPEdad.css" type="text/css" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
    </head>
    <body>
        <header>
            <h1><a href="../inicio.html">DWES</a></h1>
            <a href="https://github.com/MGuiGaDev" class="logo-github" target="_blank"><img
                    src="../imagenes/github.png" /></a>
        </header>
        <main>
            <%/* Método para calcular edad */%>
            <%!
                public String responderEdad(String nombre, String edad) {

                    String[] fechaNac = edad.split("-");
                    StringBuilder mensaje = new StringBuilder();
                    mensaje.append("<h2>!Hola, " + nombre + "!</h2><br><h3>Tienes: </h3><br>");
                    int[] totalEdad = new int[3];
                    Calendar fechaActual = Calendar.getInstance();

                    totalEdad[0] = fechaActual.get(Calendar.YEAR) - Integer.parseInt(fechaNac[0]);
                    mensaje = totalEdad[0]>=1? configurarMensajePluralAnnio(totalEdad[0], mensaje) : mensaje;

                    totalEdad[1] = fechaActual.get(Calendar.MONTH) - Integer.parseInt(fechaNac[1]);
                    mensaje = totalEdad[1]>=1?  configurarMensajePluralMes(totalEdad[1], mensaje) : mensaje;

                    totalEdad[2] = fechaActual.get(Calendar.DAY_OF_MONTH) - Integer.parseInt(fechaNac[2]);
                    mensaje = totalEdad[2]>=1?  configurarMensajePluralDia(totalEdad[2], mensaje) : mensaje;

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

            <form method="post" action="edad.jsp" class="form">
                <div class="nombre">
                    <input type="hidden" name="switch" value="true">
                    <p>Introduce tu nombre:</p>
                    <input name="param1">
                </div>
                <div class="radio">
                    <p>Sexo:</p>
                    <p>Introduce tu fecha de nacimiento:</p>
                    <input type="date" id="fecha" name="param2">
                </div>
                <input type="submit" value="Enviar" class="enviar">
            </form>
            <%
            } else {
                try {
                    String nombre = request.getParameter("param1");
                    String edad = request.getParameter("param2");
            %>

            <div class="form">
                <%= responderEdad(nombre, edad)%>
                <%
                } catch (NumberFormatException ex) {
                %>
                <h1 class="respuesta">Debe completar todos los campos correctamente...</h1>
                <%
                    }
                %>

                <a href="edad.jsp" class="enviar">Volver atrás...</a>
            </div>
            <%
                }
            %>
        </main>
        <footer>
            <div class="info-pag">
                <p>Sitio creado por Manuel Guill&eacute;n Gallardo</p>
                <p>Alumno de DAW 2</p>
                <p>30 / 09 / 2021</p>
            </div>
        </footer>

    </body>
</html>
