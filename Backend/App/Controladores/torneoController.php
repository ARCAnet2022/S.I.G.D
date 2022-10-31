<?php
    include '../Modelo/Torneo.php';

    class torneoController{

        public function getEquiposByType(){
                                               
            $deporte = json_decode($_GET['Deporte']);          
            $nombreTorneo = json_decode($_GET['NombreTorneo']);

            $init = new Torneo;

            if ($deporte == 'Futbol') {

                $TorneosFutbol = $init->getTorneoFutbol();
                echo json_encode($TorneosFutbol);
                
            }elseif ($deporte == 'Basquetbol') {

                $TorneosBasket = $init->getTorneoBasket();
                echo json_encode($TorneosBasket);
                
            }elseif ($deporte == 'Balonmano') {

                $TorneosHandball = $init->getTorneoHandball();
                echo json_encode($TorneosHandball);
                
            }elseif($nombreTorneo != 'Elegir Torneo'){
                
                $TorneoData = $init->getSpecificTorneo($nombreTorneo);
                echo json_encode($TorneoData);
                
            }else {
                echo json_encode('Error cargando los datos.');
                
            }

        }
    }

    $initController = new torneoController;
    $initController->getEquiposByType();


?>