<?php
    include '../../config/Conexion.php';

    class Torneo{


        public function getTorneoFutbol(){

            $db = new Conexion;
            $qryFutbol = $db->query('SELECT nombre,id_torneo from torneo
            where nombre_dep="Futbol";');

            return $qryFutbol;

        }


        public function getTorneoBasket(){

            $db = new Conexion;
            $qryBasket = $db->query('SELECT nombre,id_torneo from torneo
            where nombre_dep="Basquetbol";');

            return $qryBasket;

        }

        public function getTorneoHandball(){

            $db = new Conexion;
            $qryHandball = $db->query('SELECT nombre,id_torneo from torneo
            where nombre_dep="Handbol";');

            return $qryHandball;

        }

        public function getSpecificTorneo($nombreTorneo){
            $db = new Conexion;
            $nombreTorneo = $db->query('SELECT nombre,cantidad_equipos,fecha_inicio,fecha_final,lugar,nombre_dep,id_torneo
            from torneo
            where nombre="'.$nombreTorneo.'";');

            return $nombreTorneo;
        }

        public function getPartidosTorneo($id_torneo){
            $db = new Conexion;
            
            $partidosJugados = $db->query('SELECT p.id_partido,f.nombre_equipo,p.fecha,p.hora_inicio,p.hora_fin,f.id_actuacion,a.gano,a.perdio,a.empato,a.anotaciones
            from fixture as f
            inner join partido as p on p.id_partido=f.id_partido
            inner join torneo as t on t.id_torneo=f.id_torneo
            inner join actuacion as a on a.id_actuacion=f.id_actuacion
            where t.id_torneo='.$id_torneo.'
            order by p.id_partido asc;');

            $partidosNoJugados = $db->query('SELECT p.id_partido,f.nombre_equipo,p.fecha,p.hora_inicio,p.hora_fin,f.id_actuacion
            from fixture as f
            inner join partido as p on p.id_partido=f.id_partido
            inner join torneo as t on t.id_torneo=f.id_torneo
            where t.id_torneo='.$id_torneo.' and f.id_actuacion is null
            order by p.id_partido asc;');

            $partidosTorneo = array_merge($partidosJugados,$partidosNoJugados);

            return $partidosTorneo;
        }
    }

?>