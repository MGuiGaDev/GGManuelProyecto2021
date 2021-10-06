<%-- 
    Document   : CalculadoraBasica
    Created on : 05-oct-2021, 20:58:51
    Author     : Manuel Guillén Gallardo
--%>

<%@page import="java.util.Locale"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.LocalTime"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CALCULADORA BASICA</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../estilos/estiloCalculadoraBasica.css" type="text/css" rel="stylesheet">
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
            <%!
                public boolean comprobarNull(String opUno, String opDos, String operacion) {
                    if (opUno.equals("") || opDos.equals("") || operacion.equals("")) {
                        return false;
                    }
                    return true;
                }
            %>
            <%! public String buscarOp(String opSelec, int opUno, int opDos) {
                    String resultado = "";
                    switch (opSelec) {
                        case "+":
                            resultado = String.valueOf(opUno + opDos);
                            break;
                        case "-":
                            resultado = String.valueOf(opUno - opDos);
                            break;
                        case "*":
                            resultado = String.valueOf(opUno * opDos);
                            break;
                        case "/":
                            resultado = String.valueOf(opUno / opDos);
                            break;
                    }
                    return resultado;
                }
                public boolean validarNoCero(int paramNumDos, String seleccionado){
                    
                    if(paramNumDos == 0 && seleccionado.equals("/"))
                        return false;
                    return true;
                }
            %>  

            <div class="caja">
                
                <form method="post" action="calculadoraBasica.jsp">
                    <%  String resultado = "";
                        if(request.getParameter("switch")!=null){
                        
                        Calendar m = Calendar.getInstance(); 
                        int dia = m.get(Calendar.DAY_OF_MONTH);
                        String month =  m.getDisplayName(Calendar.MONTH, Calendar.LONG, Locale.getDefault());
                        int annio = m.get(Calendar.YEAR);
                        String num1 = request.getParameter("primerOperando");
                        String num2 = request.getParameter("segundoOperando");
                        String operSelComp = request.getParameter("operacion");
                        boolean validado = comprobarNull(num1, num2, operSelComp);
                        if(validado == true) {
                            Integer primOpNum = Integer.parseInt(request.getParameter("primerOperando"));
                            Integer segOpNum = Integer.parseInt(request.getParameter("segundoOperando"));
                            String operacionSeleccionada = request.getParameter("operacion");
                            resultado= !validarNoCero(segOpNum, operacionSeleccionada)?"Calculando... espere cinco segundos, "
                            + "si no ha encontrado respuesta, realice una nueva operación." : dia + " de " + month + " de " + " " + annio + " <br> " +
                                    primOpNum + " " + operacionSeleccionada + " " + segOpNum + " = " + buscarOp(operacionSeleccionada, primOpNum, segOpNum);
                        }
                        else {
                            resultado = "Introduce los números, elige una operación y envía...";
                        }
                    }
                    %>
                    <input type="hidden" name="switch" value="true">
                    <div class="cabecera">
                        <h1 name="resultado"><%= resultado  %></h1>
                    </div>
                    <div class="cuerpo">
                        <div class="primero">
                            <label for="primerOperando">NÚMERO</label><br>
                            <input type="number" name="primerOperando" id="primerOperando">
                        </div>
                        <div class="operadores">
                            <label>
                                <input name="operacion" type="radio"  value="+" class="boton op">
                                <p class="im">&#43;</p>
                            </label>
                            <label>
                                <input name="operacion" type="radio" value="-" class="boton op">
                                <p class="im">&#8722;</p>
                            </label>
                            <label>
                                <input name="operacion" type="radio" value="*" class="boton op">
                                <p class="im">&#215;</p>
                            </label>
                            <label>
                                <input name="operacion" type="radio"  value="/" class="boton op">
                                <p class="im">&#247;</p>
                            </label>
                        </div>
                        <div class="segundo">
                            <label for="segundoOperando">NÚMERO</label><br>
                            <input type="number" name="segundoOperando" id="segundoOperando" />
                        </div>
                    </div>
                    <div class="pie">
                        <button onclick="javascript:location.href = '../inicio.html'" class="boton nav">Inicio</button>
                        <button type="submit" class="boton nav" name="enviar">Enviar</button>
                        <input type="reset" value="Limpiar" class="boton nav" />
                    </div>
                </form>
                    
            </div>
            <h1 class="respuesta">Debe completar todos los campos correctamente...</h1>

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

</body>
</html>
