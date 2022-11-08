
function codeAdress() {
  let lengua = localStorage.getItem("lang");

  let ing = document.getElementById('historia_ing');
  let ing1 = document.getElementById('regla_1ing');
  let ing2 = document.getElementById('regla_2ing');
  let ing3 = document.getElementById('regla_3ing');
  let ing4 = document.getElementById('uruguay_ing');

  
  let esp = document.getElementById('historia_esp');
  let esp1 = document.getElementById('regla_1esp');
  let esp2 = document.getElementById('regla_2esp');
  let esp3 = document.getElementById('regla_3esp');
  let esp4 = document.getElementById('uruguay_esp');

            if (lengua == 'esp') {
              $(ing).hide();
              $(esp).show();

              $(ing1).hide();
              $(esp1).show();

              $(ing2).hide();
              $(esp2).show();

              $(ing3).hide();
              $(esp3).show();

              $(ing4).hide();
              $(esp4).show();
            }

            if (lengua == 'ing') {
              $(ing).show();
              $(esp).hide();

              $(ing1).show();
              $(esp1).hide();

              $(ing2).show();
              $(esp2).hide();

              $(ing3).show();
              $(esp3).hide();

              $(ing4).show();
              $(esp4).hide();
            

            }
    $.getJSON("../../../js/lenguaje.json", function(json){
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
        
        let ing = document.getElementById('historia_ing');
        let esp = document.getElementById('historia_esp');

        let ing1 = document.getElementById('regla_1ing');
        let esp1 = document.getElementById('regla_1esp');

        let ing2 = document.getElementById('regla_2ing');
        let esp2 = document.getElementById('regla_2esp');

        let ing3 = document.getElementById('regla_3ing');
        let esp3 = document.getElementById('regla_3esp');

        let ing4 = document.getElementById('uruguay_ing');
        let esp4 = document.getElementById('uruguay_esp');
     

          if (lengua == 'esp') {
            $(ing).hide();
            $(esp).show();

            $(ing1).hide();
            $(esp1).show();

            $(ing2).hide();
            $(esp2).show();

            $(ing3).hide();
            $(esp3).show();

            $(ing4).hide();
            $(esp4).show();

          }

          if (lengua == 'ing') {
            $(ing).show();
            $(esp).hide();

            $(ing1).show();
            $(esp1).hide();
         
            $(ing2).show();
            $(esp2).hide();

            $(ing3).show();
            $(esp3).hide();

            $(ing4).show();
            $(esp4).hide();


          }
        
        
        
        
        $('.lenguaje').each(function(index, value){
          $(this).text(json[lang][$(this).attr('data-key')]);
          }); 

      }); //Funcion click


      
    });//Get json AJAX
  }
  window.onload= codeAdress;
  