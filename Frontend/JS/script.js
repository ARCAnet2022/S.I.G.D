jQuery('document').ready(function($){
var hamburguesaBtn = $('.hamburguesa'),
     hamburguesa = $('.navegacion ul');

     hamburguesaBtn.click(function(){

if(hamburguesa.hasClass('show')){
    hamburguesa.removeClass('show');

} else {
    hamburguesa.addClass('show');
}


     });

});

const $desplegable  = document.getElementById("desplegable");
$aside = document.getElementById("aside");
$desplegable.addEventListener("click",()=>{
    $aside.classList.toggle("desplegar");
})

