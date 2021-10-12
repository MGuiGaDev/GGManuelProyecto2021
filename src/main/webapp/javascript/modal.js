/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


const abrir = document.getElementById("botonInfo");
const contenedorModal = document.getElementById("contenedorModal");
const cerrar = document.getElementById("cerrarInfoModal");


abrir.addEventListener("click", () => {
   contenedorModal.classList.add("show"); 
});

cerrar.addEventListener('click', () => {
   contenedorModal.classList.remove("show"); 
});