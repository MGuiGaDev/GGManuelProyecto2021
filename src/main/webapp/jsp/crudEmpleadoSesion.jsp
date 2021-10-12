<%-- 
    Document   : gestorDeSesiones
    Created on : 08-oct-2021, 17:37:36
    Author     : Manuel Guillén Gallardo
--%>

<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta http-equiv="Content-Type" content ="text/html" charset="utf-8" />
        <title>GESTOR DE SESIONES</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../estilos/estiloVista.css" type="text/css" rel="stylesheet">
        <link href="../estilos/prism.css" rel="stylesheet">
        <link
            href="https://fonts.googleapis.com/css2?family=Prompt:wght@200&family=Permanent+Marker&display=swap"
            rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="shortcut icon" href="imagenes/favicon.ico" type="image/x-icon">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
              integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
              crossorigin="anonymous">

    </head>

    <body>
        <header>
            <nav class="search">
                <input type="text" placeholder="Eg. Formulario" id="buscador">
                <a href="" class="material-icons" id="boton-buscador">search</a>
            </nav>
            <a href="../inicio.html" class="logo">
                <h1>DweS</h1>
                <p>Desarrollo web en entorno servidor</p>
            </a>
            <nav class="espacio-hub">
                <a href="https://github.com/MGuiGaDev" class="logo-github" target="_blank"
                   title="Repositorio DWES"><i class="fab fa-github"></i></a>
                <a href="https://docs.oracle.com/javaee/7/api/toc.htm" class="logo-java" target="_blank"
                   title="API Java 7 EE"><i class="fab fa-java"></i> </a>
                <a href="https://docs.oracle.com/javaee/7/api/toc.htm" class="logo-java" target="_blank"
                   title="Cómo moverte por el sitio"><i class="fas fa-info-circle"></i> </a>
            </nav>
        </header>
        <nav class="menu">
            <a href="../inicio.html">Inicio</a>
            <a href="#">Notas</a>
        </nav>
        <main>
            <div class="titulo-ejercicio">
                <p>Gestor de sesiones</p>
            </div>
            <div class="contenedor">

                <div class="arriba">
                    <form action="controladorCrudEmpleadoSesion.jsp" method="post" class="modulo">
                        <h2>CRUD de Atributos de sesión</h2><br>
                        <label for="nombreAtributo" >Nombre de atributo de sesión: </label>
                        <input type="text" id="nombreAtributo" name="nombreAtributo" class="inputUser" placeholder="Eg. miPrimerAtributo"></input>
                        <br>
                        <label for="nombreEmpleado" >Nombre del empleado: </label>
                        <input type="text" id="nombreEmpleado" name="nombreEmpleado" class="inputUser" placeholder="Eg. Ernesto"></input>
                        <br>
                        <label for="fechaNacimientoEmpleado" >Fecha de nacimiento: </label>
                        <input type="date" id="fechaNacimientoEmpleado" name="fechaNacimientoEmpleado" class="inputUser"/>
                        <br>
                        <label for="salarioEmpleado" >Salario: </label>
                        <input type="text" id="salarioEmpleado" name="salarioEmpleado" class="inputUser" placeholder="Eg. 1250.23"/>
                        <br>
                        <div class="menuBotones">
                            <input type="submit" name="enviar" value="crear" class="botonAccion"/>
                            <input type="submit" name="enviar" value="visualizar" class="botonAccion"/>
                            <input type="submit" name="enviar" value="modificar" class="botonAccion"/>
                            <input type="submit" name="enviar" value="eliminar" class="botonAccion"/>
                            <input type="submit" name="enviar" value="inicio" class="botonAccion"/>
                        </div>
                    </form>
                    <div class="respuesta">

                        <%=(request.getSession().getAttribute("respuestaAccion") != null) ? request.getSession().getAttribute("respuestaAccion") : ""%>
                        <%
                            //limpio el atributo para que cuando recargue no vuelva a aparecer el mensaje en la página
                            request.getSession().setAttribute("respuestaAccion", "");
                        %>

                    </div>
                </div>
                <div class="abajo">
                    <h2>Observaciones</h2>
                    <p>El punto más importante de este ejercicio es la gestión de atributos de la sesión de un usuario. Para ello, debemos poder validar y convertir los datos que el usuario introducirá en nuestro formulario.</p>

                    <br>
                    <h3>Gestión de atributos de sesión</h3>
                    <p>Nuestro programa permite crear, visualizar, modificar y eliminar atributos de sesión. Veamos los métodos que hemos usado para conseguirlo.</p><br>
                    <p>&#149; A la hora de crear un nuevo atributo de sesión, en lugar de crear un objeto de tipo <a href="https://docs.oracle.com/javaee/7/api/javax/servlet/http/HttpSession.html" target="_blank"><span class="enlaces">HttpSession</span></a>, 
                        accederemos y manipularemos los atributos de sesión a través de la instanciación implicita de <a href="https://docs.oracle.com/javaee/7/api/javax/servlet/http/HttpSession.html" target="_blank"><span class="enlaces">HttpSerlvletRequest:</span></a></p>
                    <pre class="line-numbers"><code class="language-java">//Extraer atributo de sesión
