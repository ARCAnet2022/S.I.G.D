const arrayUsers = [];
const td = document.querySelector("td");
class adminModificarUsuario{


    constructor(ajax,method,url,asynchronus){
        ajax=this.ajax; 
        method=this.method;
        url=this.url;
        asynchronus=this.asynchronus;
    }

    dropdownFiltrarValores(){
        
        document.getElementById('myTable').innerHTML = "";
        let dropdownRoles =document.getElementById('dropdownRol').value;
        let dropdownRol = JSON.stringify(dropdownRoles); 

        
        $("#formularioMod").hide();
        

        ajax.open(method, url, asynchronus); 


        jQuery.get(url, {rol: dropdownRol}, function(data) 
        { 
            let dat = JSON.parse(data);
            
            
                
            
            for (let i=0; Object.entries(dat);i++) {
                arrayUsers.push({nombre: dat[i].nombre, apellido:dat[i].apellido, cedula:dat[i].ci_usuario, rol:dropdownRoles});
                
                    document.getElementById('myTable').innerHTML +=
                    '<tr>'+
                        '<td id="'+i+"-"+dat[i].nombre+'">'+dat[i].nombre+'</td>'+
                        '<td id="'+i+"-"+dat[i].apellido+'">'+dat[i].apellido+'</td>'+
                        '<td id="'+i+"-"+dat[i].ci_usuario+'">'+dat[i].ci_usuario+'</td>'+
                        '<td id="'+i+"-"+dropdownRoles+'">'+dropdownRoles+'</td>'+
                        '<td><button class="btn btn-outline-info bg-light btn-sm" id="'+dat[i].ci_usuario+'" onclick="javascript:init.editarUsuario('+dat[i].ci_usuario+');">Editar</button></td>'+
                    '</tr>';
                    
            }

            
            

        }).fail(function() 
        { 
        alert("Algo salió mal cargando los datos..."); 
        });

    }

    editarUsuario(cedula){

        $("#formularioMod").show();
        $("#botonModificar").show();
        let dropdownRol = document.getElementById('dropdownRol').value;
        $("#dropdownRoles").val(dropdownRol);
        init.formularioRoles();
        
        ajax.open(method, url, asynchronus); 
        let rolDropdown = document.getElementById('dropdownRol').value;
        let rolUsuario = JSON.stringify(rolDropdown);
        let ci = JSON.stringify(cedula);

        jQuery.get(url, {cedula: ci, rolUsuario: rolUsuario}, function(data) 
        { 
            let dat = JSON.parse(data);
            $("#nombre").val(dat[0].nombre);  
            $("#apellido").val(dat[0].apellido);  
            $("#fecha_nac").val(dat[0].fecha_nac);  
            $("#nacionalidad").val(dat[0].nacionalidad);  
            $("#email").val(dat[0].email);
            $("#ciudad").val(dat[0].ciudad);  
            $("#calle").val(dat[0].calle);  
            $("#numero").val(dat[0].numero);  
            $("#telefono").val("0"+dat[0].telefono);  
            $("#ci_cargado").val(dat[0].ci_usuario);  
            
            if (rolDropdown == 'administrador') {
                $("#horas_trabajo_semanales").val(dat[0].horas_trabajo_semanales);  
                $("#experiencia").val(dat[0].experiencia);  
            }

            if (rolDropdown == 'analista') {
                $("#nro_funcionario").val(dat[0].nro_funcionario);  
                $("#horas_trabajo_semanales").val(dat[0].horas_trabajo_semanales);  
            }
            if (rolDropdown == 'administrativo') {
                $("#horas_trabajo_semanales").val(dat[0].horas_trabajo_semanales);  
                $("#nro_funcionario").val(dat[0].nro_funcionario);  
            }
            if (rolDropdown == 'deportista') {
                $("#grupo").val(dat[0].grupo);
                $("#carne_salud").val(dat[0].carne_salud);    
            }
            if (rolDropdown == 'entrenador') {
                $("#grupo").val(dat[0].grupo);
                $("#nro_funcionario").val(dat[0].nro_funcionario);
                $("#horas_trabajo_semanales").val(dat[0].horas_trabajo_semanales);    
            }
            if (rolDropdown == 'juez') {
                $("#carne_salud").val(dat[0].carne_salud); 
                $("#horas_trabajo_semanales").val(dat[0].horas_trabajo_semanales);
                $("#experiencia").val(dat[0].experiencia);       
            }
            if (rolDropdown == 'scout') {
                $("#experiencia").val(dat[0].experiencia); 
            }


        }).fail(function() 
        { 
        alert("Algo salió mal cargando los datos..."); 
        });

        
    }

