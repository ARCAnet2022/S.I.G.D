<?php

    include '../../config/Conexion.php';

    class AnalistaCargarPartido{

        public function getEquipos($deporte){
            $db = new Conexion;
            $equipos = $db->query('select nombre_equipo from equipo
            where nombre_dep="'.$deporte.'";');

            if ($equipos) {
                return $equipos;
            }else {
                $error = 'No hay datos disponibles...';
                return $error;
            }
        }

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

        public function uploadMatch($equipo1,$equipo2,$fecha,$hora_inicio,$hora_fin,$deporte,$ci_juez,$lugar,$ci_analista){

            $db = new Conexion;
            $insertPartido = $db->queryInsert('INSERT into partido (lugar,hora_inicio,hora_fin,fecha,ci_analista,ci_juez) values ("'.$lugar.'","'.$hora_inicio.'","'.$hora_fin.'","'.$fecha.'",'.$ci_analista.','.$ci_juez.');');
            
            $getIdPartido = $db->query('SELECT id_partido 
                                        from partido
                                        order by id_partido desc
                                        LIMIT 1;');
            $idPartido = $getIdPartido[0]['id_partido'];

            $cedulaEntrenador = $db->query('SELECT ci_entrenador 
                                        from equipo
                                        where nombre_equipo="'.$equipo1.'";');
            $cedulaEntrenador2 = $db->query('SELECT ci_entrenador 
                                        from equipo
                                        where nombre_equipo="'.$equipo2.'";');

            $insertPartidoEquipo1 = $db->queryInsert('INSERT into fixture(id_partido,nombre_equipo,ci_juez,ci_analista,ci_entrenador) 
                                                    values ('.$idPartido.',"'.$equipo1.'",'.$ci_juez.','.$ci_analista.','.$cedulaEntrenador[0]['ci_entrenador'].');');
            
            $insertPartidoEquipo2 = $db->queryInsert('INSERT into fixture(id_partido,nombre_equipo,ci_juez,ci_analista,ci_entrenador) 
            values ('.$idPartido.',"'.$equipo2.'",'.$ci_juez.','.$ci_analista.','.$cedulaEntrenador2[0]['ci_entrenador'].');');

            if (!$insertPartidoEquipo1 && !$insertPartidoEquipo2) {
                $success = 'Datos cargados con exito!';
                return $success;
            }else {
                $error = 'No se cargaron los datos';
                return $error;
            }
            
        }

    }


?>