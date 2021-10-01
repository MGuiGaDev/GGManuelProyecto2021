/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.controllers;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

/**
 *
 * @author Manuel Guillén Gallardo
 */
@WebServlet(name = "CicloDeVida", urlPatterns = {"/CicloDeVida"})
public class CicloDeVida extends HttpServlet {
    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(); //To change body of generated methods, choose Tools | Templates.
        System.out.println("Estoy en init()");
    }

    /**
     *
     * @param request
     * @param response
     */
    @Override
    public void service(ServletRequest request, ServletResponse response){
        System.out.println("Estoy en service()");
    }
    @Override
    public void destroy() {
        super.destroy(); //To change body of generated methods, choose Tools | Templates.
        System.out.println("Estoy en destroy()");
    }

}
