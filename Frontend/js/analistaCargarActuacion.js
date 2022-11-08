arrayUsers=[];
id_partido='';
equipo='';
ci_juez = '';
ci_entrenador = '';
formularios='';
class AnalistaCargarActuacion{

    getEquiposBySport(){
        
        let dropdownDeporte = document.getElementById('dropdownMenuButton-deporte').value;
        
        if (dropdownDeporte != 'Elegir Deporte') {

            document.getElementById('mostrarError').innerHTML = '';
            document.getElementById('mostrarJugadores').innerHTML = '';
            
            ajax.open(method, url, asynchronus); 

            let deporte = document.getElementById('dropdownMenuButton-deporte').value;
            let sport = JSON.stringify(deporte);

            jQuery.get(url, {deporte: sport}, function(data) 
            { 
                let dat = JSON.parse(data);
                
                document.getElementById('mostrarActuaciones').innerHTML = '';
                if (dat == 'No hay datos para mostrar') {
                    document.getElementById('mostrarActuaciones').innerHTML = 
                    '<tr class="">'+
                            '<th scope="row">0</th>'+
                            '<td>No data</td>'+
                            '<td>No data</td>'+
                            '<td>No data</td>'+
                        '</tr>';
                }else{
                    for (let i=0; i<dat.length;i++) {
                        document.getElementById('mostrarActuaciones').innerHTML +=
                        '<tr id="">'+
                            '<th scope="row" id="checkData">'+dat[i].id_partido+'</th>'+
                            '<td id="'+i+'">'+dat[i].nombre_equipo+'</td>'+
                            '<td>'+dat[i].ci_juez+'</td>'+
                            '<td>'+dat[i].ci_entrenador+'</td>'+
                            '<td><button class="btn-sm boton-enviar" id="boton'+i+'" onclick="javascript:init.equipoSeleccionado('+i+','+dat[i].id_partido+','+dat[i].ci_juez+','+dat[i].ci_entrenador+');">Cargar</button></td>'+
                        '</tr>';
                    }
                }
                
                

            }).fail(function() 
            { 
            alert("Algo salió mal cargando los datos..."); 
            });

        }else{
            document.getElementById('mostrarActuaciones').innerHTML = '';
            document.getElementById('mostrarJugadores').innerHTML = '';
            document.getElementById('mostrarError').innerHTML = '<p style="color:red;" class="mx-auto">Debe seleccionar un deporte para cargar las actuaciones.</p>';
            
        }
        

    }

    equipoSeleccionado(i_team,id,ci_jue,ci_ent){
        let a = document.getElementById(i_team).innerHTML;
        equipo=a;
        id_partido=id;
        ci_juez = ci_jue;
        ci_entrenador = ci_ent;
        document.getElementById('mostrarActuaciones').innerHTML =
            '<tr id="">'+
                '<th scope="row" id="checkData">'+id_partido+'</th>'+
                '<td id="equipoAct">'+equipo+'</td>'+
                '<td>'+ci_juez+'</td>'+
                '<td>'+ci_entrenador+'</td>'+
                '<td><select name="dropdown-ganador" id="dropdown-ganador"><option class="dropdown-item" value="gano">gano</option><option class="dropdown-item" value="empato">empato</option><option class="dropdown-item" value="perdio">perdio</option></select></td>'+
                '<td><button class="btn-sm boton-enviar" id="'+id_partido+'" disabled>Seleccionado</button></td>'+
            '</tr>';
        document.getElementById('mostrarSiguiente').innerHTML =
            '<h6 class="mx-auto">A continuación cargue los datos de todas las ocurrencias del partido...</h6>';

        init.mostrarDeportistas(id_partido);
    }

