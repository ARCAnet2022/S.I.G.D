<?php

include '../Modelo/AdminEliminarUsuario.php';

class AdminEliminarUsuarioController{

    public function getType(){
        $init = new AdminEliminarUsuario;

        if (isset($_REQUEST['rol'])) {
            $rol = json_decode($_REQUEST['rol']);
            $response = $init->getUsers($rol);
    
            echo json_encode($response);
            exit();
        }

        if (isset($_REQUEST['cedula']) && isset($_REQUEST['rolUsuario']) && isset($_REQUEST['ci_admin'])) {
            $rol = json_decode($_REQUEST['rolUsuario']);
            $cedula = json_decode($_REQUEST['cedula']);
            $ci_admin = json_decode($_REQUEST['ci_admin']);

            if ($ci_admin == $cedula) {
                echo json_encode("No se puede eliminar a si mismo.");
            }else {
                if ($rol == 'administrador') {
                    $response = $init->eliminarUsuarioAdmin($cedula);           
                    echo json_encode($response);
                    exit();
                }
                if ($rol == 'administrativo') {
                    $response = $init->eliminarUsuarioAdministrativo($cedula);           
                    echo json_encode($response);
                    exit();
                }
                if ($rol == 'analista') {
                    $response = $init->eliminarUsuarioAnalista($cedula);           
                    echo json_encode($response);
                    exit();
                }
                if ($rol == 'deportista') {
                    $response = $init->eliminarUsuarioDeportista($cedula);           
                    echo json_encode($response);
                    exit();
                }
                if ($rol == 'entrenador') {
                    $response = $init->eliminarUsuarioEntrenador($cedula);           
                    echo json_encode($response);
                    exit();
                }
                if ($rol == 'juez') {
                    $response = $init->eliminarUsuarioJuez($cedula);           
                    echo json_encode($response);
                    exit();
                }
                if ($rol == 'scout') {
                    $response = $init->eliminarUsuarioScout($cedula);           
                    echo json_encode($response);
                    exit();
                }
            }

            
            exit();
        }
    }
}

$init2 = new AdminEliminarUsuarioController;
$init2->getType();

?>

