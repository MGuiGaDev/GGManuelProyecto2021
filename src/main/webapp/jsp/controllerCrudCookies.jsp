<%-- 
    Document   : controllerCrudCookies
    Created on : 07-oct-2021, 18:26:56
    Author     : Manuel Guillén Gallardo
--%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%
    /*
    Ejercicio: Gestión de cookies
    Nombre de la cookie [] -> necesita validar
    Valor de la cookie [] -> no necesita validar
    - crear (*el nombre de la cokie es necesario*) [v]
    - visualizar (necesita validar que existe) [v]
    - modificar
    eliminar
    - indice (*submit*)

    JSP > controlador (logica y redireccion de flujo)
    - genera mensajes de validación

    JSP > formulario 
    (no hay HTML, hay lógica con StringBuilder)

    response.sendRedirect();
     */
    //jsessionid
    StringBuilder respuesta = new StringBuilder();
    Cookie nuevaCookie = null;
    Cookie[] cookies = request.getCookies();
    String nombre = request.getParameter("nombreC");
    String valor = request.getParameter("valorC");
    String valorEnviar = request.getParameter("enviar");
    if (valorEnviar != null) {
        switch (valorEnviar) {
            case "crear":
                if (nombre.equals("")) {
                    respuesta.append("<p class='error'>Debe introducir un nombre para la cookie</p>");
                } else if (!validarExisteCookie(nombre, cookies)) {
                    nuevaCookie = crearCookie(nombre, valor);
                    response.addCookie(nuevaCookie);
                    respuesta.append("<p class='valido'> Ha creado una cookie: " + nuevaCookie.getName() + "</p>");
                } else {
                    respuesta.append("<p class='error'>Lo sentimos, el nombre elegido ya existe.</p>");
                }
                response.sendRedirect(
                        "crudCookie.jsp?clave=" + respuesta);
                break;
            case "visualizar":
                respuesta = visualizarCookie(cookies, respuesta);
                response.sendRedirect(
                        "crudCookie.jsp?clave=" + respuesta);
                break;
            case "modificar":
                respuesta.append(mensajeUpdate());
                response.sendRedirect(
                        "crudCookie.jsp?clave=" + respuesta);
                break;
            case "eliminar":
                respuesta.append(mensajeDelete());
                response.sendRedirect(
                        "crudCookie.jsp?clave=" + respuesta);
                break;
            case "inicio":
                respuesta.append(irInicio());
                String direccion = respuesta.toString();
                response.sendRedirect(direccion);
                break;
        }

    }

    //request.getSession().setAttribute("respuesta", respuesta);
//    Cookie nuevaCookie = crearCookie(".", ".");
//    response.addCookie(nuevaCookie);
//    response.addCookie(nuevaCookie);
%>

<%  Cookie[] nuevasCookies = request.getCookies();
    String nombreCU = request.getParameter("nombreCU");
    String valorCU = request.getParameter("valorCU");
    String nombreCD = request.getParameter("nombreCD");
    String valorNuevoEnvio = request.getParameter("nuevoEnvio");
    if (request.getParameter("nuevoEnvio") != null) {
        switch (valorNuevoEnvio) {
            case "modifico":
                if (validarExisteCookie(nombreCU, nuevasCookies)) {
                    Cookie co = modificarCookie(nombreCU, valorCU, nuevasCookies);
                    response.addCookie(co);
                    respuesta.append("<p class='valido'> Ha modificado la cookie: " + nombreCU + "</p>");
                } else {
                    respuesta.append("<p class='error'> Introduzca el nombre de una cookie existente. Haga click en visualizar para ver las que estan activas</p>");

                }
                break;
            case "elimino":
                if (validarExisteCookie(nombreCD, nuevasCookies)) {
                    Cookie co = eliminarCookie(nombreCD, nuevasCookies);
                    response.addCookie(co);
                    respuesta.append("<p class='valido'> Ha eliminado la cookie: " + nombreCD + "</p>");
                } else {
                    respuesta.append("<p class='error'> Introduzca el nombre de una cookie existente. Haga click en visualizar para ver las que estan activas</p>");
                }
                break;
        }
        response.sendRedirect(
                "crudCookie.jsp?clave=" + respuesta);
    }


