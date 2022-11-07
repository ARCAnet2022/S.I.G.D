<?php
include '../Modelo/Usuario.php';

class profileController{

    public function showProfile(){

        /*Consigo el tipo de usuario dependiendo los formularios que llegaron, si ci_usuario esta vacio consigo ci_deportista. Si ci_deportista está vacio, consigo ci_usuario. */
        $initUser = new Usuario;
        $ci_usuario = json_decode($_GET['tipo']);
        $ci_deportista = json_decode($_GET['tipo2']);

        if ($ci_usuario == '') {
            $tipoUsuario = $initUser->getUserType($ci_deportista);
        }elseif ($ci_deportista == '') {
            $tipoUsuario = $initUser->getUserType($ci_usuario);
        }
        
        $tipoUsuario = explode('ci_',$tipoUsuario);
        $user = [$tipoUsuario[1]];        

        if ($user[0] == 'administrador') {

            $dataPerfilAdmin = $initUser->getAdminProfile($ci_usuario);
            $userAdmin = array_merge($dataPerfilAdmin, $user);
            echo json_encode($userAdmin);
            exit();

        }elseif ($user[0] == 'administrativo') {

            $dataPerfilAdministrative = $initUser->getAdministrativeProfile($ci_usuario);
            $userAdministrativo = array_merge($dataPerfilAdministrative, $user);
            echo json_encode($userAdministrativo);
            exit();
        }elseif($user[0] == 'scout'){

            $dataPerfilScout = $initUser->getScoutProfile($ci_usuario);
            $userScout = array_merge($dataPerfilScout, $user);
            echo json_encode($userScout);
            exit();
        }elseif($user[0] == 'juez') {

            $dataPerfilJuez = $initUser->getJuezProfile($ci_usuario);
            $userJuez = array_merge($dataPerfilJuez, $user);
            echo json_encode($userJuez);
            exit();
        }elseif($user[0] == 'analista') {

            $dataPerfilAnalista = $initUser->getAnalistaProfile($ci_usuario);
            $userAnalista = array_merge($dataPerfilAnalista, $user);
            echo json_encode($userAnalista);
            exit();
        }elseif($user[0] == 'entrenador') {

            $dataPerfilEntrenador = $initUser->getEntrenadorProfile($ci_usuario);
            $userEntrenador = array_merge($dataPerfilEntrenador, $user);
            echo json_encode($userEntrenador);
            exit();
        }elseif ($user[0] == 'deportista') {

            $dataPerfilDeportista = $initUser->getDeportistaProfile($ci_deportista);
            $userDeportista = array_merge($dataPerfilDeportista, $user);
            echo json_encode($userDeportista);
            exit();
        }else {
            echo "Error, no existe el perfil";
            exit();
        }

        
        
    }

}

$init = new profileController;
$init->showProfile();
    

?>