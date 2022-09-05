<?php
include_once '../../config/Conexion.php';


class Usuarios{
    private $usuarios=[];

    public function getUserByNameAndPassword($usuarios,$user,$pw)
    {
        $db = new Conexion();
        $usuarios = $db->query("SELECT ci_usuario, contrasena FROM usuario WHERE ci_usuario='$user' AND contrasena='$pw'");
        if (count($usuarios)) {
            return $usuarios;
        }else {
            return null;
        }
    }
}



?>