<?php




class Jueces extends Usuarios{
    private $jueces=[];

    public function getCiJueces($jueces, $user){
        $db = new Conexion();
        $jueces = $db->query("SELECT ci_juez FROM juez WHERE ci_juez='$user';");
        return $jueces;
        if (isset($jueces)) {
            return $jueces;
        }else {
            return null;
        }
    }


}



?>