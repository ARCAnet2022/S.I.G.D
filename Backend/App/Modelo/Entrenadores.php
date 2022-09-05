<?php




class Entrenadores extends Usuarios{
    private $entrenadores=[];

    public function getCiEntrenadores($entrenador, $user){
        $db = new Conexion();
        $entrenadores = $db->query("SELECT ci_entrenador FROM entrenador WHERE ci_entrenador=$user;");
        if (count($entrenadores) === 0) {
            return null;
        }else {
            return $entrenadores;
        }
    }
}



?>