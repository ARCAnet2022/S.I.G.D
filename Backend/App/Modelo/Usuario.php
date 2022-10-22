<?php

include '../../config/Conexion.php';


class Usuario{
    public $user;
    private $contrasena;
    public $deportista;
    public $ses;

    public function __construct(){
        $this->db = new Conexion;
    }

    public function getUserByCiAndPassword($user, $contrasena){
        $db = new Conexion();
        $usuario = $db->query("SELECT ci_usuario, contrasena FROM usuario WHERE ci_usuario='$user' AND contrasena='$contrasena'");
        if (count($usuario)) {
            return $usuario;
        }else {
            return null;
        }
    }

    public function getUserType($user){
        $db = new Conexion();
        $userType = $db->query("select (SELECT ci_administrador from administrador where ci_administrador='$user') as ci_administrador, 
        (SELECT ci_administrativo from administrativo where ci_administrativo='$user') as ci_administrativo,
        (SELECT ci_juez from juez where ci_juez='$user') as ci_juez,
        (SELECT ci_scout from scout where ci_scout='$user') as ci_scout,
        (SELECT ci_entrenador from entrenador where ci_entrenador='$user') as ci_entrenador,
        (SELECT ci_analista from analista where ci_analista='$user') as ci_analista");
        
        foreach ($userType as $usuario) {
            foreach ($usuario as $usr => $value) {                  
                    if (!empty($value)) {
                        $storeUsuario = [$usr,$value];
                        return $storeUsuario[0];
                    }
            }
        }
    } 

    public function getAdminProfile(){
        $db = new conexion();
        $sesion = new sessionController;
        $ses = $sesion->checkSession();
        $adminProfile = $db->query("SELECT u.nombre,u.apellido,u.fecha_nac,u.ci_usuario,u.nacionalidad,u.telefono,u.email,u.calle,u.numero,u.ciudad,a.horas_trabajo_semanales,a.experiencia
        FROM usuario as u
        INNER JOIN administrador as a on u.ci_usuario=a.ci_administrador
        HAVING u.ci_usuario='$ses';");
        if (count($adminProfile)) {
            return $adminProfile;
        }else {
            return null;
        }
    }

    public function getAdministrativeProfile(){
        $db = new Conexion();
        $sesion = new sessionController;
        $ses = $sesion->checkSession();
        $administrativeProfile = $db->query("SELECT u.nombre,u.apellido,u.fecha_nac,u.ci_usuario,u.nacionalidad,u.telefono,u.email,u.calle,u.numero,u.ciudad,a.horas_trabajo_semanales,a.experiencia
        FROM usuario as u
        INNER JOIN administrativo as ad on u.ci_usuario=ad.ci_administrador
        HAVING u.ci_usuario=$ses;");
        if (count($administrativeProfile)){
            return $administrativeProfile;
        }else {
            return null;
        }
    }
    
    public function getAnalistaProfile(){
        $db = new Conexion();
        $sesion = new sessionController;
        $ses = $sesion->checkSession();
        $analistaProfile = $db->query("SELECT u.nombre,u.apellido,u.fecha_nac,u.ci_usuario,u.nacionalidad,u.telefono,u.email,u.calle,u.numero,u.ciudad,a.nro_funcionario,a.horas_trabajo_semanales
        FROM usuario as u
        INNER JOIN analista as a on u.ci_usuario=a.ci_analista
        HAVING u.ci_usuario=$ses;");
        if (count($analistaProfile)){
            return $analistaProfile;
        }else {
            return null;
        }
    }

    public function getEntrenadorProfile(){
        $db = new Conexion();
        $sesion = new sessionController;
        $ses = $sesion->checkSession();
        $entrenadorProfile = $db->query("SELECT u.nombre,u.apellido,u.fecha_nac,u.ci_usuario,u.nacionalidad,u.telefono,u.email,u.calle,u.numero,u.ciudad,e.nro_funcionario,e.horas_trabajo_semanales
        FROM usuario as u
        INNER JOIN entrenador as e on u.ci_usuario=e.ci_entrenador
        HAVING u.ci_usuario=$ses;");
        if (count($entrenadorProfile)){
            return $entrenadorProfile;
        }else {
            return null;
        }
    }

    public function getScoutProfile(){
        $db = new Conexion();
        $sesion = new sessionController;
        $ses = $sesion->checkSession();
        $scoutProfile = $db->query("SELECT u.nombre,u.apellido,u.fecha_nac,u.ci_usuario,u.nacionalidad,u.telefono,u.email,u.calle,u.numero,u.ciudad,s.experiencia
        FROM usuario as u
        INNER JOIN scout as s on u.ci_usuario=s.ci_scout
        HAVING u.ci_usuario=$ses;");
        if (count($scoutProfile)){
            return $scoutProfile;
        }else {
            return null;
        }
    }

    public function getJuezProfile(){
        $db = new Conexion();
        $sesion = new sessionController;
        $ses = $sesion->checkSession();
        $juezProfile = $db->query("SELECT u.nombre,u.apellido,u.fecha_nac,u.ci_usuario,u.nacionalidad,u.telefono,u.email,u.calle,u.numero,u.ciudad,j.carne_salud,j.horas_trabajo_semanales,j.experiencia
        FROM usuario as u
        INNER JOIN juez as j on u.ci_usuario=j.ci_juez
        HAVING u.ci_usuario=$ses;");

        if (count($juezProfile)){
            return $juezProfile;
        }else {
            return null;
        }
    }


    /*
    public function getAdminCi(){
        $db = new Conexion();
        $admin = $db->query("SELECT ci_administrador from administrador WHERE ci_administrador='$user';");
        if(count($admin)){
            return $admin;
        }else {
            return null;
        }
    }

    public function getAdministrativoCi(){
        $db = new Conexion();
        $administrativo = $db->query("SELECT ci_administrativo from administrativo WHERE ci_administrativo='$user';");
        if(count($administrativo)){
            return $administrativo;
        }else {
            return null;
        }
    }

    public function getAnalistaCi(){
        $db = new Conexion();
        $analista = $db->query("SELECT ci_analista from analista WHERE ci_analista='$user';");
        if(count($analista)){
            return $analista;
        }else {
            return null;
        }
    }

    public function getEntrenadorCi(){
        $db = new Conexion();
        $entrenador = $db->query("SELECT ci_entrenador from entrenador WHERE ci_entrenador='$user';");
        if(count($entrenador)){
            return $entrenador;
        }else {
            return null;
        }
    }

    public function getScoutCi(){
        $db = new Conexion();
        $scout = $db->query("SELECT ci_scout from scout WHERE ci_scout='$user';");
        if(count($scout)){
            return $scout;
        }else {
            return null;
        }
    }

    public function getDeportistaCi($deportista){
        $deportistaCi = $this->db->query("SELECT ci_deportista from deportista WHERE ci_deportista='$deportista';");
        if(count($deportistaCi)){
            return $deportistaCi;
        }else {
            return null;
        }
    }

    public function getJuezCi(){
        $db = new Conexion();
        $juez = $db->query("SELECT ci_juez from juez WHERE ci_juez='$user';");
        if(count($juez)){
            return $juez;
        }else {
            return null;
        }
    }
    */
}


?>