<%-- 
    Document   : controladorCrudEmpleadoSesion
    Created on : 09-oct-2021, 0:52:27
    Author     : Manuel Guillén Gallardo
--%>



<%@page import="java.time.format.TextStyle"%>
<%@page import="java.util.Locale"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="es.albarregas.beans.Empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    /**
     * {@link #direccion} contiene la dirección a la cual conduciremos la
     * información
     */
    // NUNCA ASIGNAS UN VALOR AL PARÁMETRO clave
    StringBuilder direccion = new StringBuilder("crudEmpleadoSesion.jsp?clave=");

    /**
     * {@link #respuestaAccion} variable para contener la respuesta que
     * enviaremos al usuario según el resultado de sus acciones
     */
    StringBuilder respuestaAccion = new StringBuilder();

    /**
     * {@link #datosEmpleado} variable para contener la información aportada por
     * el usuario sobre el empleado null null null null null null null null null
     * null null null null null null null null null null null null null null
     * null null null null null null null null null null null null     {@code datosEmpleado.append("<p>" + empleado.getNombre() + "</p><p>" 
     *                                   + empleado.getFechaDeNacimiento() + "</p><p>"
     *                                   + empleado.getSueldo() + "</p>"}
     */
    StringBuilder datosEmpleado = new StringBuilder();

    /**
     * {@link #formato} objeto para establecer el formato en la conversión de
     * datos de tipo String a tipo Date
     * {@code Date fecha = formato.parse("09-10-2021");}
     */
    SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");

    /**
     * {@link #empleado} objeto para crear nuevos empleados
     */
    Empleado empleado = new Empleado();

    /**
     * {@link #nombreAtributo} contiene el nombre de "atributo de sesión"
     * aportado por el usuario en el formulario
     */
    String respuestaSalario = request.getParameter("salarioEmpleado");
    Double salario = null;
    String[] fecha = request.getParameter("fechaNacimientoEmpleado").split("-");
    LocalDate fechaNacimiento = null;//fecha != null ? LocalDate.of(Integer.parseInt(fecha[0]), Integer.parseInt(fecha[1]), Integer.parseInt(fecha[2])):null;
    if (request.getParameter("enviar") == "inicio") {

    } else {

        if (request.getParameter("nombreAtributo").length() != 0) {
            System.out.println("entro en if");
            String nombreAtributoUsuario = request.getParameter("nombreAtributo");
            // AL HACER CASTING A STRING ES POSIBLE QUE EL SUELDO NO SE CAPTURE BIEN
            String nombreAtributo = (String) request.getSession().getAttribute(nombreAtributoUsuario);
            boolean esNumerico = respuestaSalario.matches("[+]?\\d*(\\.\\d+)?");

            switch (request.getParameter("enviar")) {
                case "crear":
                    if (request.getParameter("salarioEmpleado").length() == 0
                            || request.getParameter("fechaNacimientoEmpleado").length() == 0
                            || request.getParameter("nombreEmpleado").length() == 0) {
                        respuestaAccion.append("<p class='error'>Debe completar todos los campos.</>");
                    } else if (!esNumerico) {
                        respuestaAccion.append("<p class='error'>Debe introducir un número positivo de signo para salario.</>");
                    } else if (nombreAtributo != null) {
                        respuestaAccion.append("<p class='error'>El atributo ya existe. Pruebe introduciendo otro nombre.</>");
                    } else {
                        salario = Double.valueOf(respuestaSalario);
                        fechaNacimiento = LocalDate.of(Integer.parseInt(fecha[0]), Integer.parseInt(fecha[1]), Integer.parseInt(fecha[2]));
                        empleado.setNombre(request.getParameter("nombreEmpleado"));
                        empleado.setSalario(salario);
                        empleado.setFechaDeNacimiento(fechaNacimiento);
                        datosEmpleado.append("<p>&#149; <b>Nombre de empleado</b>: " + empleado.getNombre() + "</p><p><p>&#149; <b>Fecha de nacimiento</b>: "
                                + empleado.getFechaDeNacimiento().getDayOfWeek().getDisplayName(TextStyle.FULL, new Locale("es", "ES"))
                                + " " + empleado.getFechaDeNacimiento().getDayOfMonth()
                                + " de " + empleado.getFechaDeNacimiento().getMonth().getDisplayName(TextStyle.FULL, new Locale("es", "ES"))
                                + " de " + empleado.getFechaDeNacimiento().getYear()
                                + "</p><p>&#149; <b>Salario</b>: "
                                + empleado.getSalario() + "</p></div>");
                        respuestaAccion.append("<p class='valido'>El atributo ha sido creado.</p>");
                        // EN REALIDAD NO ESTAS GUARDANDO UN OBJETO EMPLEADO SINO UNA STRING
                        request.getSession().setAttribute(nombreAtributoUsuario, datosEmpleado.toString());
                    }
                    break;
                case "visualizar":
                    if (nombreAtributo == null) {
                        respuestaAccion.append("<p class='error'>El atributo no existe. Pruebe introduciendo otro nombre.</>");
                    } else {
                        respuestaAccion.append("<div class='respuestaSesion'><p>El atributo <b>" + nombreAtributoUsuario.toUpperCase() + "</b> tiene los siguientes valores: " + "<br>");
                        respuestaAccion.append(request.getSession().getAttribute(nombreAtributoUsuario));
                        // EL NOMBRE DEL ATRIBUTO DE SESIÓN NO HAY QUE PASARLO COMO EL VALOR DE UN ATRIBUTO DE SESIÓN
                    }
                    break;
                case "modificar":
                    if (request.getParameter("salarioEmpleado").length() == 0 || request.getParameter("fechaNacimientoEmpleado").length() == 0 || request.getParameter("nombreEmpleado").length() == 0) {
                        respuestaAccion.append("<p class='error'>Debe completar todos los campos.</>");
                    } else if (!esNumerico) {
                        respuestaAccion.append("<p class='error'>Debe introducir un número de signo positivo para salario.</>");
                    } else if (nombreAtributo == null) {
                        respuestaAccion.append("<p class='error'>El atributo no existe. Pruebe introduciendo otro nombre.</>");
                    } else {
                        fechaNacimiento = LocalDate.of(Integer.parseInt(fecha[0]), Integer.parseInt(fecha[1]), Integer.parseInt(fecha[2]));
                        empleado.setNombre(request.getParameter("nombreEmpleado"));
                        empleado.setSalario(salario);
                        empleado.setFechaDeNacimiento(fechaNacimiento);
                        datosEmpleado.append("<p>&#149; <b>Nombre de empleado</b>: " + empleado.getNombre() + "</p><p><p>&#149; <b>Fecha de nacimiento</b>: "
                                + empleado.getFechaDeNacimiento().getDayOfWeek().getDisplayName(TextStyle.FULL, new Locale("es", "ES"))
                                + " " + empleado.getFechaDeNacimiento().getDayOfMonth()
                                + " de " + empleado.getFechaDeNacimiento().getMonth().getDisplayName(TextStyle.FULL, new Locale("es", "ES"))
                                + " de " + empleado.getFechaDeNacimiento().getYear() + "</p><p>&#149; <b>Salario</b>: "
                                + empleado.getSalario() + "</p></div>");
                        respuestaAccion.append("<p class='valido'>El atributo ha sido modificado.</>");
                        request.getSession().setAttribute(nombreAtributoUsuario, datosEmpleado.toString());
                    }
                    break;
                case "eliminar":
                    if (nombreAtributo == null) {
                        respuestaAccion.append("<p class='error'>El atributo no existe. Pruebe introduciendo otro nombre.</>");
                    } else {
                        request.getSession().removeAttribute(nombreAtributoUsuario);
                        respuestaAccion.append("<p class='valido'>El atributo ha sido eliminado.</>");
                    }
                    break;
            }

        } else {
            //respuestaAccion -> [v] nombreAtributoUsuario es necesario...
            respuestaAccion.append("<p class='error'>El campo 'Nombre de atributo de sesión' es imprescindible.</>");
            System.out.println("entro en else");
        }

    } //fin else 

    request.getSession().setAttribute("respuestaAccion", respuestaAccion.toString());
    response.sendRedirect(direccion.toString());

%>
