<?php

include '../Modelo/AdminiCargarUsuario.php';

class AdminCargarUsuarioController{
    
    public function getForms(){
        
        $iniciar = new AdminCargarUsuario;

        $ciUsuarioCargar =json_decode($_REQUEST['ci_usuario']);
        $nombre =json_decode($_REQUEST['nombre']);
        $apellido =json_decode($_REQUEST['apellido']);
        $email =json_decode($_REQUEST['email']);
        $telefono =json_decode($_REQUEST['telefono']);
        $nacionalidad =json_decode($_REQUEST['nacionalidad']);
        $calle =json_decode($_REQUEST['calle']);
        $numero =json_decode($_REQUEST['numero']);
        $ciudad =json_decode($_REQUEST['ciudad']);
        $fecha_nac =json_decode($_REQUEST['fecha_nac']);
        $ci_admin = json_decode($_REQUEST['ci_administrador']);
        $experiencia = json_decode($_REQUEST['experiencia']); 
        $nro_funcionario = json_decode($_REQUEST['nro_funcionario']);  
        $horas_trabajo_semanales = json_decode($_REQUEST['horas_trabajo_semanales']); 
        $carne_salud = json_decode($_REQUEST['carne_salud']); 
        $rol = json_decode($_REQUEST['rol']);
        $grupo = json_decode($_REQUEST['grupo']);
         
        if ($rol == 'administrativo') {
            $data = $iniciar->cargarAdministrativo($ciUsuarioCargar,$nombre,$apellido,$email,$telefono,$nacionalidad,$fecha_nac,
                                                  $calle,$numero,$ciudad,$ci_admin,$nro_funcionario,$horas_trabajo_semanales); 
            echo json_encode($data);
            exit();
        }

        if ($rol == 'analista') {
            $data = $iniciar->cargarAnalista($ciUsuarioCargar,$nombre,$apellido,$email,$telefono,$nacionalidad,$fecha_nac,
                                                  $calle,$numero,$ciudad,$ci_admin,$nro_funcionario,$horas_trabajo_semanales); 
            echo json_encode($data);
            exit();
        }

        if ($rol == 'deportista') {
            $data = $iniciar->cargarDeportista($ciUsuarioCargar,$nombre,$apellido,$email,$telefono,$nacionalidad,$fecha_nac,
                                                $calle,$numero,$ciudad,$ci_admin,$carne_salud,$grupo); 
            echo json_encode($data);
            exit();
        }

        if ($rol == 'entrenador') {
            $data = $iniciar->cargarEntrenador($ciUsuarioCargar,$nombre,$apellido,$email,$telefono,$nacionalidad,$fecha_nac,
                                                $calle,$numero,$ciudad,$ci_admin,$nro_funcionario,$horas_trabajo_semanales,$grupo); 
            echo json_encode($data);
            exit();
        }

        if ($rol == 'juez') {
            $data = $iniciar->cargarJuez($ciUsuarioCargar,$nombre,$apellido,$email,$telefono,$nacionalidad,$fecha_nac,
                                        $calle,$numero,$ciudad,$ci_admin,$experiencia,$horas_trabajo_semanales,$carne_salud); 
            echo json_encode($data);
            exit();
        }

        if ($rol == 'scout') {
            $data = $iniciar->cargarScout($ciUsuarioCargar,$nombre,$apellido,$email,$telefono,$nacionalidad,$fecha_nac,
                                        $calle,$numero,$ciudad,$ci_admin,$experiencia); 
            echo json_encode($data);
            exit();
        }

        if ($rol == 'administrador') {
            $data = $iniciar->cargarAdministrador($ciUsuarioCargar,$nombre,$apellido,$email,$telefono,$nacionalidad,$fecha_nac,
                                        $calle,$numero,$ciudad,$ci_admin,$horas_trabajo_semanales,$experiencia); 
            echo json_encode($data);
            exit();
        }


    }

}
$init = new AdminCargarUsuarioController;
$init->getForms();

?> 