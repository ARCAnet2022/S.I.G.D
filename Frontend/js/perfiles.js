class Profile{

    constructor(ajax,method,url,asynchronus){
        ajax=this.ajax; 
        method=this.method;
        url=this.url;
        asynchronus=this.asynchronus;
    }

    profileUsuario(dat){
        document.getElementById("nombre").innerHTML = dat[0].nombre;
        document.getElementById("apellido").innerHTML = dat[0].apellido;
        document.getElementById("fecha_nac").innerHTML = dat[0].fecha_nac;
        document.getElementById("ci_usuario").innerHTML = dat[0].ci_usuario;
        document.getElementById("nacionalidad").innerHTML = dat[0].nacionalidad;
        document.getElementById("telefono").innerHTML = '0'+dat[0].telefono;
        document.getElementById("email").innerHTML = dat[0].email;
        document.getElementById("ciudad").innerHTML = dat[0].ciudad;
        document.getElementById("calle").innerHTML = dat[0].calle;
        document.getElementById("numero").innerHTML = dat[0].numero;  
    }
    

    
    showProfile(){
        
        
        ajax.open(method, url, asynchronus);


        let ci = localStorage.getItem("ci_usuario");
        let deportista = localStorage.getItem("ci_deportista");
        let ci_deportista = JSON.stringify(deportista);
        let ci_usuario = JSON.stringify(ci);

        jQuery.get(url, {tipo: ci_usuario, tipo2: ci_deportista}, function(data) 
        { 
            let dat = JSON.parse(data);
            
            if (dat[1] == 'administrador') {
                
                init.profileUsuario(dat);
                document.getElementById("experiencia").innerHTML = dat[0].experiencia+' Años';
                document.getElementById("horas_trabajo_semanales").innerHTML = dat[0].horas_trabajo_semanales+' Horas';

            }else if(dat[1] == 'administrativo'){
                
                init.profileUsuario(dat);
                document.getElementById("horas_trabajo_semanales").innerHTML = dat[0].horas_trabajo_semanales+' Años';
                document.getElementById("nro_funcionario").innerHTML = dat[0].nro_funcionario+' Horas';

            }else if(dat[1] == 'analista'){

                init.profileUsuario(dat);
                document.getElementById("nro_funcionario").innerHTML = '#'+dat[0].nro_funcionario;
                document.getElementById("horas_trabajo_semanales").innerHTML = dat[0].horas_trabajo_semanales+' Horas';
                
            }else if(dat[1] == 'entrenador'){

                init.profileUsuario(dat);

            }else if(dat[1] == 'scout'){

                init.profileUsuario(dat);

            }else if(dat[1] == 'juez'){

                init.profileUsuario(dat);

            }else if(dat[1] == 'deportista'){

                init.profileUsuario(dat);
            }
        

            
            
            
        }).fail(function() 
        { 
        alert("Algo salió mal cargando los datos..."); 
        }); 
        

    }
}


var ajax = new XMLHttpRequest();
var method = "GET";
var url = "../../../../Backend/App/Controladores/profileController.php";
var asynchronus = true;

const init = new Profile(ajax,method,url,asynchronus);
init.showProfile();