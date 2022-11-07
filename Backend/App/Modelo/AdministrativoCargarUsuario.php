<?php
include '../../config/Conexion.php';

class AdministrativoCargarUsuario{
    
    public function cargarAdministrativo($ci_user,$nombre,$apellido,$email,$telefono,$nacionalidad,$fecha_nac,$calle,$numero,$ciudad,$ci_admin,$nro_funcionario,$horas_trabajo_semanales){
        $db = new Conexion;
        $administrativoCargado = $db->queryInsert("CALL administrativo_cargar_administrativo(".$ci_user.",'".$nombre."','".$apellido."','".$email."',".$telefono.",
        '".$nacionalidad."','".$fecha_nac."','".$calle."',".$numero.",'".$ciudad."',".$ci_admin.",".$nro_funcionario.",".$horas_trabajo_semanales.");");

        if (!$administrativoCargado) {
            $success = "Se cargaron los datos con exito!";
            return $success;
            exit();
        }else {
            return $administrativoCargado;
        }


    }
    
    public function cargarAnalista($ci_user,$nombre,$apellido,$email,$telefono,$nacionalidad,$fecha_nac,$calle,$numero,$ciudad,$ci_admin,$nro_funcionario,$horas_trabajo_semanales){
        
        $db = new Conexion;
        $analistaCargado = $db->queryInsert("CALL administrativo_cargar_analista(".$ci_user.",'".$nombre."','".$apellido."','".$email."',".$telefono.",
        '".$nacionalidad."','".$fecha_nac."','".$calle."',".$numero.",'".$ciudad."',".$ci_admin.",".$nro_funcionario.",".$horas_trabajo_semanales.");");

        if (!$analistaCargado) {
            $success = "Se cargaron los datos con exito!";
            return $success;
            exit();
        }else {
            return $analistaCargado;
        }

    }

    public function cargarDeportista($ci_user,$nombre,$apellido,$email,$telefono,$nacionalidad,$fecha_nac,$calle,$numero,$ciudad,$ci_admin,$carne_salud,$grupo){
        
        $db = new Conexion;
        $deportistaCargado = $db->queryInsert("CALL administrativo_cargar_deportista(".$ci_user.",'".$nombre."','".$apellido."','".$email."',".$telefono.",
        '".$nacionalidad."','".$fecha_nac."','".$calle."',".$numero.",'".$ciudad."',".$ci_admin.",'".$carne_salud."','".$grupo."');");

        if (!$deportistaCargado) {
            $success = "Se cargaron los datos con exito!";
            return $success;
            exit();
        }else {
            return $deportistaCargado;
        }

    }

    public function cargarEntrenador($ci_user,$nombre,$apellido,$email,$telefono,$nacionalidad,$fecha_nac,$calle,$numero,$ciudad,$ci_admin,$nro_funcionario,$horas_trabajo_semanales,$grupo){
        
        $db = new Conexion;
        $entrenadorCargado = $db->queryInsert("CALL administrativo_cargar_entrenador(".$ci_user.",'".$nombre."','".$apellido."','".$email."',".$telefono.",
        '".$nacionalidad."','".$fecha_nac."','".$calle."',".$numero.",'".$ciudad."',".$ci_admin.",".$nro_funcionario.",".$horas_trabajo_semanales.",'".$grupo."');");

        if (!$entrenadorCargado) {
            $success = "Se cargaron los datos con exito!";
            return $success;
            exit();
        }else {
            return $entrenadorCargado;
        }

    }

    public function cargarJuez($ci_user,$nombre,$apellido,$email,$telefono,$nacionalidad,$fecha_nac,$calle,$numero,$ciudad,$ci_admin,$experiencia,$horas_trabajo_semanales,$carne_salud){
        
        $db = new Conexion;
        $juezCargado = $db->queryInsert("CALL administrativo_cargar_juez(".$ci_user.",'".$nombre."','".$apellido."','".$email."',".$telefono.",
        '".$nacionalidad."','".$fecha_nac."','".$calle."',".$numero.",'".$ciudad."',".$ci_admin.",".$experiencia.",".$horas_trabajo_semanales.",'".$carne_salud."');");

        if (!$juezCargado) {
            $success = "Se cargaron los datos con exito!";
            return $success;
            exit();
        }else {
            return $juezCargado;
        }

    }

    public function cargarScout($ci_user,$nombre,$apellido,$email,$telefono,$nacionalidad,$fecha_nac,$calle,$numero,$ciudad,$ci_admin,$experiencia){
        
        $db = new Conexion;
        $scoutCargado = $db->queryInsert("CALL administrativo_cargar_scout(".$ci_user.",'".$nombre."','".$apellido."','".$email."',".$telefono.",
        '".$nacionalidad."','".$fecha_nac."','".$calle."',".$numero.",'".$ciudad."',".$ci_admin.",".$experiencia.");");

        if (!$scoutCargado) {
            $success = "Se cargaron los datos con exito!";
            return $success;
            exit();
        }else {
            return $scoutCargado;
        }

    }

    public function cargarAdministrador($ci_user,$nombre,$apellido,$email,$telefono,$nacionalidad,$fecha_nac,$calle,$numero,$ciudad,$ci_admin,$horas_trabajo_semanales,$experiencia){
        
        $db = new Conexion;
        $adminCargado = $db->queryInsert("CALL administrativo_cargar_administrador(".$ci_user.",'".$nombre."','".$apellido."','".$email."',".$telefono.",
        '".$nacionalidad."','".$fecha_nac."','".$calle."',".$numero.",'".$ciudad."',".$ci_admin.",".$horas_trabajo_semanales.",".$experiencia.");");

        if (!$adminCargado) {
            $success = "Se cargaron los datos con exito!";
            return $success;
            exit();
        }else {
            return $adminCargado;
        }

    }

}

?>