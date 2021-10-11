/**
 * @author [Manuel Guillén Gallardo]
 * @email [mguigadev@gmail.com]
 * @create date 07-10-2021 09:38:30
 * @modify date 07-10-2021 11:14:27
 * @desc [Funcionalidades extra de la página]
 */


const urls = [
    n = {
        nombre: "html/cicloDeVida.html",
        p: "ciclo"
    },
    n2 = {
        nombre: "html/informacionMetodo.html",
        p: "informacion"
    },

    n3 = {
        nombre: "html/creacionFormulario.html",
        p: "formulario"
    },
    n4 = {
        nombre: "jsp/calculadora.jsp",
        p: "calculadora"
    },
    n5 = {
        nombre: "jsp/saludo.jsp",
        p: "saludo"
    },
    n6 = {
        nombre: "jsp/edad.jsp",
        p: "edad"
    },
    n7 = {
        nombre: "jsp/calculadoraBasica.jsp",
        p: "basica"
    },
    n8 = {
        nombre: "jsp/miNombreEnCookies.jsp",
        p: "cookies"
    }];
let botonBuscar = document.getElementById("boton-buscador");

function respuestaBuscador() {
    let palabraBuscador = document.getElementById("buscador").value;
    let x = urls.find(element => element.p.includes(palabraBuscador));
    botonBuscar.href = x.nombre;

}
botonBuscar.onclick = respuestaBuscador();