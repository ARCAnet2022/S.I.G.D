<?php
    include '../../config/Conexion.php';

    class Torneo{


        public function getTorneoFutbol(){

            $db = new Conexion;
            $qryFutbol = $db->query('SELECT nombre from torneo
            where nombre_dep="Futbol";');

            return $qryFutbol;

        }


        public function getTorneoBasket(){

            $db = new Conexion;
            $qryBasket = $db->query('SELECT nombre from torneo
            where nombre_dep="Basquetbol";');

            return $qryBasket;

        }

        public function getTorneoHandball(){

            $db = new Conexion;
            $qryHandball = $db->query('SELECT nombre from torneo
            where nombre_dep="Handbol";');

            return $qryHandball;

        }

        public function getSpecificTorneo($nombreTorneo){
            $db = new Conexion;
            $nombreTorneo = $db->query('SELECT nombre,cantidad_equipos,fecha_inicio,fecha_final,lugar,nombre_dep
            from torneo
            where nombre="'.$nombreTorneo.'";');

            return $nombreTorneo;
        }
    }

?>