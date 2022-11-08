arrayUsers = [];
o = 0;
arrayPartidos = [];
ci_juez= '';
class analistaCargarCampeonato{

    juecesDisponibles(){
        
        document.getElementById('myTable').innerHTML = "";
        
        ajax.open(method, url, asynchronus); 


        jQuery.get(url, {}, function(data) 
        { 
            let dat = JSON.parse(data);
                
            
            for (let i=0; Object.entries(dat);i++) {
                arrayUsers.push({nombre: dat[i].nombre, apellido:dat[i].apellido, cedula:dat[i].ci_usuario});

                    document.getElementById('myTable').innerHTML +=
                    '<tr>'+
                        '<td id="'+i+"-"+dat[i].nombre+'">'+dat[i].nombre+'</td>'+
                        '<td id="'+i+"-"+dat[i].apellido+'">'+dat[i].apellido+'</td>'+
                        '<td id="'+i+"-"+dat[i].ci_usuario+'">'+dat[i].ci_usuario+'</td>'+
                        '<td><button type="button" data-toggle="modal" data-target="#myModal'+i+'" class="btn btn-outline-info bg-light btn-sm" id="'+dat[i].ci_usuario+'" onclick="javascript:init.seleccionadoJuez('+dat[i].ci_usuario+');">Seleccionar</button></td>'+
                    '</tr>';
                    
            }
            if (dat == 'Datos cargados con exito.') {
                        
                document.getElementById('mostrarForm').setAttribute("class", "alert alert-success mx-auto");
                document.getElementById('mostrarForm').innerHTML = 'Datos cargados con exito!';
                document.getElementById('mostrarForm').setAttribute("style","display:grid; justify-content:center;");
                
                setTimeout(function(){
                    window.location.reload();
                }, 2000);
                
            }
            

        }).fail(function() 
        { 
        alert("Algo salió mal cargando los datos..."); 
        });

    }

    agregarPartido(){
        /*Almacenar valor de cada partido en una global y enviar al controlador.*/
        o++;
        document.getElementById('mostrarForms').innerHTML+=
        '<tr>'+
            '<td>'+
                '<input type="text" class="form-control" placeholder="Nombre del equipo" id="nombre_equipo1'+o+'" name="nombre_equipo1'+o+'">'+
            '</td>'+
            '<td>'+
                '<input type="time" class="form-control" id="hora_inicio'+o+'" name="hora_inicio'+o+'">'+
            '</td>'+
            '<td>'+
                '<input type="time" class="form-control" id="hora_fin'+o+'" name="hora_fin'+o+'">'+
            '</td>'+
            '<td>'+
                '<input type="date" class="form-control" id="fecha'+o+'" name="fecha'+o+'">'+
            '</td>'+
            '<td>'+
                '<input type="text" class="form-control" placeholder="Nombre del equipo" id="nombre_equipo2'+o+'" name="nombre_equipo2'+o+'">'+
            '</td>'+
        '</tr>';
        arrayPartidos += [['nombre_equipo1'+o, 'nombre_equipo2'+o]];
        
        
    }

    seleccionadoJuez(ci_usuario){
        let botonSelect = document.getElementById(ci_usuario);
        botonSelect.innerHTML = 'Seleccionado';
        ci_juez= ci_usuario;
    }

