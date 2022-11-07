class Partidos{

    constructor(ajax,method,url,asynchronus){
        ajax=this.ajax; 
        method=this.method;
        url=this.url;
        asynchronus=this.asynchronus;
    }

    mostrarPartidosJugados(){
        
        ajax.open(method, url, asynchronus);

        let dropdown1Deporte = document.getElementById('dropdownMenuButton-deporte').value;
        document.getElementById("mostrarPartido").innerHTML='';
        document.getElementById("mostrarProximos").innerHTML='';
        localStorage.setItem('Deporte', dropdown1Deporte);
        
        let ci = localStorage.getItem("ci_usuario");
        let deportista = localStorage.getItem("ci_deportista");
        let depor = localStorage.getItem("Deporte");

        localStorage.setItem("ci_usuario",ci);
        localStorage.setItem("ci_deportista",deportista);

        let ci_usuario = JSON.stringify(ci);
        let ci_deportista = JSON.stringify(deportista);
        let deporte = JSON.stringify(depor);
        localStorage.setItem('Proximos', 'false');
        
        jQuery.get(url, {ci_usuario : ci_usuario, ci_deportista : ci_deportista, deporte : deporte}, function(data) 
        { 

        let dat = JSON.parse(data);
        
        
        /*Proximos*/
        dat.filter(function(elem){
            
            
            if (elem.id_actuacion == null) {
                localStorage.setItem('id_partido', elem.id_partido);
                document.getElementById("mostrarPartido").innerHTML +=
                    '<tr>'+
                    '<td id="fecha">'+elem.fecha+'</td>'+
                    '<td id="lugar">'+elem.lugar+'</td>'+
                    '<td>'+
                    '<div class="row">'+
                    '<div class="col-md-3" id="nombre_equipo">'+
                    
                    '</div>'+
                    '<div class="col-md-2">'+
                    '<img class="foto-equipo" src="../../../imagenes/foto-equipo.png" alt="equipo1">'+
                    '</div>'+
                    '<div class="alert alert-primary col-md-3" role="alert">VS'+
                    '</div>'+
                    '<div class="col-md-2">'+
                    '<img class="foto-equipo" src="../../../imagenes/foto-equipo.png" alt="equipo2">'+
                    '</div>'+
                    '<div class="col-md-2" id="nombre_equipo">'+
                    
                    '</div>'+
                    '</div>'+
                    '</td>'+
                    '<td id="hora_inicio">'+elem.hora_inicio+' '+elem.hora_fin+'</td>'+
                    '<td id="nombre_torneo">'+elem.nombre+'</td>'+
                    '</tr>';
                
                    
                    init.mostrarRivalNoJugado();
            }         

        });

        /*Ya Jugados */
        dat.filter(function(elem){
            if (elem.id_actuacion != null) {
                localStorage.setItem('id_partido', elem.id_partido);

                    document.getElementById("mostrarProximos").innerHTML +=
                    '<tr>'+
                    '<td id="fecha">'+elem.fecha+'</td>'+
                    '<td id="lugar">'+elem.lugar+'</td>'+
                    '<td>'+
                    '<div class="row">'+
                    '<div class="col-md-3" id="nombre_equipoProximo'+i+'">'+
                    
                    '</div>'+
                    '<div class="col-md-2">'+
                    '<img class="foto-equipo" src="../../../imagenes/foto-equipo.png" alt="equipo1">'+
                    '</div>'+
                    '<div class="alert alert-primary col-md-3" role="alert">VS'+
                    '</div>'+
                    '<div class="col-md-2">'+
                    '<img class="foto-equipo" src="../../../imagenes/foto-equipo.png" alt="equipo2">'+
                    '</div>'+
                    '<div class="col-md-2" id="nombre_equipoProximo'+i+'">'+
                    
                    '</div>'+
                    '</div>'+
                    '</td>'+
                    '<td id="hora_inicio">'+elem.hora_inicio+' '+elem.hora_fin+'</td>'+
                    '<td id="nombre_torneo">'+elem.nombre+'</td>'+
                    '</tr>';
                    
                    init.mostrarRivalJugado();
                    
            }         

        });


        
        }).fail(function() 
        { 
        alert("Algo salió mal cargando los datos..."); 
        }); 
        
    }

    mostrarRivalNoJugado(){
        let partido = localStorage.getItem('id_partido');
        let id_partido = JSON.stringify(partido);

        jQuery.get(url, {id_partido: id_partido}, function(data) 
        { 
            let dat = JSON.parse(data); 
            
            for (let i=0; dat[i].rival.length; i++) {
                var element = document.getElementById("nombre_equipo");
                element.id = "nombre_equipo"+i;
                document.getElementById('nombre_equipo'+i).innerHTML +=
                dat[i].rival;
            }
            
        
        }).fail(function() 
        { 
        alert("Algo salió mal cargando los datos..."); 
        }); 
    }

    mostrarRivalJugado(){
        let partido = localStorage.getItem('id_partido');
        let id_partido = JSON.stringify(partido);
        
        jQuery.get(url, {id_partido: id_partido}, function(data) 
        { 
            let dat = JSON.parse(data);
            
            for (let i=0; dat[i].rival.length; i++) {
                alert(dat[i].rival);
                var element = document.getElementById("nombre_equipoProximo");
                element.id = "nombre_equipoProximo"+i;
                document.getElementById('nombre_equipoProximo'+i).innerHTML +=
                dat[i].rival;
            }
        

        
        
        }).fail(function() 
        { 
        alert("Algo salió mal cargando los datos..."); 
        }); 
    }

    
        
        
    


}

var ajax = new XMLHttpRequest();
var method = "GET";
var url = "../../../../Backend/App/Controladores/partidosController.php";
var asynchronus = true;

const init = new Partidos(ajax,method,url,asynchronus);
