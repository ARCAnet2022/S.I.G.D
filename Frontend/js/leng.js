
function codeAdress() {
  localStorage.setItem("lang",'esp');
  let lengua = localStorage.getItem("lang");
  let ing = document.getElementById('imagenING');
          let esp = document.getElementById('imagenESP');
           
            if (lengua == 'esp') {
              $(ing).hide();
              $(esp).show()
              

            }

            if (lengua == 'ing') {
              $(ing).show();
              $(esp).hide()
              

            }
  $.getJSON("js/lenguaje.json", function(json){
   //Lenguaje por defecto de la página sessionStorage.setItem("lang", "idioma")"
   $('.lenguaje').each(function(index, value){
    $(this).text(json[lengua][$(this).attr('data-key')]);
    });
  if(!localStorage.getItem("lang")){
    localStorage.setItem("lang", "esp");
  }
 

  $('.lang').each(function(index, value){
    $(this).text(json[lengua][$(this).attr('data-key')]);
  });//Each

  $('.idioma').click(function(){
    let lang = $(this).attr('id');
    localStorage.setItem("lang", lang);
    lengua = lang;
    
    let ing = document.getElementById('imagenING');
    let esp = document.getElementById('imagenESP');

      if (lengua == 'esp') {
        $(ing).hide();
        $(esp).show()
        

      }

      if (lengua == 'ing') {
        $(ing).show();
        $(esp).hide()
        

      }
    
    
    
    
    $('.lenguaje').each(function(index, value){
      $(this).text(json[lang][$(this).attr('data-key')]);
      }); 

  }); //
  });//Get json AJAX
}
window.onload= codeAdress;

