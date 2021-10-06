<%-- 
    Document   : saludo.jsp
    Created on : 04-oct-2021, 17:38:19
    Author     : Manuel Guillén Gallardo
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Calendar"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>SALUDADOR</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../estilos/estiloJSPSaludo.css" type="text/css" rel="stylesheet">
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
            <%/* Método para calcular hora del día */%>
            <%!
                public String mensajeSaludo(String nombre, String sexo) {
                    StringBuilder saludo = new StringBuilder();
                    Calendar horaActual = Calendar.getInstance();
                    int horaActualNumerica = horaActual.get(Calendar.HOUR);
                    if (horaActualNumerica >= 7 && horaActualNumerica <= 12) {
                        saludo.append("<h1>!Buenos días");
                    } else if (horaActualNumerica > 12 && horaActualNumerica <= 21) {
                        saludo.append("<h1>!Buenas tardes");
                    } else if(horaActualNumerica < 7 || horaActualNumerica == 22 || horaActualNumerica == 23) {
                        saludo.append("<h1>!Buenas noches");
                    }
                    saludo = sexo.equals("hombre") ? saludo.append(", señor " + nombre  + "!</h1>") : saludo.append(", señora " + nombre + "!</h1>");
                    String saludoFinal = saludo.toString();
                    return saludoFinal;
                }
            %>
            <!--
                OJO A LA SOLUCIÓN DE CLASE
                [et.jsp]% 
            
                    String tratamiento = null;
                    tratamiento = request.getParameter("sexo").equals("hombre") ? "señor":"señora";
                    int hora = LocalTime.now().getHour();
                    String saludo = null;
                    if(...
            
                %[et.jsp]
                [et.html]p  Buen [et.jsp]% saludo %[et.jsp]  [et.jsp]% tratamiento %[et.jsp]        p[et.html]
            -->
            <%
                if (request.getParameter("switch") != null) {
            %>

            <form method="post" action="saludo.jsp" class="form">
                <div class="nombre">
                    <input type="hidden" name="switch" value="true">
                    <p>Introduce tu nombre:</p>
                    <input name="param1">
                </div>
                <div class="radio">
                    <p>Sexo:</p>
                    <!-- checked  -->
                    <input type="checkbox" id="hombre" name="param2" value="hombre" checked="checked">
                    <label for="hombre" class="label-eleccion">Hombre</label>
                    <input type="checkbox" id="mujer" name="param2" value="mujer">
                    <label for="mujer" class="label-eleccion">Mujer</label>
                </div>
                <input type="submit" value="Enviar" class="enviar">
            </form>
            <%
            } else {
                try {
                    String nombre = request.getParameter("param1");
                    String sexo = request.getParameter("param2");
            %>

            <div class="form">
                <%= mensajeSaludo(nombre, sexo)%>
            </div>
            <%
            } catch (Exception ex) {
            %>
                <h2>Debe completar todos los campos...</h2>
            <%
                }
            %>

                <a href="saludo.jsp" class="enviar">Volver atrás...</a>
            
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
