<%-- 
    Document   : saludo.jsp
    Created on : 04-oct-2021, 17:38:19
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
                <p>Saludador</p>
            </div>
            <div class="contenedor">

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
                        } else if (horaActualNumerica < 7 || horaActualNumerica == 22 || horaActualNumerica == 23) {
                            saludo.append("<h1>!Buenas noches");
                        }
                        saludo = sexo.equals("hombre") ? saludo.append(", señor " + nombre + "!</h1>") : saludo.append(", señora " + nombre + "!</h1>");
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
                    if (request.getParameter("switch") == null) {
                %>
                <div class="arriba">
                    <form method="post" action="saludo.jsp" class="modulo">
                        <input type="hidden" name="switch" value="true">
                        <p>Introduce tu nombre:</p>
                        <input name="param1" class="inputUser">
                        <br>
                        <p>Sexo:</p>
                        <!-- checked  -->
                        <div>
                            <input type="checkbox" id="hombre" name="param2" value="hombre" checked="checked" class="inputUser"> Hombre
                            <input type="checkbox" id="mujer" name="param2" value="mujer" class="inputUser"> Mujer
                        </div>
                        <br>
                        <input type="submit" value="Enviar" class="botonAccion">
                    </form>

                    <%
                    } else {
                        try {
                            String nombre = request.getParameter("param1");
                            String sexo = request.getParameter("param2");
                    %>

                    <div class="valido">
                        <%= mensajeSaludo(nombre, sexo)%>
                    </div><br>
                    <%
                    } catch (Exception ex) {
                    %>
                    <h2>Debe completar todos los campos...</h2><br>
                    <%
                        }
                    %>
                    <a href="saludo.jsp" class="botonAccion">Volver atrás...</a>

                    <%
                        }
                    %>

                </div>

            </div>
        </main>
        <footer class="footerFix">
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