    mostrarDeportistas(id_partido){

        let dropdown = document.getElementById('dropdownMenuButton-deporte').value;

        let nombre_equipo = JSON.stringify(equipo);
        let id_part = JSON.stringify(id_partido);

            if (dropdown == 'Futbol') {
                ajax.open(method, url, asynchronus); 

                jQuery.get(url, {nombre_equip: nombre_equipo, id_partid: id_part}, function(data) 
                { 
                    let dat = JSON.parse(data);

                    if (dat == 'No hay datos para mostrar') {
                        
                        document.getElementById('mostrarJugadores').innerHTML = '<div class="alert alert-danger mx-auto">Ups! Parece que no hay deportistas para mostrar...</div>';
                        setTimeout(function(){
                            window.location.reload();
                         }, 3000);
                    }else{
                        for (let i=0; i<dat.length;i++) {

                            document.getElementById('mostrarJugadores').innerHTML +=
                            '<div class="card bg-light mb-3 col-mb-4" style="max-width: 18rem;">'+
                                '<div class="card-header">'+dat[i].posicion+'</div>'+
                                '<div class="card-header">'+dat[i].nombre+' '+dat[i].apellido+'</div>'+
                                '<div class="card-header" id="ci_usuario'+i+'">'+dat[i].ci_usuario+'</div>'+
                                '<div class="card-header" id="ci_entrenador'+i+'"><strong>Entrenador: </strong>'+dat[i].ci_entrenador+'</div>'+
                            '<div class="card-body">'+
                                '<label for="anotaciones'+i+'">Anotaciones</label>'+
                                '<input type="number" class="form-control card-text" id="anotaciones'+i+'" name="anotaciones'+i+'"></input>'+
                                '<label for="pases'+i+'">Pases</label>'+
                                '<input type="number" class="form-control card-text" id="pases'+i+'" name="pases'+i+'"></input>'+
                                '<label for="asistencias'+i+'">Asistencias</label>'+
                                '<input type="number" class="form-control card-text" id="asistencias'+i+'" name="asistencias'+i+'"></input>'+
                                '<label for="quites'+i+'">Quites</label>'+
                                '<input type="number" class="form-control card-text" id="quites'+i+'" name="quites'+i+'"></input>'+
                                '<label for="tiros'+i+'">Tiros</label>'+
                                '<input type="number" class="form-control card-text" id="tiros'+i+'" name="tiros'+i+'"></input>'+
                                '<label for="faltas'+i+'">Faltas</label>'+
                                '<input type="number" class="form-control card-text" id="faltas'+i+'" name="faltas'+i+'"></input>'+
                                '<label for="tarjetaRoja'+i+'">Tarjetas Rojas</label>'+
                                '<input type="number" class="form-control card-text" id="tarjetaRoja'+i+'" name="tarjetaRoja'+i+'"></input>'+
                                '<label for="tarjetaAmarilla'+i+'">Tarjetas Amarillas</label>'+
                                '<input type="number" class="form-control card-text" id="tarjetaAmarilla'+i+'" name="tarjetaAmarilla'+i+'"></input>'+
                            '<div class="card-footer">'+
                            '</div>'+
                            '</div>'+
                            '</div>'+
                            '<div class="col-2"></div>';
                            formularios=i;
                            document.getElementById('botonEnviar').innerHTML =
                                    '<button type="button" class="btn boton-enviar mx-auto" onclick="javascript:init.enviarStatsFutbol('+id_partido+','+dat[i].ci_entrenador+','+dat[i].ci_usuario+');">Enviar</button>';
                        }
                    }
                                       
                }).fail(function() 
                { 
                alert("Algo salió mal cargando los datos..."); 
                });
            }

            if (dropdown == 'Basquetbol') {
                
                ajax.open(method, url, asynchronus); 

                jQuery.get(url, {nombre_equip: nombre_equipo, id_partid: id_part}, function(data) 
                { 
                    let dat = JSON.parse(data);
                    if (dat == 'No hay datos para mostrar') {
                        
                        document.getElementById('mostrarJugadores').innerHTML = '<div class="alert alert-danger mx-auto">Ups! Parece que no hay deportistas para mostrar...</div>';
                        setTimeout(function(){
                            window.location.reload();
                         }, 3000);
                    }else{
                        for (let i=0; i<dat.length;i++) {
                            document.getElementById('mostrarJugadores').innerHTML +=
                                '<div class="card bg-light mb-3 col-mb-4" style="max-width: 18rem;">'+
                                    '<div class="card-header">'+dat[i].posicion+'</div>'+
                                    '<div class="card-header">'+dat[i].nombre+' '+dat[i].apellido+'</div>'+
                                    '<div class="card-header" id="ci_usuario'+i+'">'+dat[i].ci_usuario+'</div>'+
                                    '<div class="card-header" id="ci_entrenador'+i+'"><strong>Entrenador: </strong>'+dat[i].ci_entrenador+'</div>'+
                                '<div class="card-body">'+
                                    '<label for="anotaciones'+i+'">Anotaciones</label>'+
                                    '<input type="number'+i+'" class="form-control card-text" id="anotaciones'+i+'" name="anotaciones'+i+'"></input>'+
                                    '<label for="pases'+i+'">Pases</label>'+
                                    '<input type="number" class="form-control card-text" id="pases'+i+'" name="pases'+i+'"></input>'+
                                    '<label for="asistencias'+i+'">Asistencias</label>'+
                                    '<input type="number" class="form-control card-text" id="asistencias'+i+'" name="asistencias'+i+'"></input>'+
                                    '<label for="rebotes">Rebotes</label>'+
                                    '<input type="number'+i+'" class="form-control card-text" id="rebotes'+i+'" name="rebotes'+i+'"></input>'+
                                    '<label for="quites'+i+'">Quites</label>'+
                                    '<input type="number" class="form-control card-text" id="quites'+i+'" name="quites'+i+'"></input>'+
                                    '<label for="faltas'+i+'">Faltas</label>'+
                                    '<input type="number" class="form-control card-text" id="faltas'+i+'" name="faltas'+i+'"></input>'+
                                    '<label for="tiros'+i+'">Tiros</label>'+
                                    '<input type="number" class="form-control card-text" id="tiros'+i+'" name="tiros'+i+'"></input>'+
                                    '<label for="faltaPersonal'+i+'">Falta Personal</label>'+
                                    '<input type="number" class="form-control card-text" id="faltaPersonal'+i+'" name="faltaPersonal'+i+'"></input>'+
                                    '<label for="faltaAntideportiva'+i+'">Falta Antideportiva</label>'+
                                    '<input type="number" class="form-control card-text" id="faltaAntideportiva'+i+'" name="faltaAntideportiva'+i+'"></input>'+
                                    '<label for="faltaDescalificante'+i+'">Falta Descalificiante</label>'+
                                    '<input type="number" class="form-control card-text" id="faltaDescalificante'+i+'" name="faltaDescalificante'+i+'"></input>'+
                                    '<label for="faltaTecnica'+i+'">Falta Tecnica</label>'+
                                    '<input type="number" class="form-control card-text" id="faltaTecnica'+i+'" name="faltaTecnica'+i+'"></input>'+
                                '<div class="card-footer">'+
                                '</div>'+
                                '</div>'+
                                '</div>'+
                                '<div class="col-2"></div>';
                                formularios=i;
                                document.getElementById('botonEnviar').innerHTML =
                                        '<button type="button" class="btn boton-enviar mx-auto" onclick="javascript:init.enviarStatsBasquetbol('+id_partido+','+dat[i].ci_entrenador+','+dat[i].ci_usuario+');">Enviar</button>';
                        }
                    }

                    
                                       
                }).fail(function() 
                { 
                alert("Algo salió mal cargando los datos..."); 
                });
                
            }

            if (dropdown == 'Handbol') {
                ajax.open(method, url, asynchronus); 

                jQuery.get(url, {nombre_equipo: nombre_equipo, id_partid: id_part}, function(data) 
                { 
                    let dat = JSON.parse(data);
                    if (dat == 'No hay datos para mostrar') {
                        
                        document.getElementById('mostrarJugadores').innerHTML = '<div class="alert alert-danger mx-auto">Ups! Parece que no hay deportistas para mostrar...</div>';
                        setTimeout(function(){
                            window.location.reload();
                         }, 3000);
                    }else{
                        for (let i=0; i<dat.length;i++) {
                            document.getElementById('mostrarJugadores').innerHTML +=
                                '<div class="card bg-light mb-3 col-md-4" style="max-width: 18rem;">'+
                                    '<div class="card-header">'+dat[i].posicion+'</div>'+
                                    '<div class="card-header">'+dat[i].nombre+' '+dat[i].apellido+'</div>'+
                                    '<div class="card-header" id="ci_usuario'+i+'">'+dat[i].ci_usuario+'</div>'+
                                    '<div class="card-header" id="ci_entrenador'+i+'"><strong>Entrenador: </strong>'+dat[i].ci_entrenador+'</div>'+
                                '<div class="card-body">'+
                                    '<label for="anotaciones'+i+'">Anotaciones</label>'+
                                    '<input type="number" class="form-control card-text" id="anotaciones'+i+'" name="anotaciones'+i+'"></input>'+
                                    '<label for="pases'+i+'">Pases</label>'+
                                    '<input type="number" class="form-control card-text" id="pases'+i+'" name="pases'+i+'"></input>'+
                                    '<label for="asistencias'+i+'">Rebotes</label>'+
                                    '<input type="number" class="form-control card-text" id="asistencias'+i+'" name="asistencias'+i+'"></input>'+
                                    '<label for="quites'+i+'">Asistencias</label>'+
                                    '<input type="number" class="form-control card-text" id="quites'+i+'" name="quites'+i+'"></input>'+
                                    '<label for="tiros'+i+'">Tiros</label>'+
                                    '<input type="number" class="form-control card-text" id="tiros'+i+'" name="tiros'+i+'"></input>'+
                                    '<label for="faltas'+i+'">Faltas</label>'+
                                    '<input type="number" class="form-control card-text" id="faltas'+i+'" name="faltas'+i+'"></input>'+
                                    '<label for="tarjetaRoja'+i+'">Tarjetas Rojas</label>'+
                                    '<input type="number" class="form-control card-text" id="tarjetaRoja'+i+'" name="tarjetaRoja'+i+'"></input>'+
                                    '<label for="tarjetaAmarilla'+i+'">Tarjetas Amarillas</label>'+
                                    '<input type="number" class="form-control card-text" id="tarjetaAmarilla'+i+'" name="tarjetaAmarilla'+i+'"></input>'+
                                    '<label for="exclusion'+i+'">Exclusion</label>'+
                                    '<input type="number" class="form-control card-text" id="exclusion'+i+'" name="exclusion'+i+'"></input>'+
                                '<div class="card-footer">'+
                                '<input type="number" class="form-control card-text" id="exclusion'+i+'" name="exclusion'+i+'"></input>'+
                                '</div>'+
                                '</div>'+
                                '</div>'+
                                '<div class="col-2"></div>';
                                formularios=i;
                        }
                        document.getElementById('botonEnviar').innerHTML =
                                '<button type="button" class="btn boton-enviar mx-auto" onclick="javascript:init.enviarStatsHandbol('+id_partido+','+dat[i].ci_entrenador+','+dat[i].ci_usuario+');">Enviar</button>';
                    }                   
                }).fail(function() 
                { 
                alert("Algo salió mal cargando los datos..."); 
                });
                
            }
    }

