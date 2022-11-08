<?php

include '../../config/Conexion.php';


class Usuario{
    public $user;
    private $contrasena;
    public $deportista;
    public $ses;

    public function getUserByCiAndPassword($user, $contrasena){
        $db = new Conexion();
        $usuario = $db->query("SELECT ci_usuario, contrasena FROM usuario WHERE ci_usuario='$user' AND contrasena='$contrasena'");
        if (count($usuario)) {
            return $usuario;
        }else {
            return null;
        }
    }

    public function getDeportistaCi($deportista){
        $db = new Conexion();
        $deport = $db->query("SELECT ci_deportista FROM deportista WHERE ci_deportista='$deportista'");
        if (count($deport)) {
            return $deport;
        }else {
            return null;
        }
    }

    public function getUserType($ci_usuario){
        $db = new Conexion();
        $userType = $db->query("select (SELECT ci_administrador from administrador where ci_administrador='$ci_usuario') as ci_administrador, 
        (SELECT ci_administrativo from administrativo where ci_administrativo='$ci_usuario') as ci_administrativo,
        (SELECT ci_juez from juez where ci_juez='$ci_usuario') as ci_juez,
        (SELECT ci_scout from scout where ci_scout='$ci_usuario') as ci_scout,
        (SELECT ci_entrenador from entrenador where ci_entrenador='$ci_usuario') as ci_entrenador,
        (SELECT ci_analista from analista where ci_analista='$ci_usuario') as ci_analista,
        (SELECT ci_deportista from deportista where ci_deportista='$ci_usuario') as ci_deportista;");
        
        foreach ($userType as $usuario) {
            foreach ($usuario as $usr => $value) {                  
                    if (!empty($value)) {
                        $storeUsuario = [$usr,$value];
                        $store = $storeUsuario[0];
                        return $store;
                        
                    }
            }
        }
    } 

    public function getDeportistaProfile($ci_deportista){
        $db = new conexion();
        $ci = json_decode($ci_deportista);
        $deportistaProfile = $db->query("SELECT u.nombre,u.apellido,u.fecha_nac,u.ci_usuario,u.nacionalidad,u.telefono,u.email,u.calle,u.numero,u.ciudad,d.nro_camiseta,d.carne_salud,d.nombre_equipo,d.suspendido,d.posicion
        FROM usuario as u
        INNER JOIN deportista as d on u.ci_usuario=d.ci_deportista
        HAVING u.ci_usuario=".$ci.";");
        if (count($deportistaProfile)) {
            return $deportistaProfile;
        }else {
            return null;
        }
    }

    public function getAdminProfile($ci_usuario){
        $db = new conexion();
        $ci = json_decode($ci_usuario);
        $adminProfile = $db->query("SELECT u.nombre,u.apellido,u.fecha_nac,u.ci_usuario,u.nacionalidad,u.telefono,u.email,u.calle,u.numero,u.ciudad,a.horas_trabajo_semanales,a.experiencia
        FROM usuario as u
        INNER JOIN administrador as a on u.ci_usuario=a.ci_administrador
        HAVING u.ci_usuario=$ci;");
        if (count($adminProfile)) {
            return $adminProfile;
        }else {
            return null;
        }
    }

    
    public function getAdministrativeProfile($ci_usuario){
        $db = new Conexion();
        $ci = json_decode($ci_usuario);
        $administrativeProfile = $db->query("SELECT u.nombre,u.apellido,u.fecha_nac,u.ci_usuario,u.nacionalidad,u.telefono,u.email,u.calle,u.numero,u.ciudad,a.nro_funcionario,a.horas_trabajo_semanales
        FROM usuario as u
        INNER JOIN administrativo as a on u.ci_usuario=a.ci_administrativo
        HAVING u.ci_usuario=$ci;");
        if (count($administrativeProfile)){
            return $administrativeProfile;
        }else {
            return null;
        }
    }
    
    public function getAnalistaProfile($ci_usuario){
        $db = new Conexion();
        $ci = json_decode($ci_usuario);
        $analistaProfile = $db->query("SELECT u.nombre,u.apellido,u.fecha_nac,u.ci_usuario,u.nacionalidad,u.telefono,u.email,u.calle,u.numero,u.ciudad,a.nro_funcionario,a.horas_trabajo_semanales
        FROM usuario as u
        INNER JOIN analista as a on u.ci_usuario=a.ci_analista
        HAVING u.ci_usuario=$ci;");
        if (count($analistaProfile)){
            return $analistaProfile;
        }else {
            return null;
        }
    }

    public function getEntrenadorProfile($ci_usuario){
        $db = new Conexion();
        $ci = json_decode($ci_usuario);
        $entrenadorProfile = $db->query("SELECT u.nombre,u.apellido,u.fecha_nac,u.ci_usuario,u.nacionalidad,u.telefono,u.email,u.calle,u.numero,u.ciudad,e.nro_funcionario,e.horas_trabajo_semanales
        FROM usuario as u
        INNER JOIN entrenador as e on u.ci_usuario=e.ci_entrenador
        HAVING u.ci_usuario=$ci;");
        if (count($entrenadorProfile)){
            return $entrenadorProfile;
        }else {
            return null;
        }
    }

    public function getScoutProfile($ci_usuario){
        $db = new Conexion();
        $ci = json_decode($ci_usuario);

        $scoutProfile = $db->query("SELECT u.nombre,u.apellido,u.fecha_nac,u.ci_usuario,u.nacionalidad,u.telefono,u.email,u.calle,u.numero,u.ciudad,s.experiencia
        FROM usuario as u
        INNER JOIN scout as s on u.ci_usuario=s.ci_scout
        HAVING u.ci_usuario=$ci;");

        if (count($scoutProfile)){
            return $scoutProfile;
        }else {
            return null;
        }
    }

    public function getJuezProfile($ci_usuario){
        $db = new Conexion();
        $ci = json_decode($ci_usuario);

        $juezProfile = $db->query("SELECT u.nombre,u.apellido,u.fecha_nac,u.ci_usuario,u.nacionalidad,u.telefono,u.email,u.calle,u.numero,u.ciudad,j.carne_salud,j.horas_trabajo_semanales,j.experiencia
        FROM usuario as u
        INNER JOIN juez as j on u.ci_usuario=j.ci_juez
        HAVING u.ci_usuario=$ci;");

        if (count($juezProfile)){
            return $juezProfile;
        }else {
            return null;
        }
    }

}


?>