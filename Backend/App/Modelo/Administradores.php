<?php



class Administradores extends Usuarios{
    private $administradores=[];

    public function getCiAdministradores($administradores, $user){
        $db = new Conexion();
        $administradores = $db->query("SELECT ci_administrador FROM administrador WHERE ci_administrador='$user';");
        if (isset($administradores)) {
            return $administradores;
        }else {
            return null;
        }
    }

}



?>