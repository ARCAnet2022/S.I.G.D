<?php
    include '../Modelo/AnalistaCargarActuacion.php';

    class AnalistaCargarActuacionController{

        public function mostrarEquipos(){
            $init = new AnalistaCargarActuacion;

            if (isset($_REQUEST['futbol'])) {
                $ci_deportista = json_decode($_REQUEST['ci_deportista']);
                $ci_entrenador = json_decode($_REQUEST['ci_entrenador']);
                $anotaciones = json_decode($_REQUEST['anotaciones']);
                $pases = json_decode($_REQUEST['pases']);
                $asistencias = json_decode($_REQUEST['asistencias']);
                $quites = json_decode($_REQUEST['quites']);
                $tiros = json_decode($_REQUEST['tiros']);
                $tarjetaRoja = json_decode($_REQUEST['tarjetaRoja']);
                $tarjetaAmarilla = json_decode($_REQUEST['tarjetaAmarilla']);
                $id_partido = json_decode($_REQUEST['id_partido']);
                $nombre_equipo = json_decode($_REQUEST['nombre_equipo']);
                $resultado = json_decode($_REQUEST['resultado']);
                $faltas = json_decode($_REQUEST['faltas']);
                $respuesta = $init->insertEstadisticaFutbol($ci_deportista,$ci_entrenador,$anotaciones,$pases,$asistencias,$quites,$tiros,$nombre_equipo,$id_partido,$faltas,$tarjetaAmarilla,$tarjetaRoja,$resultado);
                echo json_encode($respuesta);
                exit();
            }
            if (isset($_REQUEST['basket'])) {
                $ci_deportista = json_decode($_REQUEST['ci_deportista']);
                $ci_entrenador = json_decode($_REQUEST['ci_entrenador']);
                $anotaciones = json_decode($_REQUEST['anotaciones']);
                $pases = json_decode($_REQUEST['pases']);
                $asistencias = json_decode($_REQUEST['asistencias']);
                $quites = json_decode($_REQUEST['quites']);
                $tiros = json_decode($_REQUEST['tiros']);
                $rebotes = json_decode($_REQUEST['rebotes']);
                $falta_descalificante = json_decode($_REQUEST['falta_descalificante']);
                $falta_tecnica = json_decode($_REQUEST['falta_tecnica']);
                $falta_personal = json_decode($_REQUEST['falta_personal']);
                $falta_antideportiva = json_decode($_REQUEST['falta_antideportiva']);
                $id_partido = json_decode($_REQUEST['id_partido']);
                $nombre_equipo = json_decode($_REQUEST['nombre_equipo']);
                $resultado = json_decode($_REQUEST['resultado']);
                $faltas = json_decode($_REQUEST['faltas']);

                $respuesta = $init->insertEstadisticaBasquetbol($ci_deportista,$ci_entrenador,$anotaciones,$pases,$asistencias,$quites,$tiros,$nombre_equipo,$id_partido,$faltas,$resultado,$falta_antideportiva,$falta_descalificante,$falta_personal,$falta_tecnica);
                echo json_encode($respuesta);
                exit();
            }

            if (isset($_REQUEST['deporte'])) {
                $deporte = json_decode($_REQUEST['deporte']);
                $response = $init->getEquipos($deporte);
                echo json_encode($response);
                exit();
            }

            if (isset($_REQUEST['nombre_equip']) && isset($_REQUEST['id_partid'])) {
                $nombre_equipo = json_decode($_REQUEST['nombre_equip']);
                $id_partido = json_decode($_REQUEST['id_partid']);
                $response2 = $init->getDeportistas($nombre_equipo,$id_partido);
                echo json_encode($response2);
                exit();
            }

            
        }

    }
    
    $init2 = new AnalistaCargarActuacionController;
    $init2->mostrarEquipos();
?>