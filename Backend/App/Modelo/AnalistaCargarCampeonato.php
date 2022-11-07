<?php
include '../../config/Conexion.php';

    class AnalistaCargarCampeonato{
        

        public function conseguirJueces(){
            $db = new Conexion;
            
            $jueces = $db->query('SELECT u.nombre,u.apellido,u.ci_usuario
            from usuario as u
            inner join juez as j on j.ci_juez=u.ci_usuario
            where j.carne_salud="SI";');
            if ($jueces) {
                return $jueces;
                exit();
            }else {
                $error = 'Error mostrando los datos...';
                return $error;
                exit();
            }
        }

        public function cargarTorneo($nombre_torneo,$fecha_inicio,$fecha_fin,$lugar,$ci_analista,$deporte){
            $db = new Conexion;
            $torneo = $db->queryInsert('INSERT into torneo(nombre,fecha_inicio,fecha_final,lugar,ci_analista,nombre_dep) values ("'.$nombre_torneo.'","'.$fecha_inicio.'","'.$fecha_fin.'","'.$lugar.'",'.$ci_analista.',"'.$deporte.'");');
            if (!$torneo) {
                $success = "Datos cargados con exito...";
                return $success;
            }else {
                $error = "Los datos no se cargaron.";
                return $error;
            }
        }

        public function cargarPartido($nombre_equipo,$nombre_equipo2,$hora_inicio,$hora_fin,$fecha,$ci_analista,$lugar,$ci_juez,$nombre_torneo){
            $db = new Conexion;
            $partido = $db->queryInsert('INSERT into partido (lugar,hora_inicio,hora_fin,fecha,ci_analista,ci_juez) values ("'.$lugar.'","'.$hora_inicio.'","'.$hora_fin.'","'.$fecha.'",'.$ci_analista.','.$ci_juez.');');

            $idPartidoCargado = $db->query('SELECT id_partido 
            from partido
            order by id_partido desc
            LIMIT 1;');
            
            $cedulaEntrenador = $db->query('SELECT ci_entrenador 
            from equipo
            where nombre_equipo="'.$nombre_equipo.'";');

            $cedulaEntrenador2 = $db->query('SELECT ci_entrenador 
            from equipo
            where nombre_equipo="'.$nombre_equipo2.'";');


            $id_torneo = $db->query('SELECT id_torneo 
            from torneo
            where nombre="'.$nombre_torneo.'"
            LIMIT 1;');

            $db->queryInsert('INSERT into fixture(id_partido,nombre_equipo,id_torneo,ci_juez,ci_analista,ci_entrenador) 
                            values ('.$idPartidoCargado[0]['id_partido'].',"'.$nombre_equipo.'",'.$id_torneo[0]['id_torneo'].','.$ci_juez.','.$ci_analista.','.$cedulaEntrenador[0]['ci_entrenador'].');');

            $db->queryInsert('INSERT into fixture(id_partido,nombre_equipo,id_torneo,ci_juez,ci_analista,ci_entrenador) 
            values ('.$idPartidoCargado[0]['id_partido'].',"'.$nombre_equipo2.'",'.$id_torneo[0]['id_torneo'].','.$ci_juez.','.$ci_analista.','.$cedulaEntrenador2[0]['ci_entrenador'].');');

            $exito = "Datos cargados con exito...";
            return $exito;
        }
    }

?>