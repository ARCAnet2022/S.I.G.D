<?php
include '../../config/Conexion.php';

class Equipo{

    public function getDeportistaTeam($ci_deportista){
       $db = new Conexion;
       $ci = json_decode($ci_deportista);

       $deportistaEstadisticas = $db->query('SELECT sum(a.tiros) as Tiros,sum(a.anotaciones) as Anotaciones,sum(a.pases) as Pases,e.nombre_equipo as "NombreEquipo", 
       sum(a.posesion) as "Posesion", sum(a.rebotes) as "Rebotes", round(((a.anotaciones/a.tiros)*100),1) as "Eficiencia"
       from actuacion as a
       inner join equipo as e on a.nombre_equipo=e.nombre_equipo
       inner join deportista as d on d.nombre_equipo=e.nombre_equipo
       where d.ci_deportista = '.$ci.';');

       $deportistaPartidos = $db->query("SELECT count(f.id_partido) as Partidos
       from fixture as f
       inner join equipo as e on e.nombre_equipo=f.nombre_equipo
       inner join deportista as d on e.nombre_equipo=d.nombre_equipo
       where d.ci_deportista = ".$ci.";");

       $allData = array_merge($deportistaEstadisticas, $deportistaPartidos);
        
       if (count($allData)) {
           return $allData;
       }else {
           return null;
       }
   }

   public function getPlantel($ci_deportista){
        $db = new Conexion;
        $ci = json_decode($ci_deportista);
        
        $deportistaEquipo = $db->query('SELECT nombre_equipo
        from deportista
        where ci_deportista='.$ci.';');

        $deportTeam = $deportistaEquipo[0]['nombre_equipo'];

        $deportistas = $db->query('SELECT d.nro_camiseta,d.posicion,u.nombre,u.apellido
        from deportista as d
        inner join usuario as u on d.ci_deportista=u.ci_usuario
        where nombre_equipo="'.$deportTeam.'"
        order by nro_camiseta asc;');

        if(count($deportistas)){
            return $deportistas;
        }else{
            return null;
        }



   }

   public function getMVP($ci_deportista){
        $db = new Conexion;
        $ci = json_decode($ci_deportista);

        $deportistaEquipo = $db->query('SELECT nombre_equipo
        from deportista
        where ci_deportista='.$ci.';');

        $deportTeam = $deportistaEquipo[0]['nombre_equipo'];
        
        $MVPGoles = $db->query('SELECT sum(d.nro_camiseta) as "NumeroCamiseta",u.nombre as "Nombre",sum(e.asistencias) as "Asistencias",
        sum(e.pases) as "Pases",sum(e.anotaciones) as "Anotaciones",sum(e.tiros) as "Tiros",sum(e.rebotes) as "Rebotes",
        sum(e.quites) as "Quites",eq.nombre_equipo,count(e.id_estadistica) as "PartidosJugados"
        from estadistica as e
        inner join equipo as eq on eq.nombre_equipo=e.nombre_equipo
        inner join deportista as d on d.ci_deportista=e.ci_deportista
        inner join usuario as u on d.ci_deportista=u.ci_usuario
        where eq.nombre_equipo="'.$deportTeam.'"
        order by sum(e.anotaciones) desc LIMIT 1;');

        $MVPPases = $db->query('select sum(d.nro_camiseta) as "NumeroCamiseta",u.nombre as "Nombre",sum(e.asistencias) as "Asistencias",
        sum(e.pases) as "Pases",sum(e.anotaciones) as "Anotaciones",sum(e.tiros) as "Tiros",sum(e.rebotes) as "Rebotes",
        sum(e.quites) as "Quites",eq.nombre_equipo,count(e.id_estadistica) as "PartidosJugados"
        from estadistica as e
        inner join equipo as eq on eq.nombre_equipo=e.nombre_equipo
        inner join deportista as d on d.ci_deportista=e.ci_deportista
        inner join usuario as u on d.ci_deportista=u.ci_usuario
        where eq.nombre_equipo="'.$deportTeam.'"
        order by sum(e.pases) desc LIMIT 1;');

        $MVPAsistencias = $db->query('select sum(d.nro_camiseta) as "NumeroCamiseta",u.nombre as "Nombre",sum(e.asistencias) as "Asistencias",
        sum(e.pases) as "Pases",sum(e.anotaciones) as "Anotaciones",sum(e.tiros) as "Tiros",sum(e.rebotes) as "Rebotes",
        sum(e.quites) as "Quites",eq.nombre_equipo,count(e.id_estadistica) as "PartidosJugados"
        from estadistica as e
        inner join equipo as eq on eq.nombre_equipo=e.nombre_equipo
        inner join deportista as d on d.ci_deportista=e.ci_deportista
        inner join usuario as u on d.ci_deportista=u.ci_usuario
        where eq.nombre_equipo="'.$deportTeam.'"
        order by sum(e.asistencias) desc LIMIT 1;');

        $MVPAll = array_merge($MVPGoles, $MVPPases,$MVPAsistencias);

        if(count($MVPAll)){
            return $MVPAll;
        }else{
            return null;
        }
   }

   public function getTeamStats($ci_deportista){
        $db = new Conexion;
        $ci = json_decode($ci_deportista);

        $WinLoseDraw = $db->query('SELECT count(e.gano) as "Ganados", count(e.perdio) as "Perdidos", count(e.empato) as "Empatados"
        from actuacion as e
        inner join equipo as eq on eq.nombre_equipo=e.nombre_equipo
        inner join deportista as d on d.nombre_equipo=eq.nombre_equipo
        where ci_deportista='.$ci.';');

        $sanciones = $db->query('select s.tipo as "TipoTarjeta", sum(s.cantidad) as "Cantidad",eq.nombre_dep as "Deporte"
        from sancion as s
        inner join deportista as d on d.nombre_equipo=s.nombre_equipo
        inner join equipo as eq on eq.nombre_equipo=d.nombre_equipo
        where d.ci_deportista='.$ci.'
        group by s.tipo;');

        $allTeamStats = array_merge($WinLoseDraw, $sanciones);

        if(count($allTeamStats)){
            return $allTeamStats;
        }else {
            return null;
        }


   }



}


?>