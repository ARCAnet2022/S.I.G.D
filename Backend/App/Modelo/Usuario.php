<?php

include  'Usuarios.php';
include  'Entrenadores.php';
include  'Deportistas.php';
include  'Administradores.php';
include  'Administrativos.php';
include  'Jueces.php';
include  'Scouts.php';
include  'Analistas.php';


/*Almaceno los valores de las superglobales que provienen de los formularios*/
if (isset($_REQUEST['ci_usuario']) && isset($_REQUEST['contrasena'])  || isset($_REQUEST['ci_deportista'])) {

    /*Instancio los objetos de cada clase y llamo a su funcion correspondiente para obtener la ci del usuario que va a ingresar. */
    $user = $_REQUEST['ci_usuario'];  
    $deport = $_REQUEST['ci_deportista'];  
    $pw = $_REQUEST['contrasena'];

    $deportistas = new Deportistas();
    $deportista = $deportistas->getCiDeportistas($deportistas, $deport);
    if (!$user && !$pw) {
        foreach ($deportista[0] as $deportist) 
            {
                if ($deportist == $deport) {
                    session_start();
    
                    $_SESSION["is_logged"] = true;
    
                    $_SESSION["user"] = $usr;
    
                    header("Location: ../../../Frontend/HTML/Roles/deportista/deportista.html");
                    exit();
                }     
            }
    }

    $tmp = new Usuarios();
    $usuario = $tmp->getUserByNameAndPassword($usuarios, $user, $pw);

    $entrenadores = new Entrenadores();
    $entrenador = $entrenadores->getCiEntrenadores($entrenadores, $user);

    

    $analistas = new Analistas();
    $analista = $analistas->getCiAnalistas($analistas, $user);

    $jueces = new Jueces();
    $juez = $jueces->getCiJueces($jueces, $user);

    $administrativos = new Administrativos();
    $administrativo = $administrativos->getCiAdministrativos($administrativos, $user);

    $administradores = new Administradores();
    $administrador = $administradores->getCiAdministradores($administradores, $user);

    $scouts = new Scouts();
    $scout = $scouts->getCiScouts($scouts, $user);
}else {
    header("Location: ../../../Frontend/Index.html");
}



/*Si el usuario no existe lo derivo a Index.html */
if (!$usuario) {
    header("Location: ../../../Frontend/Index.html");
}
else{
    /*Si el usuario existe recorro la tabla usuario en la posicion 0 (donde está ubicado la id del usuario) */
    foreach ($usuario[0] as $usr) {

        /*Si el id de usuario que consegui desde la base de datos es igual al input que almacene en $user*/
        if ($usr == $user ) 
        {
            /*Recorro las tablas de los distintos usuarios para validar que tipo de usuario es y a que index lo voy a derivar*/
            foreach ($administrador[0] as $admin) 
            {
                if ($admin == $user) {
                    /*Si encuentra un match y entra al if, se inicia la session, se almacena los datos de la sesion con la ci del usuario y un valor booleano que
                    indica si la session esta iniciada.*/
                    session_start();
    
                    $_SESSION["is_logged"] = true;
    
                    $_SESSION["user"] = $usr;
                    /*Se redirige a la pagina del usuario*/
                    header("Location: ../../../Frontend/html/roles/administrador/administrador.html");
                    exit();
                }     
            } 

            foreach ($administrativo[0] as $administ) 
            {
                if ($administ == $user) {
                    session_start();
    
                    $_SESSION["is_logged"] = true;
    
                    $_SESSION["user"] = $usr;
    
                    header("Location: ../../../Frontend/html/roles/administrativo/administrativo.html");
                    exit();
                }     
            }

            foreach ($entrenador[0] as $ent) 
            {
                if ($ent == $user) {
                    session_start();
    
                    $_SESSION["is_logged"] = true;
    
                    $_SESSION["user"] = $usr;
    
                    header("Location: ../../../Frontend/html/roles/entrenador/entrenador.html");
                    exit();
                }     
            }

            foreach ($juez[0] as $jz) 
            {
                if ($jz == $user) {
                    session_start();
    
                    $_SESSION["is_logged"] = true;
    
                    $_SESSION["user"] = $usr;
    
                    header("Location: ../../../Frontend/html/roles/juez/juez.html");
                    exit();
                }     
            }

            foreach ($analista[0] as $anali) 
            {
                if ($anali == $user) {
                    session_start();
    
                    $_SESSION["is_logged"] = true;
    
                    $_SESSION["user"] = $usr;
    
                    header("Location: ../../../Frontend/html/roles/analista/analista.html");
                    exit();
                }     
            }

            foreach ($scout[0] as $sct) 
            {
                if ($sct == $user) {
                    session_start();
    
                    $_SESSION["is_logged"] = true;
    
                    $_SESSION["user"] = $usr;
    
                    header("Location: ../../../Frontend/html/roles/scouts/scouts.html");
                    exit();
                }     
            }
        }
    }
}


?>