/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Manuel Guillén Gallardo
 */
@WebServlet(name = "ContadorDeVisitas", urlPatterns = {"/ContadorDeVisitas"})
public class ContadorDeVisitas extends HttpServlet {

    private int contadorNumerico = 0;
    final String contador = "1";
    final Cookie visita = new Cookie("visita", contador);
    private StringBuilder respuesta = new StringBuilder();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
                    + "<div class=\"valido\">");
            visita.setMaxAge(3600);
            contadorNumerico += 1;
            visita.setValue(String.valueOf(contadorNumerico));
            String veces = (Integer.parseInt(visita.getValue())) > 1 ? "veces" : "vez";
            out.println("<h3 style=\"text-align: center;\" >Has visitado la página " + visita.getValue() + " " + veces + " </h3>"
                    + "<h3 style=\"text-align: center;\">Información de la cookie</h3>"
                    + "<p style=\"text-align: center;\">Caducidad: " + visita.getMaxAge() + "</p>"
                    + "<p style=\"text-align: center;\">Nombre: " + visita.getName() + "</p>"
                    + "<p style=\"text-align: center;\">Segura: " + visita.getSecure() + "</p>"
                    + "<p style=\"text-align: center;\">Versión: " + visita.getVersion() + "</p></div>"
                    + "<div class=\"modulo\"> <br>"
                    + "<form action=\"ContadorDeVisitas\" method=\"post\" class=\"menuBotones\">"
                    + "<input type=\"submit\" name=\"enviar\" value=\"recargar\" class=\"botonAccion\"/>"
                    + "<input type=\"submit\" name=\"enviar\" value=\"eliminar\" class=\"botonAccion\"/>"
                    + "<input type=\"submit\" name=\"enviar\" value=\"inicio\" class=\"botonAccion\"/>"
                    + "</form>");

            out.println("</form></div></div>"
                    + "</main>"
                    + "<footer>"
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
        switch (request.getParameter("enviar")) {
            
            
            case "recargar":
                contadorNumerico += 1;
                visita.setValue(String.valueOf(contadorNumerico));
                response.addCookie(visita);
                respuesta.setLength(0);
                respuesta.append("<h3 style=\"text-align: center;\">Has visitado la p&aacute;gina ").append(visita.getValue()).append(" veces</h3></div><br>");
                break;
            case "eliminar":
                contadorNumerico = 0;
                visita.setMaxAge(contadorNumerico);
                visita.setValue("0");
                response.addCookie(visita);
                respuesta.setLength(0);
                respuesta.append("<h3 style=\"text-align: center;\">El contador de visitas ha sido eliminado.</h3></div><br>");
                break;
            case "inicio":
                break;
        }
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
                    + "<div class=\"valido\">");

            out.println(respuesta);
            out.println("<div class=\"modulo\"><form action=\"ContadorDeVisitas\" method=\"post\" class=\"menuBotones\">"
                    + "<input type=\"submit\" name=\"enviar\" value=\"recargar\" class=\"botonAccion\"/>"
                    + "<input type=\"submit\" name=\"enviar\" value=\"eliminar\" class=\"botonAccion\"/>"
                    + "<input type=\"submit\" name=\"enviar\" value=\"inicio\" class=\"botonAccion\"/>"
                    + "</form>");

            out.println("</form></div></div>"
                    + "</main>"
                    + "<footer class=\"footerFix\">"
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