    enviarStatsFutbol(id_partido,ci_entrenador,ci_usuario){
        if (formularios == 0) {
            formularios=1;
        }else{
            formularios=0;
        }
        for (let a=0;a<formularios;a++) {
            /*Futbol Estadisticas */
            
            
            let anotaciones = document.getElementById('anotaciones'+a).value;
            let pases = document.getElementById('pases'+a).value;
            let asistencias = document.getElementById('asistencias'+a).value;
            let quites = document.getElementById('quites'+a).value;
            let tiros = document.getElementById('tiros'+a).value;
            let ganador = document.getElementById('dropdown-ganador').value;
            let falta = document.getElementById('faltas'+a).value;
            
            let resultado = JSON.stringify(ganador);
            
            /*Futbol Sanciones*/
            let tarjetaRoja = document.getElementById('tarjetaRoja'+a).value;
            let tarjetaAmarilla = document.getElementById('tarjetaAmarilla'+a).value;

            let ci_user = JSON.stringify(ci_usuario);
            let ci_coach = JSON.stringify(ci_entrenador);
            let goles = JSON.stringify(anotaciones);
            let pase = JSON.stringify(pases);
            let asist = JSON.stringify(asistencias);
            let quite = JSON.stringify(quites);
            let tiro = JSON.stringify(tiros);
            let tarjRoja = JSON.stringify(tarjetaRoja);
            let tarjAmarilla = JSON.stringify(tarjetaAmarilla);
            let faltas = JSON.stringify(falta);
            /*Globales */
            let team = JSON.stringify(equipo);
            let id_part = JSON.stringify(id_partido); 
            let foot = '';
            let futbol = JSON.stringify(foot);

            ajax.open(method, url, asynchronus); 

            jQuery.get(url, {ci_deportista: ci_user, ci_entrenador: ci_coach, anotaciones: goles, pases: pase,asistencias: asist, quites: quite,tiros:tiro,tarjetaRoja:tarjRoja,
                            tarjetaAmarilla: tarjAmarilla,futbol:futbol, id_partido:id_part,nombre_equipo: team, resultado: resultado, faltas:faltas}, function(data) 
            { 
                let dat = JSON.parse(data);
                if (dat == 'Se cargaron los datos.') {
                    document.getElementById('mostrarForm').setAttribute("class", "alert alert-success mx-auto");
                    document.getElementById('mostrarForm').innerHTML = 'Actuación y estadisticas cargadas con exito!';
                    document.getElementById('mostrarForm').setAttribute("style","display:grid; justify-content:center;");
                    setTimeout(function(){
                        window.location.reload();
                    }, 2000);
                }else{
                    document.getElementById('mostrarForm').setAttribute("class", "alert alert-danger mx-auto");
                    document.getElementById('mostrarForm').innerHTML = 'UPS! No se cargaron los datos...';
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

    enviarStatsBasquetbol(id_partido,ci_entrenador,ci_usuario){
        
        if (formularios == 0) {
            formularios=1;
        }else{
            formularios=0;
        }

        for (let a=0;a<formularios;a++) {
            /*Basquetbol Estadisticas */
            
            let anotaciones = document.getElementById('anotaciones'+a).value;
            let pases = document.getElementById('pases'+a).value;
            let asistencias = document.getElementById('asistencias'+a).value;
            let quites = document.getElementById('quites'+a).value;
            let tiros = document.getElementById('tiros'+a).value;
            let ganador = document.getElementById('dropdown-ganador').value;
            let falta = document.getElementById('faltas'+a).value;
            let rebotes = document.getElementById('rebotes'+a).value;

            let resultado = JSON.stringify(ganador);
            

            /*Basquetbol Sanciones*/
            let faltaPersonal = document.getElementById('faltaPersonal'+a).value;
            let faltaAntideportiva = document.getElementById('faltaAntideportiva'+a).value;
            let faltaDescalificante = document.getElementById('faltaDescalificante'+a).value;
            let faltaTecnica = document.getElementById('faltaTecnica'+a).value;

            let faltaPersonales = JSON.stringify(faltaPersonal);
            let faltaAntideportivas = JSON.stringify(faltaAntideportiva);
            let faltaDescalificantes = JSON.stringify(faltaDescalificante);
            let faltaTecnicas = JSON.stringify(faltaTecnica);

            let ci_user = JSON.stringify(ci_usuario);
            let ci_coach = JSON.stringify(ci_entrenador);
            let goles = JSON.stringify(anotaciones);
            let pase = JSON.stringify(pases);
            let asist = JSON.stringify(asistencias);
            let quite = JSON.stringify(quites);
            let tiro = JSON.stringify(tiros);
            let rebote = JSON.stringify(rebotes);

            let faltas = JSON.stringify(falta);
            /*Globales */

            let team = JSON.stringify(equipo);
            let id_part = JSON.stringify(id_partido); 
            let bask = '';
            let basket = JSON.stringify(bask);

            ajax.open(method, url, asynchronus); 

            jQuery.get(url, {ci_deportista: ci_user, ci_entrenador: ci_coach, anotaciones: goles, pases: pase,asistencias: asist, quites: quite,tiros:tiro,
                            rebotes:rebote,falta_personal:faltaPersonales,falta_antideportiva:faltaAntideportivas,falta_descalificante:faltaDescalificantes,falta_tecnica:faltaTecnicas,basket:basket, 
                            id_partido:id_part,nombre_equipo: team, resultado: resultado, faltas:faltas}, function(data) 
            { 
                let dat = JSON.parse(data);
                
                if (dat == 'Se cargaron los datos.') {
                    document.getElementById('mostrarForm').setAttribute("class", "alert alert-success mx-auto");
                    document.getElementById('mostrarForm').innerHTML = 'Actuación y estadisticas cargadas con exito!';
                    document.getElementById('mostrarForm').setAttribute("style","display:grid; justify-content:center;");
                    setTimeout(function(){
                        window.location.reload();
                    }, 2000);
                }else{
                    document.getElementById('mostrarForm').setAttribute("class", "alert alert-danger mx-auto");
                    document.getElementById('mostrarForm').innerHTML = 'UPS! No se cargaron los datos...';
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

    enviarStatsHandbol(id_partido,ci_entrenador,ci_usuario){
        if (formularios == 0) {
            formularios=1;
        }else{
            formularios=0;
        }
        for (let a=0;a<formularios;a++) {
            /*Futbol Estadisticas */
            
            
            let anotaciones = document.getElementById('anotaciones'+a).value;
            let pases = document.getElementById('pases'+a).value;
            let asistencias = document.getElementById('asistencias'+a).value;
            let quites = document.getElementById('quites'+a).value;
            let tiros = document.getElementById('tiros'+a).value;
            let ganador = document.getElementById('dropdown-ganador').value;
            let falta = document.getElementById('faltas'+a).value;
            
            let resultado = JSON.stringify(ganador);
            
            /*Futbol Sanciones*/
            let tarjetaRoja = document.getElementById('tarjetaRoja'+a).value;
            let tarjetaAmarilla = document.getElementById('tarjetaAmarilla'+a).value;
            let exclusion = document.getElementById('exclusion'+a).value;

            let exclus = JSON.stringify(exclusion);
            let ci_user = JSON.stringify(ci_usuario);
            let ci_coach = JSON.stringify(ci_entrenador);
            let goles = JSON.stringify(anotaciones);
            let pase = JSON.stringify(pases);
            let asist = JSON.stringify(asistencias);
            let quite = JSON.stringify(quites);
            let tiro = JSON.stringify(tiros);
            let tarjRoja = JSON.stringify(tarjetaRoja);
            let tarjAmarilla = JSON.stringify(tarjetaAmarilla);
            let faltas = JSON.stringify(falta);
            /*Globales */
            let team = JSON.stringify(equipo);
            let id_part = JSON.stringify(id_partido); 
            let hand = '';
            let handbol = JSON.stringify(hand);

            ajax.open(method, url, asynchronus); 

            jQuery.get(url, {ci_deportista: ci_user, ci_entrenador: ci_coach, anotaciones: goles, pases: pase,asistencias: asist, quites: quite,tiros:tiro,tarjetaRoja:tarjRoja,
                            tarjetaAmarilla: tarjAmarilla,handbol:handbol, id_partido:id_part,nombre_equipo: team, resultado: resultado, faltas:faltas, exclusion:exclus}, function(data) 
            { 
                let dat = JSON.parse(data);
                if (dat == 'Se cargaron los datos.') {
                    document.getElementById('mostrarForm').setAttribute("class", "alert alert-success mx-auto");
                    document.getElementById('mostrarForm').innerHTML = 'Actuación y estadisticas cargadas con exito!';
                    document.getElementById('mostrarForm').setAttribute("style","display:grid; justify-content:center;");
                    setTimeout(function(){
                        window.location.reload();
                    }, 2000);
                }else{
                    document.getElementById('mostrarForm').setAttribute("class", "alert alert-danger mx-auto");
                    document.getElementById('mostrarForm').innerHTML = 'UPS! No se cargaron los datos...';
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
    
    
}
var ajax = new XMLHttpRequest();
var method = "POST";
var url = "../../../../Backend/App/Controladores/AnalistaCargarActuacionController.php";
var asynchronus = true;

init = new AnalistaCargarActuacion;