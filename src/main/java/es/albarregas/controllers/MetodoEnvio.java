/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Manuel Guillén Gallardo
 */
@WebServlet(name = "MetodoEnvio", urlPatterns = {"/MetodoEnvio"})
public class MetodoEnvio extends HttpServlet {

/**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html lang=\"es\">");
            out.println("<head>"
                    + "<meta http-equiv=\"Content-Type\" content =\"text/html\" charset=\"utf-8\" />"
                    + "<title>CONTADOR DE VISITAS</title>"
                    + "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">"
                    + "<link href=\"estilos/estiloVista.css\" type=\"text/css\" rel=\"stylesheet\">"
                    + "<link href=\"../estilos/prism.css\" rel=\"stylesheet\">"
                    + "<link href=\"https://fonts.googleapis.com/css2?family=Prompt:wght@200&family=Permanent+Marker&display=swap\" rel=\"stylesheet\">"
                    + "<link href=\"https://fonts.googleapis.com/icon?family=Material+Icons\" rel=\"stylesheet\">"
                    + "<link rel=\"shortcut icon\" href=\"imagenes/favicon.ico\" type=\"image/x-icon\">"
                    + "<link rel=\"stylesheet\" href=\"https://use.fontawesome.com/releases/v5.8.1/css/all.css\" "
                    + "     integrity=\"sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf\" crossorigin=\"anonymous\">"
                    + "</head>"
                    + "<body>"
                    + "<header>"
                    + "<nav class=\"search\">"
                    + "<input type=\"text\" placeholder=\"Eg. Formulario\" id=\"buscador\">"
                    + "<a href=\"\" class=\"material-icons\" id=\"boton-buscador\">search</a>"
                    + "</nav>"
                    + "<a href=\"inicio.html\" class=\"logo\">"
                    + "<h1>DweS</h1>"
                    + "<p>Desarrollo web en entorno servidor</p>"
                    + "</a>"
                    + "<nav class=\"espacio-hub\">"
                    + "<a href=\"https://github.com/MGuiGaDev\" class=\"logo-github\" target=\"_blank\" title=\"Repositorio DWES\"><i class=\"fab fa-github\"></i></a>"
                    + "<a href=\"https://docs.oracle.com/javaee/7/api/toc.htm\" class=\"logo-java\" target=\"_blank\" title=\"API Java 7 EE\"><i class=\"fab fa-java\"></i> </a>"
                    + "<a href=\"https://docs.oracle.com/javaee/7/api/toc.htm\" class=\"logo-java\" target=\"_blank\" title=\"Cómo moverte por el sitio\"><i class=\"fas fa-info-circle\"></i> </a>"
                    + "</nav>"
                    + "</header>"
                    + "<nav class=\"menu\">"
                    + "<a href=\"inicio.html\">Inicio</a>"
                    + "<a href=\"#\">Notas</a>"
                    + "</nav>"
                    + "<main>"
                    + "<div class=\"titulo-ejercicio\">"
                    + "<p>Contador de visitas</p>"
                    + "</div>"
                    + "<div class=\"contenedor\">"
                    + "<div class=\"valido respuestaCorta\">");
            out.println("<h1>Estoy en doGet</h1>");
            Enumeration<String> nombres = request.getParameterNames();
            while(nombres.hasMoreElements()) {
                String nombre = nombres.nextElement();
                out.println("<p>El valor del parámetro " + nombre + " tiene un valor de " 
                        + request.getParameter(nombre) + "</p>");
                if(nombre.equalsIgnoreCase("numero")) {
                    out.println("<p>El producto de 4 por " + request.getParameter(nombre) + 
                            " es igual a " + Double.valueOf(request.getParameter(nombre)) * 4 +"</p>");
                }
                if(nombre.equalsIgnoreCase("error") && request.getParameter("error").equalsIgnoreCase("1")) {
                    out.println("Todos los campos son obligatorios");
                }
            }
            out.println("</div></div>"
                    + "</main>"
                    + "<footer class='footerFix'>>"
                    + "<div class=\"info-pag\">"
                    + "<p>Sitio creado por Manuel Guill&eacute;n Gallardo</p>"
                    + "<p>Alumno de DAW 2</p>"
                    + "<p>30 / 09 / 2021</p>"
                    + "</div>"
                    + "<div class=\"info-pag\">"
                    + "<p>Asignatura: Desarrollo web en entorno servidor</p>"
                    + "<p>Profesor: Jesús García Garijo</p>"
                    + "<p>IES Albarregas (Mérida)</p>"
                    + "</div>"
                    + "</footer>");

            out.println("</body>");
            out.println("</html>");
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html lang=\"es\">");
            out.println("<head>"
                    + "<meta http-equiv=\"Content-Type\" content =\"text/html\" charset=\"utf-8\" />"
                    + "<title>CONTADOR DE VISITAS</title>"
                    + "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">"
                    + "<link href=\"estilos/estiloVista.css\" type=\"text/css\" rel=\"stylesheet\">"
                    + "<link href=\"../estilos/prism.css\" rel=\"stylesheet\">"
                    + "<link href=\"https://fonts.googleapis.com/css2?family=Prompt:wght@200&family=Permanent+Marker&display=swap\" rel=\"stylesheet\">"
                    + "<link href=\"https://fonts.googleapis.com/icon?family=Material+Icons\" rel=\"stylesheet\">"
                    + "<link rel=\"shortcut icon\" href=\"imagenes/favicon.ico\" type=\"image/x-icon\">"
                    + "<link rel=\"stylesheet\" href=\"https://use.fontawesome.com/releases/v5.8.1/css/all.css\" "
                    + "     integrity=\"sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf\" crossorigin=\"anonymous\">"
                    + "</head>"
                    + "<body>"
                    + "<header>"
                    + "<nav class=\"search\">"
                    + "<input type=\"text\" placeholder=\"Eg. Formulario\" id=\"buscador\">"
                    + "<a href=\"\" class=\"material-icons\" id=\"boton-buscador\">search</a>"
                    + "</nav>"
                    + "<a href=\"inicio.html\" class=\"logo\">"
                    + "<h1>DweS</h1>"
                    + "<p>Desarrollo web en entorno servidor</p>"
                    + "</a>"
                    + "<nav class=\"espacio-hub\">"
                    + "<a href=\"https://github.com/MGuiGaDev\" class=\"logo-github\" target=\"_blank\" title=\"Repositorio DWES\"><i class=\"fab fa-github\"></i></a>"
                    + "<a href=\"https://docs.oracle.com/javaee/7/api/toc.htm\" class=\"logo-java\" target=\"_blank\" title=\"API Java 7 EE\"><i class=\"fab fa-java\"></i> </a>"
                    + "<a href=\"https://docs.oracle.com/javaee/7/api/toc.htm\" class=\"logo-java\" target=\"_blank\" title=\"Cómo moverte por el sitio\"><i class=\"fas fa-info-circle\"></i> </a>"
                    + "</nav>"
                    + "</header>"
                    + "<nav class=\"menu\">"
                    + "<a href=\"inicio.html\">Inicio</a>"
                    + "<a href=\"#\">Notas</a>"
                    + "</nav>"
                    + "<main>"
                    + "<div class=\"titulo-ejercicio\">"
                    + "<p>Contador de visitas</p>"
                    + "</div>"
                    + "<div class=\"contenedor\">"
                    + "<div class=\"valido respuestaCorta\">");
            Map<String, String[]> datos = request.getParameterMap();
            for (Map.Entry<String, String[]> entrada : datos.entrySet()) {
                if (!entrada.getKey().startsWith("env")) {

                    out.println("<p>" + entrada.getKey() + ": ");

                    for (String valor : entrada.getValue()) {
                        out.println("<strong>");
                        out.println(valor);

                        out.println("</strong>");
                    }
                    out.println("</p>");
                }

            }
            out.println("</div></div>"
                    + "</main>"
                    + "<footer class='footerFix'>"
                    + "<div class=\"info-pag\">"
                    + "<p>Sitio creado por Manuel Guill&eacute;n Gallardo</p>"
                    + "<p>Alumno de DAW 2</p>"
                    + "<p>30 / 09 / 2021</p>"
                    + "</div>"
                    + "<div class=\"info-pag\">"
                    + "<p>Asignatura: Desarrollo web en entorno servidor</p>"
                    + "<p>Profesor: Jesús García Garijo</p>"
                    + "<p>IES Albarregas (Mérida)</p>"
                    + "</div>"
                    + "</footer>");

            out.println("</body>");
            out.println("</html>");
            
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