    modificarUsuario(){

        ajax.open("POST", url, asynchronus); 
        let cedula = $("#ci_cargado").val();
        let nombre = $("#nombre").val();
        let apellido = $("#apellido").val();
        let email = $("#email").val();
        let telefono = $("#telefono").val();
        let nacionalidad = $("#nacionalidad").val();
        let fecha_nac = $("#fecha_nac").val();
        let calle = $("#calle").val();
        let numero = $("#numero").val();
        let ciudad = $("#ciudad").val();

        let ci = JSON.stringify(cedula);
        let name = JSON.stringify(nombre);
        let ape = JSON.stringify(apellido);
        let correo = JSON.stringify(email);
        let tel = JSON.stringify(telefono);
        let nacion = JSON.stringify(nacionalidad);
        let fecha = JSON.stringify(fecha_nac);
        let call = JSON.stringify(calle);
        let number = JSON.stringify(numero);
        let city = JSON.stringify(ciudad);
        
        let rolDropdown = document.getElementById('dropdownRol').value;
        let rol = JSON.stringify(rolDropdown);
        let exp = '';
        let nro_fun = '';
        let horas = '';
        let grp = '';
        let carne = '';
        let insertarMod = '';
        let insert = JSON.stringify(insertarMod);

        if (rolDropdown == 'administrador') {
            let horas_trabajo = $("#horas_trabajo_semanales").val();
            horas = JSON.stringify(horas_trabajo);
            let experiencia = $("#experiencia").val();
            exp = JSON.stringify(experiencia);
        }
        
        if (rolDropdown == 'analista') {
            let nro_funcionario = $("#nro_funcionario").val();
            nro_fun = JSON.stringify(nro_funcionario);
            let horas_trabajo = $("#horas_trabajo_semanales").val();
            horas = JSON.stringify(horas_trabajo);
        }
        if (rolDropdown == 'administrativo') {
            let horas_trabajo = $("#horas_trabajo_semanales").val();
            horas = JSON.stringify(horas_trabajo); 
            let nro_funcionario = $("#nro_funcionario").val();
            nro_fun = JSON.stringify(nro_funcionario); 
        }
        if (rolDropdown == 'deportista') {
            let grupo = $("#grupo").val();
            grp = JSON.stringify(grupo);
            let carne_salud = $("#carne_salud").val();
            carne = JSON.stringify(carne_salud);    
        }
        if (rolDropdown == 'entrenador') {
            let grupo = $("#grupo").val();
            grp = JSON.stringify(grupo);
            let nro_funcionario = $("#nro_funcionario").val();
            nro_fun = JSON.stringify(nro_funcionario); 
            let horas_trabajo = $("#horas_trabajo_semanales").val();
            horas = JSON.stringify(horas_trabajo);    
        }
        if (rolDropdown == 'juez') {
            let carne_salud = $("#carne_salud").val();
            carne = JSON.stringify(carne_salud); 
            let horas_trabajo = $("#horas_trabajo_semanales").val();
            horas = JSON.stringify(horas_trabajo);
            let experiencia = $("#experiencia").val();
            exp = JSON.stringify(experiencia);       
        }
        if (rolDropdown == 'scout') {
            let experiencia = $("#experiencia").val();
            exp = JSON.stringify(experiencia); 
        }

        jQuery.post(url, {ci_user: ci, name: name, ape: ape, corre: correo, tele: tel, nacion: nacion, fecha_na: fecha, street: call, number: number, city: city,
                        horas_work: horas, experience: exp, nro_func: nro_fun, grp: grp,carne_salu: carne, validador: insert, rolUser: rol}, function(data) 
        { 
            let dat = JSON.parse(data);
            document.getElementById('mostrarForm').setAttribute("class", "alert alert-success mx-auto");
            document.getElementById('mostrarForm').innerHTML = 'El usuario ha sido modificado.';

            setTimeout(function(){
                window.location.reload();
             }, 3000);

        }).fail(function() 
        { 
        alert("Algo salió mal cargando los datos..."); 
        });
    }

