<?php
    
    session_start();
    /*Elimino las variables del usuario y la que valida si esta logeado con valor booleano */
    unset($_SESSION["user"]);
    unset($_SESSION["is_logged"]);
    /*Destruyo la sesion */
    session_destroy();
    /*Redirecciono a login.php para volver a iniciar la secuencia*/
    header("Location: login.php");
    exit();


?>