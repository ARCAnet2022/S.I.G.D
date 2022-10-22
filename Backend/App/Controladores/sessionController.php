<?php

    class sessionController{
        /*Control de sesiones*/
        private $user;
        private $deportista;
        private $sessionId;

        /* */
        public function initSessionDeportista($deportista){
            session_start();
            $_SESSION["is_logged"] = true;
            $_SESSION["user"] = $deportista;
        }

        public function initSessionUsuario($usuario){
            session_start();
            $_SESSION["is_logged"] = true;
            $_SESSION["user"] = $usuario;
        }

        function checkSession(){
            if(isset($_SESSION['is_logged']) && $_SESSION['is_logged']){
                $sessionId = $_SESSION["user"];
                return $sessionId;
            }else {
                header('Location: ../../../Frontend/index.html');
            }
        }

        

        
    }

?>