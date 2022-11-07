class administrativoCargarUsuario{

    constructor(ajax,method,url,asynchronus){
        ajax=this.ajax; 
        method=this.method;
        url=this.url;
        asynchronus=this.asynchronus;
    }

    formulariosRoles(){
        let dropdownRoles =document.getElementById('dropdownRol').value;
        
        document.getElementById('mostrarSegunRol').innerHTML = '';
        document.getElementById('mostrarSegunRolFormularios').innerHTML = '';

        let ci_administrador=localStorage.getItem('ci_usuario');

    document.getElementById('mostrarSegunRol').innerHTML +=
        '<label for="ci_administrador" id="ci_administrador"></label'
        '<input type="number" class="admin" id="ci_administrador" name="ci_administrador" placeholder="'+ci_administrador+'" ="'+ci_administrador+'"></input>';
        let element =document.getElementById('ci_administrador');
        $(element).hide();

    document.getElementById("ci_administrador").value = ci_administrador;

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
                '<td class="bg-light"> <select id="carne_salud"><option>SI</option><option>NO</option></select></td>'+
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
            
            
        }else{
            document.getElementById('mostrarSegunRol').innerHTML = '<p style="color:red;">Seleccione un rol para ingresar los campos especificos.</p>';
        }
        
        
        
    }

    cargarUsuario(){
        
        let ci_cargado =document.getElementById('ci_cargado').value;
        let ci = JSON.stringify(ci_cargado);
        
        let name =document.getElementById('nombre').value;
        let nombre = JSON.stringify(name);

        let ape =document.getElementById('apellido').value;
        let apellido = JSON.stringify(ape);

        let tel =document.getElementById('telefono').value;
        let telefono = JSON.stringify(tel);

        let correo = document.getElementById('email').value;
        let email = JSON.stringify(correo);

        let fecha = document.getElementById('fecha_nac').value;
        let fecha_nac = JSON.stringify(fecha);
        
        let nacion = document.getElementById('nacionalidad').value;
        let nacionalidad = JSON.stringify(nacion);

        let street = document.getElementById('calle').value;
        let calle = JSON.stringify(street);

        let number = document.getElementById('numero').value;
        let numero = JSON.stringify(number);

        let city = document.getElementById('ciudad').value;
        let ciudad = JSON.stringify(city);

        let role = document.getElementById('dropdownRol').value;
        if (role == '....' || !ci_cargado || !name || !ape || !tel || !correo || !fecha || !nacion || !street || !number || !city) {
            document.getElementById('mostrarForm').setAttribute("class", "alert alert-danger mx-auto");
            document.getElementById('mostrarForm').innerHTML = 'Debe completar los campos!';
        }
        let rol = JSON.stringify(role);

        
        let ex = document.getElementById('experiencia');
        let experiencia = '';
        if (ex != null) {
            let exp = document.getElementById('experiencia').value;
            experiencia = JSON.stringify(exp);
        }
        let hora = document.getElementById('horas_trabajo_semanales');
        let horas_trabajo_semanales = '';
        if (hora != null) {
            let horas = document.getElementById('horas_trabajo_semanales').value;
            horas_trabajo_semanales = JSON.stringify(horas);
        }
        
        let carn = document.getElementById('carne_salud');
        let carne_salud = '';
        if (carn != null) {
            let carne = document.getElementById('carne_salud').value;
            carne_salud = JSON.stringify(carne);
        }

        let nro_fun = document.getElementById('nro_funcionario');
        let nro_funcionario = '';
        if (nro_fun != null) {
            let nro_func = document.getElementById('nro_funcionario').value;
            nro_funcionario = JSON.stringify(nro_func);      
        }

        let grp = document.getElementById('grupo');
        let grupo = '';
        if (grp != null) {
            let grup = document.getElementById('grupo').value;
            grupo = JSON.stringify(grup);  
        }
        
        let ci_admin =localStorage.getItem('ci_usuario');
        let ci_administrador = JSON.stringify(ci_admin);
        
        
        ajax.open(method, url, asynchronus); 
        
        
        jQuery.get(url, {ci_administrador: ci_administrador,ci_usuario: ci, nombre: nombre, apellido: apellido, telefono: telefono, email: email, fecha_nac: fecha_nac,
                        nacionalidad: nacionalidad, calle: calle, numero: numero, ciudad: ciudad, rol: rol, experiencia: experiencia, horas_trabajo_semanales: horas_trabajo_semanales,
                        carne_salud: carne_salud, nro_funcionario: nro_funcionario, grupo: grupo}, function(data) 
        { 
            let dat = JSON.parse(data);
            
            document.getElementById('mostrarForm').setAttribute("class", "alert alert-primary mx-auto");
            document.getElementById('mostrarForm').innerHTML = 'Usuario cargado con exito!';

            setTimeout(function(){
                window.location.reload();
             }, 5000);

        }).fail(function() 
        { 
        alert("Algo salió mal cargando los datos..."); 
        });

        
        
    }
   


}

var ajax = new XMLHttpRequest();
var method = "PUT";
var url = "../../../../Backend/App/Controladores/AdministrativoCargarUsuarioController.php";
var asynchronus = true;

const init = new administrativoCargarUsuario;