%>


<%!  //MÉTODOS

    /**
     * Método que crea Cookie, necesita validar Cookie: ¿existe? ¿mensaje vacío?
     * Además aseguramos que el usuario no introduzca espacios en blanco.
     */
    public Cookie crearCookie(String nombre, String valor) {
        nombre = nombre.replaceAll("\\s", "_");
        valor = valor.replaceAll("\\s", "_");
        Cookie nuevaCookie = new Cookie(nombre, valor);
        nuevaCookie.setMaxAge(3600);
        return nuevaCookie;
    }

//</editor-fold>
    /**
     * Método que crea Cookie, necesita validar Cookie: ¿existe? ¿mensaje vacío?
     */
    public StringBuilder visualizarCookie(Cookie[] cookies, StringBuilder respuesta) {
        int contador = 1;
        if (cookies.length <= 1) {
            respuesta.append("<p class='error'>No ha creado ninguna cookie todavia.</p>");
        } else {
            respuesta.append("<p class='tita'>COOKIES ACTIVAS</p>");
            respuesta.append("<div class='table'>");
            for (Cookie coo : cookies) {
                respuesta.append("<p><b>" + contador + ". Nombre:</b> " + coo.getName() + " <b>Valor:</b> " + coo.getValue() + "</p>");
                contador++;
            }
            respuesta.append("</div>");
        }
        return respuesta;
    }

    /**
     * Método que crea Cookie, necesita validar Cookie: ¿existe? ¿mensaje vacío?
     */
    public Cookie modificarCookie(String nombre, String valor, Cookie[] cookiesExistentes) {
        Cookie co = null;
        for (Cookie cookie : cookiesExistentes) {
            if (cookie.getName().equals(nombre)) {
                cookie.setValue(valor);
                co = cookie;
            }
        }
        return co;
    }

    public Cookie eliminarCookie(String nombre, Cookie[] cookiesExistentes) {
        Cookie co = null;
        for (Cookie cookie : cookiesExistentes) {
            if (cookie.getName().equals(nombre)) {
                cookie.setMaxAge(0);
                co = cookie;
            }
        }
        return co;
    }

    public StringBuilder irInicio() {
        StringBuilder direccion = new StringBuilder();
        direccion.append("../inicio.html");
        return direccion;
    }

    /**
     * Función que comprueba si una cookie existe. return {Boolean} Dependiendo
     * del método: Para: ``modificar()``, ``eliminar()``, ``visualizar()`` debe
     * retornar ``true`` Para: ``crear()`` debe retornar ``false``
     */
    public boolean validarExisteCookie(String nombre, Cookie[] cookiesExistentes) {
        boolean validador = false;
        for (Cookie cookie : cookiesExistentes) {
            if (cookie.getName().equals(nombre)) {
                validador = true;
            }
        }
        return validador;
    }

    public StringBuilder mensajeUpdate() {
        StringBuilder resp = new StringBuilder();
        resp.append("<form action='controllerCrudCookies.jsp' method='post' class='modulo'>"
                + "<label for='nombreCU'>Nombre: </label><input type='text' id='nombreCU' name='nombreCU' class='inputUser' /><br>"
                + "<label for='valorCU'>Nuevo valor: </label><input type='text' id='valorCU' name='valorCU' class='inputUser' /><br>"
                + "<div class='menuBotones'><input type='submit' id='nuevoEnvio' name='nuevoEnvio' value='modifico'/>"
                + "<input type='submit' name='nuevoEnvio' value='cancelo'/></div></form>");
        return resp;
    }

    public StringBuilder mensajeDelete() {
        StringBuilder resp = new StringBuilder();
        resp.append("<form action='controllerCrudCookies.jsp' method='post' class='modulo'>"
                + "<label for='nombreCD'>Nombre: </label><input type='text' id='nombreCD' name='nombreCD' class='inputUser' /><br>"
                + "<div class='menuBotones'><input type='submit' id='nuevoEnvio' name='nuevoEnvio' value='elimino'/>"
                + "<input type='submit' name='nuevoEnvio' value='cancelo'/></div></form>");
        return resp;
    }

%>