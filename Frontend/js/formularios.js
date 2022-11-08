function validar(){
    
    let ci_usuario = document.getElementById('ci_usuario').value;
    window.localStorage.setItem('ci_usuario',ci_usuario);
    let ci_deportista = document.getElementById("ci_deportista").value;
    window.localStorage.setItem('ci_deportista',ci_deportista);
    let contrasena = document.getElementById("contrasena").value;


    if(ci_usuario != '' && contrasena != '' && ci_deportista == ''){
        alert('Cargando su perfil');        
        return true;
    }else if(ci_usuario != '' && contrasena == '' && ci_deportista == ''){
        document.getElementById("mostrarContrasena").innerHTML = '<p class="modalError">El campo contraseña es obligatorio.</p>';
        document.getElementById("mostrarCedula").innerHTML = '<p></p>';
        document.getElementById("mostrar").innerHTML = '<p></p>';
        return false;
    }else if(ci_usuario == '' && contrasena != '' && ci_deportista == ''){
        document.getElementById("mostrarCedula").innerHTML = '<p class="modalError">El campo contraseña Cedula es obligotario</p>';
        document.getElementById("mostrar").innerHTML = '<p></p>';
        document.getElementById("mostrarContrasena").innerHTML = '<p></p>';
        return false;
    }else if(ci_usuario == '' && contrasena == '' && ci_deportista == ''){
        document.getElementById("mostrar").innerHTML = '<p class="modalError">Debe rellenar los formularios</p>';
        document.getElementById("mostrarContrasena").innerHTML = '<p></p>';
        document.getElementById("mostrarCedula").innerHTML = '<p></p>';
        return false;
    }
    
    

    
}

function logout(){
    localStorage.removeItem('ci_usuario');
    localStorage.removeItem('ci_deportista');
    localStorage.clear();
    document.location.href="/S.I.G.D/Frontend/index.html";
    alert('Saliendo del sistema');
}