
class Torneo{

    constructor(ajax,method,url,asynchronus){
        ajax=this.ajax; 
        method=this.method;
        url=this.url;
        asynchronus=this.asynchronus;
    }

    llenarDropdown(){
        let dropdown1Deporte = document.getElementById('dropdownMenuButton-deporte').value;
        localStorage.setItem('Deporte', dropdown1Deporte);
        localStorage.removeItem('IdTorneo');
        
        if (dropdown1Deporte== 'Elegir Deporte') {
            document.getElementById("mostrarErrorDeporte").innerHTML = '<p style="color:red;">Seleccione un Deporte</p>';
            document.getElementById("mostrarError").innerHTML = '<p style="color:red;">Seleccione un Torneo</p>';
            document.getElementById("nameTorneo").innerHTML = 'TORNEO';
            document.getElementById("Deporte").innerHTML = 'No hay datos';
            document.getElementById("Lugar").innerHTML = 'No hay datos';
            document.getElementById("FechaInicio").innerHTML = 'No hay datos';
            document.getElementById("FechaFinal").innerHTML = 'No hay datos';
            document.getElementById("CantidadEquipos").innerHTML = 'No hay datos';
            document.getElementById("dropdownMenuButton-deporte2").innerHTML += '<option>Elegir Torneo</a>';
        }

        if(dropdown1Deporte != 'Elegir Deporte'){
            document.getElementById("mostrarErrorDeporte").innerHTML = '';
            let dropvalue = localStorage.getItem('Deporte');
            let  dropvalueSend = JSON.stringify(dropvalue);

            let tournament = localStorage.getItem('NombreTorneo');

            let NombreTournament = JSON.stringify(tournament);

            ajax.open(method, url, asynchronus); 
            
            jQuery.get(url, {Deporte: dropvalueSend, NombreTorneo: NombreTournament}, function(data) 
            { 
                let dat = JSON.parse(data);
                localStorage.removeItem('Deporte');
                document.getElementById("dropdownMenuButton-deporte2").innerHTML = '';
                document.getElementById("dropdownMenuButton-deporte2").innerHTML += '<option>Elegir Torneo</a>';
                for(var i=0;Object.entries(dat[i].nombre);i++){
                    document.getElementById("dropdownMenuButton-deporte2").innerHTML += '<option id="'+i+'">'+dat[i].nombre+'</option>';
                }
                
                
                
            }).fail(function() 
            { 
            alert("Algo salió mal cargando los datos..."); 
            }); 

        }

    }

    llenarTorneo(){
        let torneoNombre = document.getElementById('dropdownMenuButton-deporte2').value; 
        localStorage.setItem('NombreTorneo', torneoNombre);

        let tournament = localStorage.getItem('NombreTorneo');

        let NombreTournament = JSON.stringify(tournament);
        let dropvalue = localStorage.getItem('Deporte');
        let dropvalueSend = JSON.stringify(dropvalue);

        
        
        ajax.open(method, url, asynchronus); 
            
        jQuery.get(url, {Deporte: dropvalueSend, NombreTorneo: NombreTournament}, function(data) 
        { 
            let dat = JSON.parse(data);
            localStorage.removeItem('IdTorneo');
            if (dropvalue != 'Elegir Torneo') {
                document.getElementById("mostrarError").innerHTML = '';
                document.getElementById("nameTorneo").innerHTML = dat[0].nombre;
                document.getElementById("Deporte").innerHTML = dat[0].nombre_dep;
                document.getElementById("Lugar").innerHTML = dat[0].lugar;
                document.getElementById("FechaInicio").innerHTML = dat[0].fecha_inicio;
                document.getElementById("FechaFinal").innerHTML = dat[0].fecha_final;
                document.getElementById("CantidadEquipos").innerHTML = dat[0].cantidad_equipos;

                localStorage.setItem('IdTorneo', dat[0].id_torneo);
                
                init.mostrarPartidos();
                
                
                
            }

            if (dat == 'Error cargando los datos.') {
                document.getElementById("mostrarError").innerHTML = '<p style="color:red;">Seleccione un equipo</p>';
                document.getElementById("nameTorneo").innerHTML = 'TORNEO';
                document.getElementById("Deporte").innerHTML = '';
                document.getElementById("Lugar").innerHTML = '';
                document.getElementById("FechaInicio").innerHTML = '';
                document.getElementById("FechaFinal").innerHTML = '';
                document.getElementById("CantidadEquipos").innerHTML = '';
                
                
            }



        }).fail(function() 
        { 
        alert("Algo salió mal cargando los datos..."); 
        });
    }

