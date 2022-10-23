function validar(){
    
    let ci_usuario = document.getElementById('ci_usuario').value;
    window.localStorage.setItem('ci_usuario',ci_usuario);
    let ci_deportista = document.getElementById("ci_deportista").value;
    window.localStorage.setItem('ci_deportista',ci_deportista);
    let contrasena = document.getElementById("contrasena").value;

    if((!isNaN(ci_usuario) && ci_usuario.length == 8) && (contrasena.length<=15 && contrasena.length >8) && (ci_deportista == '')){
        alert('Cargando su perfil');
        var ci_usuarioVar = localStorage.getItem("ci_usuario");
        jQuery.post("../../Backend/App/Controladores/profileController.php", {ci_usuario: ci_usuarioVar}, function(data){
            alert("Do something with marks.php responses");
        }).fail(function(){
            alert("Error");
        });
        return true;
    }else if (ci_deportista != '' && !isNaN(ci_deportista) && ci_usuario == '' && contrasena == '' && ci_deportista.length == 8) {
        alert('Cargando su perfil de deportista.');
        return true;
    }else if (ci_usuario == '' && contrasena == '' && ci_deportista == ''){
        document.getElementById("mostrar").innerHTML = '<p class="modalError">No puede iniciar sesión si los campos están vacios.</p>';
        return false;
    }else if (ci_usuario == ''){
        document.getElementById("mostrarCedula").innerHTML = '<p class="modalError">El campo cedula es obligatorio</p>';
        return false;
    }else if (contrasena == ''){
        document.getElementById("mostrarContrasena").innerHTML = '<p class="modalError">El campo contraseña es obligatorio.</p>';
        return false;
    }else if (ci_deportista.length<8 && ci_usuario == '' && contrasena == ''){
        document.getElementById("mostrarContrasena").innerHTML = '<p class="modalError">El largo de la cedula debe ser de 8 caracteres.</p>';
        return false;
    }
    
}

function logout(){
    localStorage.clear();
}