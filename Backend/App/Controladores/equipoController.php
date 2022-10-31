<?php
include '../Modelo/Equipo.php';


class equipoController{

    public function showEquipo(){
        
        $initTeam = new Equipo;
        $ci_usuario = json_decode($_GET['ci_user']);
        $ci_deportista = json_decode($_GET['ci_deport']);
        
        

        if ($ci_usuario == '') {
            $dataTeam = $initTeam->getDeportistaTeam($ci_deportista);
            $dataPlantel = $initTeam->getPlantel($ci_deportista);
            $dataMVP = $initTeam->getMVP($ci_deportista);
            $dataTeamStats = $initTeam->getTeamStats($ci_deportista);    
            echo json_encode(array('dataMVP'=>$dataMVP,'dataPlantel'=>$dataPlantel,'dataTeam'=>$dataTeam,'dataTeamStats'=>$dataTeamStats));
            
        }elseif ($ci_deportista = '') {
            
        }
        
    }
}

$initier = new equipoController;
$initier->showEquipo();
    

?>