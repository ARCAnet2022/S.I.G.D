class Equipo{

    constructor(ajax,method,url,asynchronus){
        ajax=this.ajax; 
        method=this.method;
        url=this.url;
        asynchronus=this.asynchronus;
    }

    
    mostrarTodo(){

        ajax.open(method, url, asynchronus);

        let ci_usuario = localStorage.getItem("ci_usuario");
        let ci_deportista = localStorage.getItem("ci_deportista");
        let ci_deport = JSON.stringify(ci_deportista);
        let ci_user = JSON.stringify(ci_usuario);

        jQuery.get(url, {ci_user: ci_user, ci_deport: ci_deport}, function(data) 
        { 
            let dat = JSON.parse(data);
            
            /*ESTADISTICAS EQUIPO 1º */
            document.getElementById("Pases").innerHTML = dat['dataTeam'][0].Pases; 
            document.getElementById("Partidos").innerHTML = dat['dataTeam'][1].Partidos;        
            document.getElementById("Anotaciones").innerHTML = dat['dataTeam'][0].Anotaciones; 
            document.getElementById("Tiros").innerHTML = dat['dataTeam'][0].Tiros;
            document.getElementById("miEquipo").innerHTML = "<strong>"+dat['dataTeam'][0].NombreEquipo+"</strong>";
            document.getElementById("Posesion").innerHTML = dat['dataTeam'][0].Posesion+"%";

            document.getElementById("Ganados").innerHTML = dat['dataTeamStats'][0].Ganados;
            document.getElementById("Perdidos").innerHTML = dat['dataTeamStats'][0].Perdidos;
            document.getElementById("Empatados").innerHTML = dat['dataTeamStats'][0].Empatados;

            for (let i=0;Object.entries(dat['dataMVP'][i]); i++) {

                if (dat['dataMVP'][i].Nombre == null) {
                    document.getElementById("NombreMVPGoles").innerHTML = "Sin datos"; 
                    document.getElementById("NombreMVPPases").innerHTML = "Sin datos"; 
                    document.getElementById("NombreMVPAsistencias").innerHTML = "Sin datos"; 
                } else {
                    document.getElementById("NombreMVPGoles").innerHTML = dat['dataMVP'][0].Nombre; 
                    document.getElementById("NombreMVPPases").innerHTML = dat['dataMVP'][1].Nombre; 
                    document.getElementById("NombreMVPAsistencias").innerHTML = dat['dataMVP'][2].Nombre; 
                }
                if (dat['dataMVP'][i].NumeroCamiseta == null) {
                    document.getElementById("NumeroCamisetaMVPGoles").innerHTML = "Sin datos"; 
                    document.getElementById("NumeroCamisetaMVPPases").innerHTML = "Sin datos"; 
                    document.getElementById("NumeroCamisetaMVPAsistencias").innerHTML = "Sin datos"; 
                }else{
                    document.getElementById("NumeroCamisetaMVPGoles").innerHTML = dat['dataMVP'][0].NumeroCamiseta; 
                    document.getElementById("NumeroCamisetaMVPPases").innerHTML = dat['dataMVP'][1].NumeroCamiseta;  
                    document.getElementById("NumeroCamisetaMVPAsistencias").innerHTML = dat['dataMVP'][2].NumeroCamiseta; 
                }

                if (dat['dataMVP'][i].Asistencias == null) {

                    document.getElementById("AsistenciasMVPGoles").innerHTML = "0"; 
                    document.getElementById("AsistenciasMVPPases").innerHTML = "0"; 
                    document.getElementById("AsistenciasMVPAsistencias").innerHTML = "0"; 
                }else{
                    document.getElementById("AsistenciasMVPGoles").innerHTML = dat['dataMVP'][0].Asistencias; 
                    document.getElementById("AsistenciasMVPPases").innerHTML = dat['dataMVP'][1].Asistencias; 
                    document.getElementById("AsistenciasMVPAsistencias").innerHTML = dat['dataMVP'][2].Asistencias; 
                }
                
                if(dat['dataMVP'][i].Anotaciones == null){
                    document.getElementById("AnotacionesMVPGoles").innerHTML = "0"; 
                    document.getElementById("AnotacionesMVPPases").innerHTML = "0"; 
                    document.getElementById("AnotacionesMVPAsistencias").innerHTML = "0"; 
                }else{
                    document.getElementById("AnotacionesMVPGoles").innerHTML = "<strong>"+dat['dataMVP'][0].Anotaciones+"</strong>"; 
                    document.getElementById("AnotacionesMVPPases").innerHTML = dat['dataMVP'][1].Anotaciones;
                    document.getElementById("AnotacionesMVPAsistencias").innerHTML = dat['dataMVP'][2].Anotaciones; 
                }

                if (dat['dataMVP'][i].Pases == null) {
                    document.getElementById("PasesMVPGoles").innerHTML = "0";
                    document.getElementById("PasesMVPPases").innerHTML = "0";
                    document.getElementById("PasesMVPAsistencias").innerHTML = "0";
                }else{
                    document.getElementById("PasesMVPGoles").innerHTML = dat['dataMVP'][0].Pases;
                    document.getElementById("PasesMVPPases").innerHTML = "<strong>"+dat['dataMVP'][1].Pases+"</strong>";
                    document.getElementById("PasesMVPAsistencias").innerHTML = dat['dataMVP'][2].Pases;
                }

                if (dat['dataMVP'][i].Tiros == null) {
                    document.getElementById("TirosMVPGoles").innerHTML = "0";
                    document.getElementById("TirosMVPPases").innerHTML = "0";
                    document.getElementById("TirosMVPAsistencias").innerHTML = "0";
                } else {
                    document.getElementById("TirosMVPGoles").innerHTML = dat['dataMVP'][0].Tiros;
                    document.getElementById("TirosMVPPases").innerHTML = dat['dataMVP'][1].Tiros;
                    document.getElementById("TirosMVPAsistencias").innerHTML = dat['dataMVP'][2].Tiros;
                }

                if (dat['dataMVP'][i].Quites == null) {
                    document.getElementById("QuitesMVPGoles").innerHTML = "0"; 
                    document.getElementById("QuitesMVPPases").innerHTML = "0"; 
                    document.getElementById("QuitesMVPAsistencias").innerHTML = "0"; 
                } else {
                    document.getElementById("QuitesMVPGoles").innerHTML = dat['dataMVP'][0].Quites; 
                    document.getElementById("QuitesMVPPases").innerHTML = dat['dataMVP'][1].Quites; 
                    document.getElementById("QuitesMVPAsistencias").innerHTML = dat['dataMVP'][2].Quites; 
                }

                if (dat['dataMVP'][i].PartidosJugados == null) {
                    document.getElementById("PartidosJugadosMVPGoles").innerHTML = "";
                    document.getElementById("PartidosJugadosMVPPases").innerHTML = "";
                    document.getElementById("PartidosJugadosMVPAsistencias").innerHTML = "";
                } else {
                    document.getElementById("PartidosJugadosMVPGoles").innerHTML = dat['dataMVP'][0].PartidosJugados;
                    document.getElementById("PartidosJugadosMVPPases").innerHTML = dat['dataMVP'][1].PartidosJugados;
                    document.getElementById("PartidosJugadosMVPAsistencias").innerHTML = dat['dataMVP'][2].PartidosJugados;
                }
            }
            


            if (dat['dataTeam'][0].Rebotes != null) {
                    document.getElementById("Rebote").innerHTML = "Rebotes";
                    document.getElementById("Rebotes").innerHTML = dat['dataTeam'][0].Rebotes;
                    document.getElementById("Pos").innerHTML = "";
            }else if(dat['dataTeam'][0].Posesion != null){
                    document.getElementById("Efic").innerHTML = "Eficiencia";
                    document.getElementById("Eficiencia").innerHTML = dat['dataTeam'][0].Eficiencia+"%";
                    document.getElementById("Posesion").innerHTML = dat['dataTeam'][0].Posesion+"%"; 
            } 
            
        }).fail(function() 
        { 
        alert("Algo salió mal cargando los datos..."); 
        }); 
    }

    showSanciones(){
        ajax.open(method, url, asynchronus);

        let ci_usuario = localStorage.getItem("ci_usuario");
        let ci_deportista = localStorage.getItem("ci_deportista");
        let ci_deport = JSON.stringify(ci_deportista);
        let ci_user = JSON.stringify(ci_usuario);
        
        jQuery.get(url, {ci_user: ci_user, ci_deport: ci_deport}, function(data2) 
        { 
            let dat = JSON.parse(data2);

            if(!dat['dataTeamStats'].hasOwnProperty('Deporte')){
                document.getElementById("TarjAmar").innerHTML = "SANCIONES";      
                document.getElementById("TarjetasAmarillas").innerHTML = "No hay incidencias reportadas para este equipo...";
            }
            

            if(dat['dataTeamStats'][2].Deporte == 'Handbol'){

                document.getElementById("TarjAmar").innerHTML = "Tarjetas Amarillas";
                document.getElementById("TarjRoja").innerHTML = "Tarjetas Rojas";
                document.getElementById("TarjRoja").innerHTML = "Exclusiones";
                
                for (let i=0;Object.entries(dat['dataTeamStats'][i]);i++) {
                    if (dat['dataTeamStats'][i].TipoTarjeta == 'Tarjeta Amarilla') {
    
                        document.getElementById("TarjetasAmarillas").innerHTML = dat['dataTeamStats'][i].Cantidad;
    
                    }else if(dat['dataTeamStats'][i].TipoTarjeta == 'Tarjeta Roja'){
    
                        document.getElementById("TarjetasRojas").innerHTML = dat['dataTeamStats'][i].Cantidad;
    
                    }else if(dat['dataTeamStats'][i].TipoTarjeta == 'Exclusion'){
                        
                        document.getElementById("Exclusion").innerHTML = dat['dataTeamStats'][i].Cantidad;
                    }
                    
                }
                
    
            }else if(dat['dataTeamStats'][2].Deporte == 'Basquetbol'){
    
                /**/
                document.getElementById("FaltaPer").innerHTML = "Faltas personales";
                document.getElementById("FaltaAntidepor").innerHTML = "Faltas Antideportivas";
                document.getElementById("FaltaDescal").innerHTML = "Faltas Descalificantes";
                document.getElementById("FaltaTec").innerHTML = "Faltas técnicas";
    
                for (let i=0;Object.entries(dat['dataTeamStats'][i]);i++) {
                    if (dat['dataTeamStats'][i].TipoTarjeta == 'Falta Personal') {
    
                        document.getElementById("FaltaPersonal").innerHTML = dat['dataTeamStats'][i].Cantidad;
    
                    }else if(dat['dataTeamStats'][i].TipoTarjeta == 'Falta Antideportiva'){
    
                        document.getElementById("FaltaAntideportiva").innerHTML = dat['dataTeamStats'][i].Cantidad;
    
                    }else if(dat['dataTeamStats'][i].TipoTarjeta == 'Falta Descalificante'){
                        
                        document.getElementById("FaltaDescalificante").innerHTML = dat['dataTeamStats'][i].Cantidad;
    
                    }else if(dat['dataTeamStats'][i].TipoTarjeta == 'Falta Tecnica'){
                        
                        document.getElementById("FaltaTecnica").innerHTML = dat['dataTeamStats'][i].Cantidad;
    
                    }
                    
                }
            }else if(dat['dataTeamStats'][2].Deporte == 'Futbol') {
            
                document.getElementById("TarjRoja").innerHTML = 'Tarjetas Rojas';
                document.getElementById("TarjAmar").innerHTML = 'Tarjetas Amarillas';
    
                for (let i=0;Object.entries(dat['dataTeamStats'][i]);i++) {
                    
                    if (dat['dataTeamStats'][i].TipoTarjeta == 'Tarjeta Roja') {
    
                        document.getElementById("TarjetasRojas").innerHTML = dat['dataTeamStats'][i].Cantidad;
    
                    }else if(dat['dataTeamStats'][i].TipoTarjeta == 'Tarjeta Amarilla'){
    
                    document.getElementById("TarjetasAmarillas").innerHTML = dat['dataTeamStats'][i].Cantidad;
                    
                    }
                    
                }
                
            }
    
        }).fail(function() 
        { 
        alert("Algo salió mal cargando los datos..."); 
        }); 
    }

    showPlantel(){
            ajax.open(method, url, asynchronus);

            let ci_usuario = localStorage.getItem("ci_usuario");
            let ci_deportista = localStorage.getItem("ci_deportista");
            let ci_deport = JSON.stringify(ci_deportista);
            let ci_user = JSON.stringify(ci_usuario);

            jQuery.get(url, {ci_user: ci_user, ci_deport: ci_deport}, function(data) 
            { 
                let dat = JSON.parse(data);
                
                let i=0;
                while (Object.entries(dat['dataPlantel'][i])) {
                    document.getElementById("mostrarPlantel").innerHTML  += 
        
                    '<div class="container cuerpo-partido col-4">'+
                    '<div class="col-md-12">'+
                    '<table class="table">'+
                    '<thead class="cabezera">'+
                        '<tr>'+
                            '<th scope="col" id="nro_camiseta" colspan="2"><strong>Nº camiseta:</strong> '+dat['dataPlantel'][i].nro_camiseta+'</th>'+
                        '</tr>'+
                        '</thead>'+
                        '<tbody class="borde-tabla">'+
                            '<tr>'+
                            '<td><strong>Nombre:<strong></td>'+
                            '<td id="nombre">'+dat['dataPlantel'][i].nombre+'</td>'+
                                '</tr>'+
                                '</tr>'+
                            '<tr>'+
                            '<td><strong>Apellido:<strong></td>'+
                        '<td id="apellido">'+dat['dataPlantel'][i].apellido+'</td>'+
                            '</tr>'+
                        '<tr>'+
                        '<td><strong>Posición:<strong></td>'+
                        '<td id="posicion">'+dat['dataPlantel'][i].posicion+'</td>'+
                        '</tr>'+
                        '</tbody>'+
                    '</table>'+
                    '</div>'+
                    '</div>';
                    i++;

                    
            }
        }).fail(function() 
        { 
            alert("Algo salió mal cargando los datos..."); 
        }); 
    }

}



var ajax = new XMLHttpRequest();
var method = "GET";
var url = "../../../../Backend/App/Controladores/equipoController.php";
var asynchronus = true;

const init = new Equipo(ajax,method,url,asynchronus);

init.showSanciones();
init.mostrarTodo();
init.showPlantel();