const arrayUsers = [];
class adminEliminarUsuario{


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
                        '<td><button type="button" data-toggle="modal" data-target="#myModal'+i+'" class="btn btn-outline-info bg-light btn-sm lenguaje" data-key="eliminar" id="'+dat[i].ci_usuario+'" >Eliminar</button></td>'+
                    '</tr>'+
                    '<div class="modal" id="myModal'+i+'">'+
                    '<div class="modal-dialog">'+
                        '<div class="modal-content">'+
                        '<div class="modal-header">'+
                            '<h4 class="modal-title" style="color:blue;">ESTÁ SEGURO QUE DESEA ELIMINAR A ESTE USUARIO?</h4>'+
                            '<button type="button" class="close" data-dismiss="modal">&times;</button>'+
                        '</div>'+
                            '<div class="modal-body">'+
                              '<p>Presione </p>'+'<p style="color:red;">ELIMINAR</p>'+'<p>Para eliminar al usuario seleccionado.</p>'+
                            '</div>'  +                  
                            '<div class="modal-footer row">'+
                                '<button type="button" class="btn btn-info col-3" data-dismiss="modal">Salir</button>'+
                                '<div class="col-md-5"></div>'+
                                '<button id="eliminar" type="button" class="btn btn-danger col-3" data-dismiss="modal" onclick="javascript:init.eliminarUsuario('+dat[i].ci_usuario+');">ELIMINAR</button>'+
                            '</div>'+
                        '</div>'+
                    '</div>'+
                    '</div>';
                    
            }

            
            

        }).fail(function() 
        { 
        alert("Algo salió mal cargando los datos..."); 
        });

    }

    eliminarUsuario(cedula){
        
        ajax.open(method, url, asynchronus); 
        let dropdownRoles =document.getElementById('dropdownRol').value;
        let rolUsuario = JSON.stringify(dropdownRoles);
        let ci = JSON.stringify(cedula);

        let ci_adminActual = localStorage.getItem('ci_usuario');    
        let ci_admin = JSON.stringify(ci_adminActual);

        jQuery.get(url, {cedula: ci, rolUsuario: rolUsuario, ci_admin: ci_admin}, function(data) 
        { 
            let dat = JSON.parse(data);

            if (dat == "No se puede eliminar a si mismo.") {
                document.getElementById('mostrarForm').setAttribute("class", "alert alert-danger mx-auto");
                document.getElementById('mostrarForm').innerHTML = 'No se puede eliminar a si mismo!';
                document.getElementById('mostrarForm').setAttribute("style","display:grid; justify-content:center;");
                init.dropdownFiltrarValores();
                setTimeout(function(){
                    window.location.reload();
                 }, 2000);
            }else{
                document.getElementById('mostrarForm').setAttribute("class", "alert alert-success mx-auto");
                document.getElementById('mostrarForm').innerHTML = 'El usuario ha sido eliminado con exito!';
                document.getElementById('mostrarForm').setAttribute("style","display:grid; justify-content:center;");
                init.dropdownFiltrarValores();
            }
            
        }).fail(function() 
        { 
        alert("Algo salió mal cargando los datos..."); 
        });

        
    }

}

var ajax = new XMLHttpRequest();
var method = "GET";
var url = "../../../../Backend/App/Controladores/AdminEliminarUsuarioController.php";
var asynchronus = true;

const init = new adminEliminarUsuario;