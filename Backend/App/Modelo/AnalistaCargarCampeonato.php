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

            $torneo = $db->queryInsert('insert into torneo(nombre,fecha_inicio,fecha_final,lugar,ci_analista,nombre_dep) values ("'.$nombre_torneo.'","'.$fecha_inicio.'","'.$fecha_fin.'","'.$lugar.'",'.$ci_analista.',"'.$deporte.'");');
        }

        public function cargarPartido($nombre_torneo,$fecha_inicio,$fecha_fin,$lugar,$ci_analista,$deporte){
            $db = new Conexion;

            $torneo = $db->queryInsert('');
        }
    }

?>