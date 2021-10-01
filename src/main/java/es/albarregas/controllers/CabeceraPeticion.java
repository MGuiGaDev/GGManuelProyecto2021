/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 *
 * @author manue
 */
@WebServlet(name = "CabeceraPeticion", urlPatterns = {"/CabeceraPeticion"})
public class CabeceraPeticion extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html lang=\"es\">");
            out.println("<head>");
            out.println("<title>CabeceraPeticion</title>");       
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CabeceraPeticion at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

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
        
        response.setContentType("text/html;charset=ISO8859-1");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            /* http://www.w3big.com/es/servlet/servlet-internationalization.html */
            out.println("<!DOCTYPE html>");
            out.println("<html lang=\"es\">");
            out.println("<head>");
            out.println("<title>Servlet CabeceraPeticion</title>");            
            out.println("<link href=\"estilos/estiloCabeceraPeticion.css\" type=\"text/css\" rel=\"stylesheet\">");
            out.println("</head>");
            out.println("<body>");
            out.println("<header><h1><a href='inicio.html'>DWES</a></h1><a href=\"https://github.com/MGuiGaDev\" class=\"logo-github\" target=\"_blank\"><img src=\"imagenes/github.png\" /></a></header>");
            out.println("<main><div class=\"caja\">");
            Enumeration <String> nombresCabeceraPeticion = request.getHeaderNames();
            while(nombresCabeceraPeticion.hasMoreElements()){
                String nombre = nombresCabeceraPeticion.nextElement();
                out.println("<p><span class='nombreCabecera'>" + traductor(nombre) + "</span><br> "  + request.getHeader(nombre)+"</p>");
            }
            out.println("</div></main>");
            out.println("<footer><div class=\"info-pag\"><p>Sitio creado por Manuel Guillén Gallardo</p><p>Alumno de DAW 2</p><p>30 / 09 / 2021</p></div></footer>");
            out.println("</body>");
            out.println("</html>");
        } 
    }
    
    /**
     * Este método contiene una colección con las traducciones disponibles para las cabeceras obtenidas de la
     * petición. El nombre introducido como parámetro en inglés, será devuelto traducido al español 
     * en caso de que encuentre equivalente.
     * @param nombre
     * @return 
     */
    public static String traductor (String nombre){
        HashMap <String, String> traducciones = new HashMap();
        traducciones.put("UPGRADE-INSECURE-REQUESTS", "Solicitudes de actualización inseguras");
        traducciones.put("CONNECTION", "Gestión de conexiones");
        traducciones.put("USER-AGENT", "Agente de usuario");
        traducciones.put("CACHE-CONTROL", "Directivas de almacenado en caché");
        traducciones.put("ACCEPT", "Documentos que acepta");
        traducciones.put("REFERER", "Dirección de la página");
        traducciones.put("ACCEPT-ENCODING", "Codificados que acepta");
        traducciones.put("ACCEPT-LANGUAGE","Lenguajes que acepta");
        traducciones.put("SEC-FETCH-SITE", "Origen de la solicitud");
        traducciones.put("SEC-FETCH-MODE", "Modo de la solicitud");
        traducciones.put("SEC-FETCH-USER", "Tipo de solicitud del usuario");
        traducciones.put("SEC-FETCH-DEST", "Destino de la solicitud");
        traducciones.put("SEC-CH-UA", "");
        traducciones.put("SEC-CH-UA-MOBILE", "");
        traducciones.put("SEC-CH-UA-PLATFORM", "");
        for (String buscado : traducciones.keySet()){
            if(buscado.equalsIgnoreCase(nombre)){
                nombre = traducciones.get(buscado);
            }
        }
        return nombre;
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
        processRequest(request, response);
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
