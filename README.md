![cabecera](imagenesReadme/cabecera.PNG)


<hr style="height: 5px; background: #24292F;">

# Contenidos

1. [Introducción](#introduccion)
2. [Herramientas](#herramientas)
3. [Estado de los ejercicios](#estado)
4. [Ejercicios con``SERVLET``](#servlet)
5. [Ejercicios con ``JSP``]( #jsp)
6. [Recursos](#recursos)

<hr style="height: 5px; background: #24292F;"><a name="introduccion"></a>

# 1. Introducción

En este repositorio vamos a ir acumulando todos los **ejercicios** que realizamos sobre **``SERVLETS`` y ``JSP``**. 

En la medida de lo posible, se tratará de ofrecer con cada ejercicio no solamente su solución, sino un apartado de **observaciones** en el que describir aquellos **fragmentos de código más significativos**.

Del mismo modo, se tratará de construir tres apartados extra: 

- ``Notas`` : Recoge ordenadamente las direcciones a páginas ``html`` en las que se expondrán los **aspectos más importantes del repositorio**.
- ``Información``: Ventana flotante que muestra un **esquema del sitio web** y explica como moverse en él.
- ``Buscador``: Funcionalidad que nos permitirá **encontrar ejercicios** que contienen elementos relacionados.

Los ejercicios pueden presentar 4 estados:

![](https://img.shields.io/badge/build-failing-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=db4949) 

​		- Existe algún **error** grave (o errores) que debo corregir.

![](https://img.shields.io/badge/build-passing-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=2bbc8a) 

​		- Después de haber sido **realizados y revisados** en clase, alcanzan este estado si no existe nada que deba cambiar en ellos.

![](https://img.shields.io/badge/build-in%20progress-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=8cd3f6) 

​		- Presentan **irregularidades** en el estilo o el código implementado.

![](https://img.shields.io/badge/build-unknown-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=f0f68c) 

​		- Cuando estén **pendientes de la corrección**  en clase.



<hr style="height: 5px; background: #24292F;"><a name="herramientas"></a>

# 2. Herramientas

![(imagenesReadme/java.svg)](https://img.shields.io/badge/code-Java-informational?style=flat&logo=java&logoColor=white&color=2bbc8a)  ![(imagenesReadme/javascript.svg)](https://img.shields.io/badge/code-JavaScript-informational?style=flat&logo=javascript&logoColor=white&color=2bbc8a) ![(imagenesReadme/css3.svg)](https://img.shields.io/badge/code-CSS3-informational?style=flat&logo=css3&logoColor=white&color=2bbc8a)  ![(imagenesReadme/html5.svg)](https://img.shields.io/badge/code-HTML5-informational?style=flat&logo=html5&logoColor=white&color=2bbc8a)  ![(imagenesReadme/apachenetbeanside.svg)](https://img.shields.io/badge/ide-NetBeans-informational?style=flat&logo=apachenetbeanside&logoColor=white&color=2bbc8a) ![(imagenesReadme/apachetomcat.svg)](https://img.shields.io/badge/server-TomCat-informational?style=flat&logo=apachetomcat&logoColor=white&color=2bbc8a)



<hr style="height: 5px; background: #24292F;"><a name="estado"></a>

# 3. Estado de los ejercicios

| SERVLET                            | ESTADO                                                       | JSP                          | ESTADO                                                       |
| ---------------------------------- | ------------------------------------------------------------ | ---------------------------- | ------------------------------------------------------------ |
| 1. Hola Mundo                      | ![](https://img.shields.io/badge/build-passing-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=2bbc8a) | 1. Calculadora muy básica    | ![](https://img.shields.io/badge/build-passing-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=2bbc8a) |
| 2. Ciclo de vida (Servlet)         | ![](https://img.shields.io/badge/build-passing-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=2bbc8a) | 2. Saludo                    | ![](https://img.shields.io/badge/build-passing-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=2bbc8a) |
| 3. Formulario Simple               | ![](https://img.shields.io/badge/build-passing-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=2bbc8a) | 3. Edad de una personas      | ![](https://img.shields.io/badge/build-passing-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=2bbc8a) |
| 4. Formulario Complejo             | ![](https://img.shields.io/badge/build-passing-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=2bbc8a) | 4. Calculadora básica        | ![](https://img.shields.io/badge/build-in%20progress-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=8cd3f6) |
| 5. Reservas                        |                                                              | 5. Monedero                  |                                                              |
| 6. Registro                        |                                                              | 6. Mi nombre con cookies     | ![](https://img.shields.io/badge/build-failing-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=db4949) |
| 7. Cabeceras de petición           | ![](https://img.shields.io/badge/build-passing-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=2bbc8a) | 7. Gestión de cookies        | ![](https://img.shields.io/badge/build-failing-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=db4949) |
| 8. Contador de visitas (cookie)    | ![](https://img.shields.io/badge/build-unknown-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=f0f68c) | 8. Gestión de sesiones       | ![](https://img.shields.io/badge/build-unknown-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=f0f68c) |
| 9. Contador de visitas (sesiones)  | ![](https://img.shields.io/badge/build-unknown-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=f0f68c) | 9. Proceso de identificación |                                                              |
| 10. Información del cliente        |                                                              | 10. Carrito de la compra     |                                                              |
| 11. Configurando los Servlets      |                                                              |                              |                                                              |
| 12. Gestión declarativa de errores |                                                              |                              |                                                              |
| 13. Leer fichero                   |                                                              |                              |                                                              |



<hr style="height: 5px; background: #24292F;"><a name="servlet"></a>

# 4. Ejercicios para ``SERVLETS``

## Ciclo de vida de un Servlet

- **Archivos**: ``cicloDeVida.html`` y ``CicloDeVida.java``.
- **Funcionalidad**: Programa que emite por consola un mensaje distinto según el estado de un ``servlet``.

- **Finalidad**: Añadir un mensaje distinto de tipo ``System.out``  a cada uno de estos métodos: ``init(ServletConfig config);`` ,  ``service(ServletRequest request, ServletResponse response);`` y `` destroy()``. De este modo, al inicializar nuestro Servlet desde el archivo ``.html``, si observamos la consola podemos ver como cambia aparece un mensaje según el estado: inicializado por primera vez (``init``), inicializado más de una vez (``service``), finalizado (``destroy``).

![cicloDeVida](imagenesReadme/cicloDeVida.PNG)

![image-20211005094630332](imagenesReadme/estoyEnInit.PNG)



## Formulario simple

- **Archivos**: ``informacionMetodo.html``, ``Informacion.java`` y ``MetodoEnvio.java``.
- **Funcionalidad:** Programa que gestiona distintos tipos de peticiones y toma valores contextuales.
- **Finalidad:** Pasar parámetros mediante ``href`` y ``method:post`` a nuestro ``servlet``. Este hecho determina que para el manejo de nuestros datos debamos usar convenientemente los métodos ``doGet()`` y ``doPost()``. 

![enumerationFormularioSimple](imagenesReadme/codigoDatosFormulario.png)

## Formulario Complejo

- **Archivos**:
- **Funcionalidad**:
- **Finalidad**:



![formularioComplejo](imagenesReadme/formularioComplejo.PNG)



![datosFormulario](imagenesReadme/datosFormulario.PNG)

![codigoDatosFormulario](imagenesReadme/codigoDatosFormulario.png)

## Reservas

- **Archivos**:
- **Funcionalidad**:
- **Finalidad**:

## Registro

- **Archivos**:
- **Funcionalidad**:
- **Finalidad**:

## Cabeceras de petición

- **Archivos**:
- **Funcionalidad**:
- **Finalidad**:

## Información del cliente

- **Archivos**:
- **Funcionalidad**:
- **Finalidad**:

## Configurando los Servlets 

- **Archivos**:
- **Funcionalidad**:
- **Finalidad**:

## Gestión declarativa de errores

- **Archivos**:
- **Funcionalidad**:
- **Finalidad**:

##  Leer fichero

- **Archivos**:
- **Funcionalidad**:
- **Finalidad**:



<hr style="height: 5px; background: #24292F;"><a name="jsp"></a>

# 5. Ejercicios para ``JSP``



## Saludo

- **Archivos**:
- **Funcionalidad**:
- **Finalidad**:

![saludoFormulario.PNG](imagenesReadme/saludoFormulario.PNG)



![saludoRespuesta.PNG](imagenesReadme/saludoRespuesta.PNG)



## Edad de una persona

- **Archivos**:

- **Funcionalidad**:

- **Finalidad**:
  ![edadForm.PNG](imagenesReadme/edadForm.PNG)

  

  ![edadRespuesta.PNG](imagenesReadme/edadRespuesta.PNG)



## Calculadora básica

- **Archivos**:
- **Funcionalidad**:
- **Finalidad**:



## Monedero

- **Archivos**:
- **Funcionalidad**:
- **Finalidad**:



## Mi nombre con cookies

- **Archivos**:
- **Funcionalidad**:
- **Finalidad**:



## Operaciones básicas con...

- **Archivos**:
- **Funcionalidad**:
- **Finalidad**:



## Contador de visitas con...

- **Archivos**:
- **Funcionalidad**:
- **Finalidad**:



## Proceso de identificación

- **Archivos**:
- **Funcionalidad**:
- **Finalidad**:



## Carrito de la compra

- **Archivos**:
- **Funcionalidad**:
- **Finalidad**:

<hr style="height: 5px; background: #24292F;"><a name="recursos"></a>


# 6. RECURSOS

- Para implementar ``README.md``:[towardsdatascience](https://towardsdatascience.com/build-a-stunning-readme-for-your-github-profile-9b80434fe5d7)

- Para poner iconos: [simpleicons](https://simpleicons.org)

