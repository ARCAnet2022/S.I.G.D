<?php
    include '../Modelo/Usuario.php';
    include '../Utils/util.php';
    class LogoutController{
        
        public function logout(){
            unset($_SESSION["user"]);
            unset($_SESSION["is_logged"]);
            /*Destruyo la sesion */
            session_destroy();
            /*Redirecciono a login.php para volver a iniciar la secuencia*/
            header("Location:".basePathFrontend()."/index.html");
            exit();        
        }

    }

    $init = new LogoutController;
    $init->logout();


?>