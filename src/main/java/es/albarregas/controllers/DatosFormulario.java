/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author manue
 */
@WebServlet(name = "DatosFormulario", urlPatterns = {"/DatosFormulario"})
public class DatosFormulario extends HttpServlet {

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
        processRequest(request, response);
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
            out.println("<link href=\"estilos/estiloDatosFormulario.css\" type=\"text/css\" rel=\"stylesheet\">");
            out.println("<link rel=\"preconnect\" href=\"https://fonts.googleapis.com\" >");
            out.println("<link href=\"https://fonts.googleapis.com/icon?family=Material+Icons\" rel=\"stylesheet\">");
            out.println("</head>");
            out.println("<body>");
            out.println("<header><h1><a href='inicio.html'>DWES</a></h1><a href=\"https://github.com/MGuiGaDev\" class=\"logo-github\" target=\"_blank\"><img src=\"imagenes/github.png\" /></a></header>");
            out.println("<main><div class=\"caja\"><h2>DATOS REGISTRADOS</h2>");
            Map <String, String []> datosFormulario = request.getParameterMap();
            StringBuilder valores;
            for (String nombreParametro : datosFormulario.keySet()){
                String [] valoresParametro = datosFormulario.get(nombreParametro);
                valores = tomarValoresArray(valoresParametro);
                switch(nombreParametro){
                    case "nombreApellidos":
                        out.println("<h3>Nombre y apellidos</h3>");
                        out.println("<p>" + valores + "</p>");
                        break;
                    case "fechaNac":
                        out.println("<h3>Fecha de nacimiento</h3>");
                        out.println("<p>"+ valores +"</p>"); 
                        break;
                    case "ciudad":
                        out.println("<h3>Prefieres</h3>");
                        out.println("<p>"+ valores +"</p>");
                        break;
                    case "sexo":
                        out.println("<h3>Sexo</h3>");
                        out.println("<p>"+ valores +"</p>");
                }
            }
            out.println("<p class=\"botonVolver\"><a href='html/creacionFormulario.html' >VOLVER</a></p>");
            out.println("</div></main><footer><div class=\"info-pag\"><p>Sitio creado por Manuel Guill&eacute;n Gallardo</p><p>Alumno de DAW 2</p><p>30 / 09 / 2021</p></div></footer></body></html>");
        }
    }
    
    public StringBuilder tomarValoresArray(String [] arr) {
        StringBuilder valores = new StringBuilder();
        for(int i = 0; i < arr.length; i++){
            valores.append(arr[i]);
            valores = i == arr.length-1? valores.append(" "): valores.append(" / ");
        }
        return valores;
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
