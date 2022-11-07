<?php

include '../Modelo/Partidos.php';

class PartidosController{


    public function mostrarPartidos(){
        

        $init = new Partidos;
        
        if (isset($_GET['id_partido'])) {
            $id_partido = json_decode($_GET['id_partido']);
            $rival = $init->conseguirRival($id_partido);

            echo json_encode($rival);
        }else {
            $usuario = json_decode($_GET['ci_usuario']);
            $deportista = json_decode($_GET['ci_deportista']);
            $deporte = json_decode($_GET['deporte']);

            if($usuario != ''){
        
                $partJugadosUser = $init->partidosJugados($usuario, $deporte);
                
                echo json_encode($partJugadosUser);
            }else {
                
                $partJugadosDepor = $init->partidosJugados($deportista, $deporte);
                $partNoJugadosDepor = $init->partidosProximos($deportista,$deporte);

                if ($partJugadosDepor == null) { 
                    echo json_encode($partNoJugadosDepor);
                }

                if ($partNoJugadosDepor == null) {
                    echo json_encode($partJugadosDepor);
                }else {
                    $allData = array_merge($partJugadosDepor,$partNoJugadosDepor);
                    echo json_encode($allData);
                }

                
            }
        }

        

    }

    

}

$part = new PartidosController;
$part->mostrarPartidos();



?>