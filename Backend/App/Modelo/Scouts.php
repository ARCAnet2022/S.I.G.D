<?php



class Scouts extends Usuarios{
    private $scouts=[];

    public function getCiScouts($scouts, $user){
        $db = new Conexion();
        $scouts = $db->query("SELECT ci_scout FROM scout WHERE ci_scout='$user';");
        return $scouts;
        if (isset($scouts)) {
            return $scouts;
        }else {
            return null;
        }
    }


}



?>