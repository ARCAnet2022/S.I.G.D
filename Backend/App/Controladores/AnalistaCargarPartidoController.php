<?php
    include '../Modelo/AnalistaCargarPartido.php';

    class AnalistaCargarPartidoController{

        public function mostrarEquipos(){

            $initPartido = new AnalistaCargarPartido;
            if (isset($_REQUEST['phantom2'])) {
                $equipo1 = json_decode($_REQUEST['equipo1']);
                $equipo2 = json_decode($_REQUEST['equipo2']);
                $fecha = json_decode($_REQUEST['fecha']);
                $hora_inicio = json_decode($_REQUEST['hora_inicio']);
                $hora_fin = json_decode($_REQUEST['hora_fin']);
                $deporte = json_decode($_REQUEST['deporte']);
                $ci_juez = json_decode($_REQUEST['ci_juez']);
                $lugar = json_decode($_REQUEST['lugar']);
                $ci_analista = json_decode($_REQUEST['ci_analista']);
                $response = $initPartido->uploadMatch($equipo1,$equipo2,$fecha,$hora_inicio,$hora_fin,$deporte,$ci_juez,$lugar,$ci_analista);
                echo json_encode($response);
                exit();
            }
            if (isset($_REQUEST['deporte'])) {
                $deporte = json_decode($_REQUEST['deporte']);
                $response = $initPartido->getEquipos($deporte);
                echo json_encode($response);
                exit();
            }

            if (isset($_REQUEST['phantom'])) {
                $response = $initPartido->conseguirJueces();
                echo json_encode($response);
            }

            

        }

    }


$init = new AnalistaCargarPartidoController;
$init->mostrarEquipos();
?>