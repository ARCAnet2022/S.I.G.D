<?php




class Analistas extends Usuarios{
    private $analistas=[];

    public function getCiAnalistas($analistas, $user){
        $db = new Conexion();
        $analistas = $db->query("SELECT ci_analista FROM analista WHERE ci_analista='$user';");
        if (isset($analistas)) {
            return $analistas;
        }else {
            return null;
        }
    }

}



?>