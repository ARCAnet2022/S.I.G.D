<?php
    include '../Modelo/Torneo.php';

    class torneoController{

        public function getEquiposByType(){
            
            if (isset($_GET['Deporte'])) {
                $deporte = json_decode($_GET['Deporte']); 
            }

            if(isset($_GET['NombreTorneo'])) {
                $nombreTorneo = json_decode($_GET['NombreTorneo']);
            }       
            
            

            $init = new Torneo;

            if (isset($deporte) && $deporte == 'Futbol') {

                $TorneosFutbol = $init->getTorneoFutbol();
                echo json_encode($TorneosFutbol);
                
            }elseif (isset($deporte) && $deporte == 'Basquetbol') {

                $TorneosBasket = $init->getTorneoBasket();
                echo json_encode($TorneosBasket);
                
            }elseif (isset($deporte) && $deporte == 'Balonmano') {

                $TorneosHandball = $init->getTorneoHandball();
                echo json_encode($TorneosHandball);
                
            }elseif(isset($nombreTorneo) && $nombreTorneo != 'Elegir Torneo'){
                
                $TorneoData = $init->getSpecificTorneo($nombreTorneo);
                echo json_encode($TorneoData);
                
            }else if(!isset($nombreTorneo) && isset($_GET['IdTorneo'])){
                $id_torneo = json_decode($_GET['IdTorneo']);
                $partidosTorneo = $init->getPartidosTorneo($id_torneo);
                echo json_encode($partidosTorneo);
            }else{
                echo "Error cargando los datos";
            }

        }
    }

    $initController = new torneoController;
    $initController->getEquiposByType();


?>