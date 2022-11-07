<?php
include '../../config/Conexion.php';

class Partidos{
    
    public function partidosProximos($ci,$deporte){
        $db = new Conexion;

        $partidosProximos = $db->query('SELECT p.fecha,p.lugar,p.hora_inicio,p.hora_fin,t.nombre,f.nombre_equipo,p.id_partido,f.id_actuacion
        from fixture as f
        inner join partido as p on p.id_partido=f.id_partido
        inner join torneo as t on t.id_torneo=f.id_torneo
        inner join equipo as e on e.nombre_equipo=f.nombre_equipo
        inner join deportista as d on d.nombre_equipo=e.nombre_equipo
        where ci_deportista='.$ci.'
        and f.id_actuacion is null
        and e.nombre_dep="'.$deporte.'";');

        return $partidosProximos;
    }


    public function partidosJugados($ci_user, $deporte){
        $db = new Conexion;

        $partidosJugados = $db->query('SELECT p.fecha,p.lugar,p.hora_inicio,p.hora_fin,t.nombre,f.nombre_equipo,p.id_partido,f.id_actuacion
        from fixture as f
        inner join partido as p on p.id_partido=f.id_partido
        inner join torneo as t on t.id_torneo=f.id_torneo
        inner join equipo as e on e.nombre_equipo=f.nombre_equipo
        inner join deportista as d on d.nombre_equipo=e.nombre_equipo
        where ci_deportista='.$ci_user.'
        and f.id_actuacion is not null
        and e.nombre_dep="'.$deporte.'";');


        return $partidosJugados;

    }

    public function conseguirRival($id_partido){
        $db = new Conexion;

        $conseguirRivalJugados = $db->query('SELECT f.nombre_equipo as "rival"
        from fixture as f
        inner join partido as p on p.id_partido=f.id_partido
        where f.id_partido='.$id_partido.'');

        return $conseguirRivalJugados;

    }


    
}




?>