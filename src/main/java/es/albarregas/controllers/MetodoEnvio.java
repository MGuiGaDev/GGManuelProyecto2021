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
            out.println("<!DOCTYPE html>");
            out.println("<html lang=\"es\">");
            out.println("<head>");
            out.println("<title>MÉTODO ENVÍO</title>");            
            out.println("<meta charset=\"UTF-8\">");
            out.println("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">");
            out.println("<link href=\"estilos/estiloInformacionMetodoRespuesta.css\" type=\"text/css\" rel=\"stylesheet\">");
            out.println("<link rel=\"preconnect\" href=\"https://fonts.googleapis.com\" >");
            out.println("<link href=\"https://fonts.googleapis.com/icon?family=Material+Icons\" rel=\"stylesheet\">");
            out.println("</head>");
            out.println("<body>");
            out.println("<header><h1><a href='inicio.html'>DWES</a></h1><a href=\"https://github.com/MGuiGaDev\" class=\"logo-github\" target=\"_blank\"><img src=\"imagenes/github.png\" /></a></header>");
            out.println("<main><div class=\"caja\">");
            out.println("<h1>Estoy en doGet</h1>");
            Enumeration<String> nombres = request.getParameterNames();
            while(nombres.hasMoreElements()) {
                String nombre = nombres.nextElement();
                out.println("<p>El valor del parámetro " + nombre + " tiene un valor de " 
                        + request.getParameter(nombre) + "</p>");
                if(nombre.equalsIgnoreCase("numero")) {
                    out.println("El producto de 4 por " + request.getParameter(nombre) + 
                            " es igual a " + Double.valueOf(request.getParameter(nombre)) * 4);
                }
                if(nombre.equalsIgnoreCase("error") && request.getParameter("error").equalsIgnoreCase("1")) {
                    out.println("Todos los campos son obligatorios");
                }
            }
            out.println("</div></main><footer><div class=\"info-pag\"><p>Sitio creado por Manuel GuillGuill&eacute;nn Gallardo</p><p>Alumno de DAW 2</p><p>30 / 09 / 2021</p></div></footer></body></html>");
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
            out.println("<head>");
            out.println("<title>DATOS REGISTRADOS</title>");            
            out.println("<meta charset=\"UTF-8\">");
            out.println("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">");
            out.println("<link href=\"estilos/estiloInformacionMetodoRespuesta.css\" type=\"text/css\" rel=\"stylesheet\">");
            out.println("<link rel=\"preconnect\" href=\"https://fonts.googleapis.com\" >");
            out.println("<link href=\"https://fonts.googleapis.com/icon?family=Material+Icons\" rel=\"stylesheet\">");
            out.println("</head>");
            out.println("<body>");
            out.println("<header><h1><a href='inicio.html'>DWES</a></h1><a href=\"https://github.com/MGuiGaDev\" class=\"logo-github\" target=\"_blank\"><img src=\"imagenes/github.png\" /></a></header>");
            out.println("<main><div class=\"caja\">");
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
            out.println("<p><a href=\".\">Menú</a></p>");
            out.println("</div></main><footer><div class=\"info-pag\"><p>Sitio creado por Manuel GuillGuill&eacute;nn Gallardo</p><p>Alumno de DAW 2</p><p>30 / 09 / 2021</p></div></footer></body></html>");
            
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