    formularioRoles(){
        document.getElementById('mostrarSegunRol').innerHTML = '';
        document.getElementById('mostrarSegunRolFormularios').innerHTML = '';
        let dropdownRoles = document.getElementById('dropdownRoles').value;

        if (dropdownRoles != '....') {
            if (dropdownRoles == 'administrativo') {
                
                document.getElementById('mostrarSegunRol').innerHTML +=
                    '<td class="bg-light"><label for="nro_funcionario">Número de funcionario</label></td>'+
                    '<td><label for="horas_trabajo_semanales">Horas de trabajo semanales:</label></td>';
                document.getElementById('mostrarSegunRolFormularios').innerHTML +=
                '<td class="bg-light"> <input type="number" class="form-control" id="nro_funcionario" name="nro_funcionario"></td>'+
                '<td> <input type="number" class="form-control" placeholder="..." id="horas_trabajo_semanales" name="horas_trabajo_semanales"></td>';
            }
            if (dropdownRoles == 'analista') {
                
                document.getElementById('mostrarSegunRol').innerHTML +=
                    '<td class="bg-light"><label for="nro_funcionario">Número de funcionario</label></td>'+
                    '<td><label for="horas_trabajo_semanales">Horas de trabajo semanales:</label></td>';

                document.getElementById('mostrarSegunRolFormularios').innerHTML +=
                '<td class="bg-light"> <input type="number" class="form-control" id="nro_funcionario" name="nro_funcionario"></td>'+
                '<td> <input type="number" class="form-control" placeholder="..." id="horas_trabajo_semanales" name="horas_trabajo_semanales"></td>';  
            }

            if (dropdownRoles == 'deportista') {
                
                document.getElementById('mostrarSegunRol').innerHTML +=
                '<td class="bg-light"><label for="carne_salud">Carne de Salud:</label></td>'+
                '<td><label for="grupo">Grupo:</label></td>';

                document.getElementById('mostrarSegunRolFormularios').innerHTML +=
                '<td class="bg-light"> <select id="carne_salud"><option value="SI">SI</option><option value="NO">NO</option></select></td>'+
                '<td> <input type="text" class="form-control" placeholder="..." id="grupo" name="grupo"></td>';  
            }

            if (dropdownRoles == 'entrenador') {
                
                document.getElementById('mostrarSegunRol').innerHTML +=
                    '<td class="bg-light"><label for="nro_funcionario">Número de funcionario</label></td>'+
                    '<td><label for="horas_trabajo_semanales">Horas de trabajo semanales:</label></td>'+
                    '<td class="bg-light"><label for="grupo">Grupo:</label></td>';
                document.getElementById('mostrarSegunRolFormularios').innerHTML +=
                '<td class="bg-light"> <input type="number" class="form-control" id="nro_funcionario" name="nro_funcionario"></td>'+
                '<td> <input type="number" class="form-control" placeholder="..." id="horas_trabajo_semanales" name="horas_trabajo_semanales"></td>'+
                '<td class="bg-light"> <input type="text" class="form-control" placeholder="..." id="grupo" name="grupo"></td>';   
            }

            if (dropdownRoles == 'juez') {
                
                document.getElementById('mostrarSegunRol').innerHTML +=
                    '<td class="bg-light"><label for="experiencia">Experiencia:</label></td>'+
                    '<td><label for="horas_trabajo_semanales">Horas de trabajo semanales:</label></td>'+
                    '<td class="bg-light"><label for="carne_salud">Carne de Salud:</label></td>';

                document.getElementById('mostrarSegunRolFormularios').innerHTML +=
                '<td class="bg-light"> <input type="number" class="form-control" id="experiencia" name="experiencia"></td>'+
                '<td> <input type="number" class="form-control" placeholder="..." id="horas_trabajo_semanales" name="horas_trabajo_semanales"></td>'+
                '<td class="bg-light"> <select id="carne_salud"><option>SI</option><option>NO</option></select></td>'; 
            }

            if (dropdownRoles == 'scout') {

                document.getElementById('mostrarSegunRol').innerHTML +=
                '<td class="bg-light"><label for="experiencia">Experiencia:</label></td>';

                document.getElementById('mostrarSegunRolFormularios').innerHTML +=
                '<td class="bg-light"> <input type="number" class="form-control" id="experiencia" name="experiencia"></td>';
            }

            if (dropdownRoles == 'administrador') {

                document.getElementById('mostrarSegunRol').innerHTML +=
                '<td class="bg-light"><label for="horas_trabajo_semanales">Horas de trabajo semanales:</label></td>'+
                    '<td><label for="experiencia">Experiencia:</label></td>';

                document.getElementById('mostrarSegunRolFormularios').innerHTML +=
                    '<td class="bg-light"> <input type="number" class="form-control" placeholder="..." id="horas_trabajo_semanales" name="horas_trabajo_semanales"></td>'+
                    '<td> <input type="number" class="form-control" id="experiencia" name="experiencia"></td>';

            }
        }
    }


    esconderForm(){
        
        document.getElementById('mostrarSegunRol').innerHTML = '';
            $("#formularioMod").hide();
            $("#botonModificar").hide();
          
    }

    
}

var ajax = new XMLHttpRequest();
var method = "GET";
var url = "../../../../Backend/App/Controladores/AdminModificarUsuarioController.php";
var asynchronus = true;

const init = new adminModificarUsuario;
