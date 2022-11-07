<?php
include '../Modelo/AnalistaCargarCampeonato.php';


    class AnalistaCargarCampeonatoController{
        
        public function mostrarJueces(){
            $init = new AnalistaCargarCampeonato;
            

            if (isset($_REQUEST['ci_analista'])) {
                
                $nombre_torneo = json_decode($_REQUEST['nombre_torneo']);
                $deporte = json_decode($_REQUEST['deporte']);
                $fecha_inicio = json_decode($_REQUEST['fecha_inicio']);
                $fecha_fin = json_decode($_REQUEST['fecha_fin']);
                $lugar = json_decode($_REQUEST['lugar']);
                $ci_analista = json_decode($_REQUEST['ci_analista']);

                $init->cargarTorneo($nombre_torneo,$fecha_inicio,$fecha_fin,$lugar,$ci_analista,$deporte);

                
                exit();
            }

            if (isset($_REQUEST['nombre_equipo'])) {

                $init->cargarPartido();
            }
            if(!isset($_REQUEST['nombre_torneo'])){                
                $showJueces = $init->conseguirJueces();              
                echo json_encode($showJueces);
                exit();
            }



        }

    }

$init = new AnalistaCargarCampeonatoController;
$init->mostrarJueces();

?>