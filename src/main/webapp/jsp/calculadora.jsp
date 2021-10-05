<%-- 
    Document   : calculadora
    Created on : 01-oct-2021, 17:01:16
    Author     : Manuel Guillén Gallardo
--%>

<%@page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<%@ page import="java.util.Calendar" %>

<html lang="es">
    <head>
        <title>INICIO</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../estilos/estiloJSPCalculadora.css" type="text/css" rel="stylesheet">
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
            <div class="caja">
<%/* Método para sumar dos números enteros */%>
        <%!
        public int sumar(int param1, int param2){
        return param1 + param2;
        }
        %>
        <%
        if(request.getParameter("switch") == null){
        %>
                <form method="post" action="calculadora.jsp" >
                    <input type="hidden" name="switch" value="true">
                    <table>
                        <tr>
                            <td>Primer número:</td>
                            <td><input name="param1"></td>
                        </tr>
                        <tr>
                            <td>Segundo número:</td>
                            <td><input name="param2"></td>
                        </tr>
                        <tr>
                            <td><input type="submit" value="Sumar" class="volver"></td>
                        </tr>
                    </table>
                </form>
                <%
                    } else {
                    try {
                        int param1 = Integer.parseInt(request.getParameter("param1"));
                        int param2 = Integer.parseInt(request.getParameter("param2"));
                        int result = param1 + param2;
                %>
                <p>El resultado de la suma es: <%= sumar(param1, param2) %></p>
                <%
                    } catch(NumberFormatException ex){
                %>
                <p>Alguno de los números no contenía dígitos válidos...</p>
                <%
                    }
                %>
                <p><%= Calendar.getInstance().getTime() %></p>
                <a href="calculadora.jsp" class="volver">Volver atrás...</a>
                <%
                    }
                %>
            </div>
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
        
        