    cargarTorneo(){
        let nombre_torneo = document.getElementById('nombre_torneo').value;
        let name_torneo = JSON.stringify(nombre_torneo);

        let dropdownTorneo = document.getElementById('dropdownMenuButton-deporte').value;
        let deporte = JSON.stringify(dropdownTorneo);
        
        let fechaInicio = document.getElementById('fecha_inicio').value;
        let fecha_inicio = JSON.stringify(fechaInicio);

        let fechaFin = document.getElementById('fecha_fin').value;
        let fecha_fin = JSON.stringify(fechaFin);

        let place = document.getElementById('lugar').value;
        let lugar = JSON.stringify(place);

        let ci_analista = localStorage.getItem('ci_usuario');
        let ci_analis = JSON.stringify(ci_analista);
        
        jQuery.get(url, {nombre_torneo: name_torneo, deporte: deporte, fecha_inicio: fecha_inicio, fecha_fin: fecha_fin, lugar: lugar, ci_analista: ci_analis}, function(data) 
        { 
            let dat = JSON.parse(data);

            if (dat == 'Datos cargados con exito...') {
                        
                document.getElementById('mostrarForm').setAttribute("class", "alert alert-success mx-auto");
                document.getElementById('mostrarForm').innerHTML = 'Datos cargados con exito!';
                document.getElementById('mostrarForm').setAttribute("style","display:grid; justify-content:center;");
                
                setTimeout(function(){
                    window.location.reload();
                }, 2000);
                
            }else{
                document.getElementById('mostrarForm').setAttribute("class", "alert alert-danger mx-auto");
                document.getElementById('mostrarForm').innerHTML = 'No se cargaron los datos!';
                document.getElementById('mostrarForm').setAttribute("style","display:grid; justify-content:center;");
                setTimeout(function(){
                    window.location.reload();
                }, 2000);
            }

        }).fail(function() 
        { 
            alert("Algo salió mal cargando los datos..."); 
        });

        init.cargarPartidos();
    }

    cargarPartidos(){
        
        
        for (let i=1; i<arrayPartidos.length;i++) {
            let ci_analis = localStorage.getItem('ci_usuario');
            let ci_analista = JSON.stringify(ci_analis);

            let nombreEquipo1 = document.getElementById('nombre_equipo1'+i).value;
            let nameEquipo = JSON.stringify(nombreEquipo1);

            let nombreEquipo2 = document.getElementById('nombre_equipo2'+i).value;
            let nameEquipo2 = JSON.stringify(nombreEquipo2);

            let hora_inicio = document.getElementById('hora_inicio'+i).value;
            let hora_start = JSON.stringify(hora_inicio);

            let lugar = document.getElementById('lugar').value;
            let lug = JSON.stringify(lugar);

            let hora_fin = document.getElementById('hora_fin'+i).value;
            let hora_end = JSON.stringify(hora_fin);

            let fecha = document.getElementById('fecha'+i).value;
            let date = JSON.stringify(fecha);

            let juez =JSON.stringify(ci_juez);
            

            let nameTorneo = document.getElementById('nombre_torneo').value;
            let nombre_torneo = JSON.stringify(nameTorneo);
                ajax.open(method, url, asynchronus); 


                jQuery.get(url, {ci_analista:ci_analista, nombre_equipo: nameEquipo, nombre_equipo2: nameEquipo2, hora_inicio: hora_start, hora_fin: hora_end, fecha: date,
                    ci_juez:juez, lugar: lug, nombre_tournament: nombre_torneo}, function(data) 
                { 
                    let dat = JSON.parse(data);

                    if (dat == 'Datos cargados con exito.') {
                        
                        document.getElementById('mostrarForm').setAttribute("class", "alert alert-success mx-auto");
                        document.getElementById('mostrarForm').innerHTML = 'Datos cargados con exito!';
                        document.getElementById('mostrarForm').setAttribute("style","display:grid; justify-content:center;");
                        
                        setTimeout(function(){
                            window.location.reload();
                        }, 2000);
                        
                    }

                }).fail(function() 
                { 
                alert("Algo salió mal cargando los datos..."); 
                });

            }
        }

        

    limpiarPartidos(){
        o=0;
        document.getElementById('mostrarForms').innerHTML = '';
    }

}

var ajax = new XMLHttpRequest();
var method = "POST";
var url = "../../../../Backend/App/Controladores/AnalistaCargarCampeonatoController.php";
var asynchronus = true;

const init = new analistaCargarCampeonato;

init.juecesDisponibles();