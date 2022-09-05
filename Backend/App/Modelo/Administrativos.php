<?php




class Administrativos extends Usuarios{
    private $administrativos=[];

    public function getCiAdministrativos($administrativos, $user){
        $db = new Conexion();
        $administrativos = $db->query("SELECT ci_administrativo FROM administrativo WHERE ci_administrativo='$user';");
        if (isset($administrativos)) {
            return $administrativos;
        }else {
            return null;
        }
    }


}



?>