request.getSession().getAttribute(nombreAtributo);
//Crear o actualizar atributo de sesión
request.getSession().setAttribute("nombreDelAtributo", objeto);
//Eliminar atributo de sesión
request.getSession().removeAttribute(nombreDelAtributo);
</pre></code>
                    <br>
                    <h3>Validación y conversión de datos</h3>
                    <p>Una apreciación importante es que vamos a tomar los datos del usuario a traves del método <i>request.getParameter()</i>. Este método retorna
                        datos de tipo <i>String</i> y esto condicionará nuestra forma de validarlos y transformarlos:</p>
                    <br>
                    <p>&#149; Para asegurar que el usuario introduce caracteres numéricos:</p>
                    <pre class="line-numbers"><code class="language-java">boolean esNumerico = respuestaSalario.matches("[+]?\\d*(\\.\\d+)?");
/*
&#149; corchetes => representan la clase de elementos. 
En este caso admitiremos solo número positivos [+] dado que el sueldo
,de momento ,debe representar una cifra de este signo. 
&#149; "d" => representa a los números entre el 0 y el 9.
&#149; asterisco => representa que el signo, o signos, 
que lo preceden pueden repetirse.
paréntesis => en este caso establece que "d" solo podrá
ir seguido de ese grupo de caracteres.
*/
if (!esNumerico) {
//lanzamos mensaje || realizamos acción
</code></pre><br>
                            <p>&#149; Para controlar que el usuario introduce algún valor a un campo, dado que trabajamos con <i>String</i>, nos enfocamos en la longitud de ese valor:</p>
                            <pre class="line-numbers"><code class="language-java">if (request.getParameter("salarioEmpleado").length() == 0)
//lanzamos mensaje || realizamos acción                    
</code></pre><br>
                            <p>&#149; Con la versión 8 de JDK, se rediseñaron gran parte de las funcionalidades de Java. La incorporación de las interfaces  
                                <a href="https://docs.oracle.com/javase/8/docs/api/java/util/function/package-summary.html" target="_blank"><span class="enlaces">Function</span></a> 
                                y la clase <a href="https://docs.oracle.com/javase/8/docs/api/java/util/stream/Stream.html" target="_blank"><span class="enlaces">Stream</span></a> 
                                abrieron nuevas puertas a los programadores para trabajar con este lenguaje como nunca se había hecho. 
                                <br>Otra importante mejora fue el tratamiento de fechas. En este sentido, vamos a saludar a algunas de las nuevas 
                                funcionalidades introducidas en la clase <i>Enum</i> como
                                <a href="https://docs.oracle.com/javase/8/docs/api/java/time/format/TextStyle.html" target="_blank"><span class="enlaces">TextStyle</span></a>,
                                <a href="https://docs.oracle.com/javase/8/docs/api/java/time/Month.html" target="_blank"><span class="enlaces"> Month</span></a>, o
                                <a href="https://docs.oracle.com/javase/8/docs/api/java/time/Month.html" target="_blank"><span class="enlaces"> DayOfWeek</span></a>.
                                Pero antes de esto, debemos decir:
                                <br>¡ Hola, 
                                <a href="https://docs.oracle.com/javase/8/docs/api/java/time/LocalDate.html" target="_blank"><span class="enlaces">LocalDate</span> !</a></p>
                            <pre class="line-numbers"><code class="language-java">/*
Toda fecha puede recoger como mínimo 3 argumentos: día, mes y año.  Ya que recibimos una 
cadena de caracteres, a través de un "input" tipo "date" (dd-MM-yyy), 
podremos transformarla en un array, ayudándonos del método split(). 
La conversión a datos de tipo "fecha" es tan sencilla como se lee.
*/
String[] fecha = request.getParameter("fechaNacimientoEmpleado").split("-");
LocalDate fechaNacimiento = LocalDate.of(Integer.parseInt(fecha[0]), 
                        Integer.parseInt(fecha[1]), 
                        Integer.parseInt(fecha[2]));     
/*
Una vez hemos validado que el usuario ha introducido un valor para el campo
fecha:
*/
request.getParameter("fechaNacimientoEmpleado").length() != 0
/*
procedemos a guardarlo en la variable que corresponda en nuestro
programa, para después devolver este valor al usuario en caso de que 
lo precise. En ese momento será cuando requiramos de "TextStyle", "Month" y
"DayOfWeek".
*/ 
 datosEmpleado.append("<p>&#149; <b>Nombre de empleado</b>: " + empleado.getNombre() + "</p><p><p>&#149; <b>Fecha de nacimiento</b>: "
    + empleado.getFechaDeNacimiento().getDayOfWeek().getDisplayName(TextStyle.FULL, new Locale("es", "ES"))
    + " " + empleado.getFechaDeNacimiento().getDayOfMonth()
    + " de " + empleado.getFechaDeNacimiento().getMonth().getDisplayName(TextStyle.FULL, new Locale("es", "ES"))
    + " de " + empleado.getFechaDeNacimiento().getYear()
    + "</p><p>&#149; <b>Salario</b>: " + empleado.getSalario()</p></div>     
</code></pre><br>
                            </div>
                            </div>

                            </main>
                            <footer>
                                <div class="info-pag">
                                    <p>Sitio creado por Manuel Guill&eacute;n Gallardo</p>
                                    <p>Alumno de DAW 2</p>
                                    <p>30 / 09 / 2021</p>
                                </div>
                                <div class="info-pag">
                                    <p>Asignatura: Desarrollo web en entorno servidor</p>
                                    <p>Profesor: Jesús García Garijo</p>
                                    <p>IES Albarregas (Mérida)</p>
                                </div>
                            </footer>
                            <script type="text/javascript" src="../javascript/buscador.js"></script>
                            <script type="text/javascript" src="../javascript/prism.js"></script>
                            </body>
