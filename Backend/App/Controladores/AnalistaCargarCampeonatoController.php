<?php
include '../Modelo/AnalistaCargarCampeonato.php';


    class AnalistaCargarCampeonatoController{
        
        public function mostrarJueces(){
            $init = new AnalistaCargarCampeonato;
            

            if (isset($_REQUEST['nombre_torneo'])) {
                $nombre_torneo = json_decode($_REQUEST['nombre_torneo']);
                $deporte = json_decode($_REQUEST['deporte']);
                $fecha_inicio = json_decode($_REQUEST['fecha_inicio']);
                $fecha_fin = json_decode($_REQUEST['fecha_fin']);
                $lugar = json_decode($_REQUEST['lugar']);
                $ci_analista = json_decode($_REQUEST['ci_analista']);

                $respuesta = $init->cargarTorneo($nombre_torneo,$fecha_inicio,$fecha_fin,$lugar,$ci_analista,$deporte);    
                echo json_encode($respuesta);            
                
            }

            if (isset($_REQUEST['nombre_tournament'])) {
                
                $ci_analista = json_decode($_REQUEST['ci_analista']);
                $nombre_equipo = json_decode($_REQUEST['nombre_equipo']);
                $nombre_equipo2 = json_decode($_REQUEST['nombre_equipo2']);
                $hora_inicio = json_decode($_REQUEST['hora_inicio']);
                $hora_fin = json_decode($_REQUEST['hora_fin']);
                $fecha = json_decode($_REQUEST['fecha']);
                $lugar = json_decode($_REQUEST['lugar']);
                $ci_juez = json_decode($_REQUEST['ci_juez']);
                $nombre_torneo = json_decode($_REQUEST['nombre_tournament']);
                
                $respuesta = $init->cargarPartido($nombre_equipo,$nombre_equipo2,$hora_inicio,$hora_fin,$fecha,$ci_analista,$lugar,$ci_juez,$nombre_torneo);
                echo json_encode($respuesta);            
                
            }

            if(!isset($_REQUEST['nombre_torneo'])){                
                $showJueces = $init->conseguirJueces();              
                echo json_encode($showJueces);
                
            }



        }

    }

$init = new AnalistaCargarCampeonatoController;
$init->mostrarJueces();

?>