<?php

include "../Modelo/Usuario.php";
include "sessionController.php";
include "../Utils/util.php";

class UsuarioController {
    public $ci_deportista;
    public $user;
    private $contrasena;
    public $email;    


    public function loginUsuario(){
        $init = new Usuario;
        $db = new Conexion;
        $initSes = new sessionController;     

        $user = $_REQUEST['ci_usuario'];
        $contrasena = $_REQUEST['contrasena'];
        $usuario = $init->getUserByCiAndPassword($user,$contrasena);

        $ci = $usuario[0]['ci_usuario'];
        $pass = $usuario[0]['contrasena'];

        $userSession= $initSes->initSessionUsuario($user);
        $sesCheck = $initSes->checkSession();

        if ($sesCheck != null) {
            $tipoUsuario = $init->getUserType($sesCheck);
            $tipoUsuarioRuta = explode('ci_',$tipoUsuario);
            $userType = $tipoUsuarioRuta[1];
            /*echo "<script type='text/javascript'>alert('Redirigiendo a su index de ".$userType."');</script>";
            sleep(2);*/
            header("Location: ".basePathFrontend()."html/roles/".$userType."/".$userType.".html");
            exit();
        }else {
            if ($ci == $user && $pass == $contrasena) {
                
                $initSes->initSessionUsuario($user);
                $tipoUsuario = $init->getUserType($user);
                $tipoUsuarioRuta = explode('ci_',$tipoUsuario);
                $userType = $tipoUsuarioRuta[1];
                
                header("Location: ".basePathFrontend()."html/roles/".$userType."/".$userType.".html");
                exit();

                }else {
                    header("Location: ".basePathFrontend()."index.html");
                    exit();
                }
        }
    }


    public function loginDeportista(){
        $init = new Usuario;
        $initSes = new sessionController;
        $deportista = $_REQUEST['ci_deportista'];
        $deport = $init->getDeportistaCi($deportista);
        $ciDeportista = $deport[0]['ci_deportista'];

        if ($ciDeportista == $deportista) 
        {  
            $initSes->initSessionDeportista($deportista);
            header("location:".basePathFrontend()."html/roles/deportista/deportista.html");
            exit();
        }
        else
        {
            header("location:".basePathFrontend()."index.html");
            exit();   
            
        }
    }
          
        
      
    public function validateForms(){
        /*Si solo la CI del deportista es enviada, entonces:*/
        if (empty($_REQUEST['ci_deportista']) == false && empty($_REQUEST['ci_usuario']) == true && empty($_REQUEST['contrasena']) == true && empty($_REQUEST['email']) == true){
            $init = new UsuarioController;
            $init->loginDeportista();
        }
        /*Si la CI del usuario y su contraseña es enviada, entonces:*/
        elseif (empty($_REQUEST['ci_usuario'] && $_REQUEST['contrasena']) == false && empty($_REQUEST['ci_deportista']) && empty($_REQUEST['email']) == true) {
            $init = new UsuarioController;
            $init->loginUsuario();
        }
        /*Si solo quiere recuperar el mail, entonces:*/
        elseif (empty($_REQUEST['email']) == false && empty($_REQUEST['ci_deportista']) == true && empty($_REQUEST['ci_usuario']) == true && empty($_REQUEST['contrasena']) == true) {
            echo "hola3";
        }
        /*En todo otro caso, entonces: */
        else {
            header("Location:".basePathFrontend()."index.html");
            exit(); 
        }
    }

}
    
    $init = new UsuarioController;
    $init->validateForms();
 

?>