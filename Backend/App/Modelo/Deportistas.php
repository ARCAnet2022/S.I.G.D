<?php




class Deportistas extends Usuarios{
    private $deportistas=[];

    public function getCiDeportistas($deportistas, $user){
        $db = new Conexion();
        $deportistas = $db->query("SELECT ci_deportista FROM deportista WHERE ci_deportista='$user';");
        if (!$deportistas) {
            return null;
        }else {
            return $deportistas;
        }
    }


}



?>