    mostrarPartidos(){
        
        let id_torneo = localStorage.getItem('IdTorneo');
        let id_tournament = JSON.stringify(id_torneo);

        ajax.open(method, url, asynchronus); 
            
        jQuery.get(url, {IdTorneo: id_tournament}, function(data2) 
        { 
            let datos = JSON.parse(data2);
            
            document.getElementById('infoPartidos').remove();
            document.getElementById('partido').innerHTML = '';

            
            
            
            datos.filter(function(elem){
                
                for (let i=1; i<elem.id_partido.length;i++) {
                    
                    if(elem.id_partido==i){
                        
                        if (!document.getElementById("horario"+i)) {

                            document.getElementById('partido').innerHTML +=
                            
                            '<div class="col-md-12 mb-4" style="border-top: 2px solid rgba(4, 99, 143, 0.747); border-bottom: 2px solid rgba(4, 99, 143, 0.747); padding-bottom:10px;">'+
                            '<div class="col-md-12 text-white">'+
                            '<div class="row mx-auto" id="hola'+i+'">'+
                            '<div class="col-md-12 bg-light text-dark textoFecha" ><strong>Fecha:</strong> '+elem.fecha+'</div>'+
                            '<div class="col-md-12 bg-light text-dark textoFecha" id="horario'+i+'"><strong>Hora de inicio:</strong>'+elem.hora_inicio+'<br><strong>Fin del juego: </strong>'+elem.hora_fin+'<br></div>'+
                            '</div>'+
                            '</div>';

                            if (elem.id_actuacion) {
                                document.getElementById('horario'+i).innerHTML += 
                                '<p style="color:black"><strong>Estado:</strong> FINALIZADO</p>';
                            }
                            
                            
                        }
                        
                        if(elem.id_actuacion){
                            document.getElementById('hola'+i).innerHTML +=
                                
                                '<div class="contenidoPartidos col-md-6 bg-light">'+
                                    '<div class="card-deck col-md-6 mx-auto" id="partido'+elem.id_partido+'"">'+
                                        '<div class="card border-info " style="max-width: 18rem;">'+
                                            '<div class="card-header" id="resultado'+elem.nombre_equipo+'">'+elem.nombre_equipo+'</div>'+
                                            '<div class="card-body text-info">'+
                                                '<img class="imagen" src="../../../imagenes/funcionalidades/escudo1.jpg" alt="equipo">'+
                                            '</div>'+
                                            '<div class="card-text" style="color:black;"><strong>ANOTACIONES</strong></div>'+
                                            '<div class="card-text bg-black borderPartidos"id="valorResultado'+elem.nombre_equipo+'"></div>'+
                                        '</div>'+
                                    '</div>'+
                                '</div>';
                                
                                
                            
                                

                            if (elem.gano != null) {
                                var element = document.getElementById('resultado'+elem.nombre_equipo);
                                
                                element.classList.add('cabezeraColorGano');
                                document.getElementById('valorResultado'+elem.nombre_equipo).innerHTML += elem.anotaciones;
                            }

                            if (elem.perdio != null){
                                var element = document.getElementById('resultado'+elem.nombre_equipo);
                                element.classList.add('cabezeraColorPerdio');
                                document.getElementById('valorResultado'+elem.nombre_equipo).innerHTML += elem.anotaciones;
                            }

                            if (elem.empato != null){
                            var element = document.getElementById('resultado'+elem.nombre_equipo);
                                element.classList.add('cabezeraColorEmpato');
                                document.getElementById('valorResultado'+elem.nombre_equipo).innerHTML += elem.anotaciones;
                            }
                        }
                        
                        if (!elem.id_actuacion) {
                            '<div class="contenidoPartidos col-md-6">'+
                                    '<div class="card-deck col-md-6 mx-auto" id="partido'+elem.id_partido+'"">'+
                                        '<div class="card border-info " style="max-width: 18rem;">'+
                                            '<div class="card-header" id="resultado'+elem.nombre_equipo+'">'+elem.nombre_equipo+'</div>'+
                                            '<div class="card-body text-info">'+
                                                '<img class="imagen" src="../../../imagenes/funcionalidades/escudo1.jpg" alt="equipo">'+
                                            '</div>'+
                                        '</div>'+
                                    '</div>'+
                            '</div>';

                        }

                        
                        
                    
                        
                        
                           
                         
                        
                    }
                    
                    
                }

                
                
                
            });
            
           
            
            
        }).fail(function() 
        { 
        alert("Algo salió mal cargando los datos..."); 
        });

    }

    mostrarDataPartidos(){

    }
    

}

var ajax = new XMLHttpRequest();
var method = "GET";
var url = "../../../../Backend/App/Controladores/torneoController.php";
var asynchronus = true;

const init = new Torneo;



