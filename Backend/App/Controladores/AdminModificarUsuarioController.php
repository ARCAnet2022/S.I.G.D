<?php
include '../Modelo/AdminModificarUsuario.php';

class AdminModificarUsuarioController
{
    
    public function controlType()
    {
        $init = new AdminModificarUsuario;

        if (isset($_REQUEST['rol'])) {
            $rol = json_decode($_REQUEST['rol']);
            $response = $init->getUsers($rol);
    
            echo json_encode($response);
            exit();
        }

        if (isset($_REQUEST['cedula']) && isset($_REQUEST['rolUsuario'])) {
            $ci = json_decode($_REQUEST['cedula']);
            $rol = json_decode($_REQUEST['rolUsuario']);
            $data = $init->getSpecificUser($ci,$rol);

            echo json_encode($data);
            exit();
        }

        if (isset($_REQUEST['validador'])){
            $rolUser = json_decode($_REQUEST['rolUser']);

            $ci = json_decode($_REQUEST['ci_user']);
            $nombre = json_decode($_REQUEST['name']);
            $apellido = json_decode($_REQUEST['ape']);
            $email = json_decode($_REQUEST['corre']);
            $telefono = json_decode($_REQUEST['tele']);
            $nacionalidad = json_decode($_REQUEST['nacion']);
            $fecha_nac = json_decode($_REQUEST['fecha_na']);
            $calle = json_decode($_REQUEST['street']);
            $numero = json_decode($_REQUEST['number']);
            $ciudad = json_decode($_REQUEST['city']);
            $horas_trabajo_semanales = json_decode($_REQUEST['horas_work']);
            $experiencia = json_decode($_REQUEST['experience']);
            $nro_funcionario = json_decode($_REQUEST['nro_func']);
            $carne_salud = json_decode($_REQUEST['carne_salu']);
            $grupo = json_decode($_REQUEST['grp']);

            if ($rolUser == 'administrador') {
                $data = $init->insertModAdmin($ci,$nombre,$apellido,$email,$telefono,$nacionalidad,$fecha_nac,$calle,$numero,$ciudad,$horas_trabajo_semanales,$experiencia);
                echo json_encode($data);
            }

            if ($rolUser == 'administrativo') {
                $data = $init->insertModAdministrativo($ci,$nombre,$apellido,$email,$telefono,$nacionalidad,$fecha_nac,$calle,$numero,$ciudad,$horas_trabajo_semanales,$nro_funcionario);
                echo json_encode($data);
            }

            if ($rolUser == 'analista') {
                $data = $init->insertModAnalista($ci,$nombre,$apellido,$email,$telefono,$nacionalidad,$fecha_nac,$calle,$numero,$ciudad,$horas_trabajo_semanales,$nro_funcionario);
                echo json_encode($data);
            }

            if ($rolUser == 'deportista') {
                $data = $init->insertModDeportista($ci,$nombre,$apellido,$email,$telefono,$nacionalidad,$fecha_nac,$calle,$numero,$ciudad,$carne_salud,$grupo);
                echo json_encode($data);
            }

            if ($rolUser == 'entrenador') {
                $data = $init->insertModEntrenador($ci,$nombre,$apellido,$email,$telefono,$nacionalidad,$fecha_nac,$calle,$numero,$ciudad,$grupo,$nro_funcionario,$horas_trabajo_semanales);
                echo json_encode($data);
            }

            if ($rolUser == 'scout') {
                $data = $init->insertModScout($ci,$nombre,$apellido,$email,$telefono,$nacionalidad,$fecha_nac,$calle,$numero,$ciudad,$experiencia);
                echo json_encode($data);
            }

            if ($rolUser == 'juez') {
                $data = $init->insertModJuez($ci,$nombre,$apellido,$email,$telefono,$nacionalidad,$fecha_nac,$calle,$numero,$ciudad,$experiencia,$carne_salud,$horas_trabajo_semanales);
                echo json_encode($data);
            }
            
        }
    }

}


$init2 = new AdminModificarUsuarioController;
$init2->controlType();

?>


