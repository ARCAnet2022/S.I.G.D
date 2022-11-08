<?php

include '../Modelo/AdminUpload.php';
include '../Utils/util.php';
include 'sessionController.php';
include '../Modelo/Usuario.php';

class AdminUserUploadController{
    public $nombre;
    public $apellido;
    public $ci_usuario;
    public $email;
    public $telefono;
    public $nacionalidad;
    public $fecha_nac;
    public $calle;
    public $numero;
    public $ciudad;

    function getForms(){
        $init = new Upload;
        $initSes = new sessionController;
        $ci_administrador = $initSes->initSessionUsuario();
        $user = new Usuario;

        $nombre = $_REQUEST['nombre'];
        $apellido = $_REQUEST['apellido'];
        $ci_usuario = $_REQUEST['ci_usuario'];
        $email = $_REQUEST['email'];
        $telefono = $_REQUEST['telefono'];
        $nacionalidad = $_REQUEST['nacionalidad'];
        $fecha_nac = $_REQUEST['fecha_nac'];
        $calle = $_REQUEST['calle'];
        $numero = $_REQUEST['numero'];
        $ciudad = $_REQUEST['ciudad'];
        $rol = $_REQUEST['rol'];

        
       
            if ($rol == 'Deportista') {
                $init->insertDeportista($nombre,$apellido,$ci_usuario,$email,$telefono,$nacionalidad,$fecha_nac,$calle,$numero,$ciudad,$ci_administrador);
                header('Location: '.basePathFrontend().'html/roles/administrador/cargar_usuarios.html');
                exit();
            }elseif ($rol == 'Administrador') {
                $init->insertAdministrador($nombre,$apellido,$ci_usuario,$email,$telefono,$nacionalidad,$fecha_nac,$calle,$numero,$ciudad,$ci_administrador);
                header('Location: '.basePathFrontend().'html/roles/administrador/cargar_usuarios.html');
                exit();
            }elseif ($rol == 'Administrativo') {
                $init->insertAdministrativo($nombre,$apellido,$ci_usuario,$email,$telefono,$nacionalidad,$fecha_nac,$calle,$numero,$ciudad,$ci_administrador);
                header('Location: '.basePathFrontend().'html/roles/administrador/cargar_usuarios.html');
                exit();
            }elseif ($rol == 'Scout') {
                $init->insertScout($nombre,$apellido,$ci_usuario,$email,$telefono,$nacionalidad,$fecha_nac,$calle,$numero,$ciudad,$ci_administrador);
                header('Location: '.basePathFrontend().'html/roles/administrador/cargar_usuarios.html');
                exit();
            }elseif ($rol == 'Juez') {
                $init->insertJuez($nombre,$apellido,$ci_usuario,$email,$telefono,$nacionalidad,$fecha_nac,$calle,$numero,$ciudad,$ci_administrador);
                header('Location: '.basePathFrontend().'html/roles/administrador/cargar_usuarios.html');
                exit();
            }elseif ($rol == 'Analista') {
                $init->insertAnalista($nombre,$apellido,$ci_usuario,$email,$telefono,$nacionalidad,$fecha_nac,$calle,$numero,$ciudad,$ci_administrador);
                header('Location: '.basePathFrontend().'html/roles/administrador/cargar_usuarios.html');
                exit();
            }elseif ($rol == 'Entrenador') {
                $init->insertEntrenador($nombre,$apellido,$ci_usuario,$email,$telefono,$nacionalidad,$fecha_nac,$calle,$numero,$ciudad,$ci_administrador);
                header('Location: '.basePathFrontend().'html/roles/administrador/cargar_usuarios.html');
                exit();
            }
    }

}
$init = new AdminUserUploadController;
$init->getForms();

?> 