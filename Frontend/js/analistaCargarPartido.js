arrayUsers = [];
ci_juez = '';
class AnalistaCargarPartido{


    constructor(ajax,method,url,asynchronus){
        ajax=this.ajax; 
        method=this.method;
        url=this.url;
        asynchronus=this.asynchronus;
    }

    getEquiposBySport(){
        
        let dropdownDeporte = document.getElementById('dropdownMenuButton-deporte').value;
        document.getElementById('dropdownMenuButton-equipo').innerHTML = '<option value="default">Elegir equipo</option>';
        document.getElementById('dropdownMenuButton-equipo2').innerHTML = '<option value="default">Elegir 2° equipo</option>';
        
        
        if (dropdownDeporte != 'Elegir Deporte') {
            document.getElementById('mostrarError').innerHTML = '';
            
            ajax.open(method, url, asynchronus); 
            let deporte = document.getElementById('dropdownMenuButton-deporte').value;
            let sport = JSON.stringify(deporte);
            jQuery.get(url, {deporte: sport}, function(data) 
            { 
                let dat = JSON.parse(data);

                if (!dat[0].nombre_equipo) {
                    alert("No hay equipos!");
                }else{
                    for (let i=0; i<dat.length;i++) {
                        document.getElementById('dropdownMenuButton-equipo').innerHTML += 
                        '<option class="dropdown-item" value="'+dat[i].nombre_equipo+'">'+dat[i].nombre_equipo+'</option>'; 
                        
                        document.getElementById('dropdownMenuButton-equipo2').innerHTML += 
                        '<option class="dropdown-item" value="'+dat[i].nombre_equipo+'">'+dat[i].nombre_equipo+'</option>'; 
                        
                    }
                }
                
                document.getElementById('myTable').innerHTML = '';
                init.conseguirJuez();
                


            }).fail(function() 
            { 
            alert("Algo salió mal cargando los datos..."); 
            });

        }else{
            document.getElementById('mostrarError').innerHTML = '<h3 style="color:red;" class="mx-auto">Debe seleccionar un deporte para cargar el partido.</h3>';
            
        }
        

    }

    validarEquiposDistintos(){

        let valorEquipo1 = document.getElementById('dropdownMenuButton-equipo').value;
        let valorEquipo2 = document.getElementById('dropdownMenuButton-equipo2').value;

        if (valorEquipo1 == valorEquipo2) {
            
            document.getElementById('dropdownMenuButton-equipo').value = 'default';
            document.getElementById('dropdownMenuButton-equipo2').value = 'default';
            document.getElementById('mostrarError').innerHTML = '<p style="color:red;">El equipo debe ser distinto para ser cargado.</p>'+
            '<p class="mx-auto">Seleccione nuevamente el equipo.</p>';
        }else{
            document.getElementById('mostrarError').innerHTML = '';
        }

    }

    conseguirJuez(){
        ajax.open(method, url, asynchronus); 
        let fantasma = '';
        let phantom = JSON.stringify(fantasma);

        jQuery.get(url, {phantom: phantom}, function(data) 
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
            
            
        }).fail(function() 
        { 
        alert("Algo salió mal cargando los datos..."); 
        });
    }

    validarFecha(){
        var date = document.getElementById("fecha").value;
        var varDate = new Date(date); //dd-mm-YYYY
        var today = new Date();
        today.setHours(0,0,0,0);
        let fecha=document.getElementById("fecha");
        if(varDate >= today && varDate) {
            
            fecha.classList.remove("error");
            fecha.classList.add("success");
        }else{
            document.getElementById("fecha").value = '';
            fecha.classList.add("error");
            fecha.classList.remove("success");
        }

    }

    seleccionadoJuez(ci_usuario){
        let botonSelect = document.getElementById(ci_usuario);
        botonSelect.innerHTML = 'Seleccionado';
        ci_juez= ci_usuario;
        
    }

    cargarPartido(){
        let fecha = document.getElementById("fecha").value;
        let hora_inicio = document.getElementById("hora_inicio").value;
        let hora_fin = document.getElementById("hora_fin").value;
        let lugar = document.getElementById('lugar').value;
        let equipo1 = document.getElementById('dropdownMenuButton-equipo').value;
        let equipo2 = document.getElementById('dropdownMenuButton-equipo2').value;
        let deporte = document.getElementById('dropdownMenuButton-deporte').value;
        let ci_usuario = localStorage.getItem('ci_usuario');
        let phantomTwo = '';

        let team1 = JSON.stringify(equipo1);
        let team2 = JSON.stringify(equipo2);
        let date = JSON.stringify(fecha);
        let hora_i = JSON.stringify(hora_inicio);
        let hora_f = JSON.stringify(hora_fin);
        let sport = JSON.stringify(deporte);
        let ci_judge = JSON.stringify(ci_juez);
        let lug = JSON.stringify(lugar);
        let ci_analista = JSON.stringify(ci_usuario);
        let phantom2 = JSON.stringify(phantomTwo);
        ajax.open(method, url, asynchronus); 
            
            jQuery.get(url, {equipo1:team1,equipo2:team2,fecha:date,hora_inicio:hora_i,hora_fin:hora_f,deporte:sport, ci_juez: ci_judge, lugar:lug, ci_analista: ci_analista,phantom2:phantom2}, function(data) 
            { 
                let dat = JSON.parse(data);
                
                if (dat == 'Datos cargados con exito!') {
                        
                    document.getElementById('mostrarForm').setAttribute("class", "alert alert-success mx-auto");
                    document.getElementById('mostrarForm').innerHTML = 'Partido cargado con exito!';
                    document.getElementById('mostrarForm').setAttribute("style","display:grid; justify-content:center;");
                    
                    setTimeout(function(){
                        window.location.reload();
                    }, 2000);
                    
                }else{
                    document.getElementById('mostrarForm').setAttribute("class", "alert alert-danger mx-auto");
                    document.getElementById('mostrarForm').innerHTML = 'Hubo un error! No se logró cargar el partido';
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

var ajax = new XMLHttpRequest();
var method = "POST";
var url = "../../../../Backend/App/Controladores/AnalistaCargarPartidoController.php";
var asynchronus = true;

const init = new AnalistaCargarPartido;
