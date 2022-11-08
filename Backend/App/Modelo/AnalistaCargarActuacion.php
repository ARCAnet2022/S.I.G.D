<?php
    include '../../config/Conexion.php';

    class AnalistaCargarActuacion{

        public function getEquipos($deporte){
            $db = new Conexion;
            $actuaciones = $db->query('SELECT f.id_partido,f.nombre_equipo,f.ci_juez,f.ci_entrenador 
            from fixture as f
            inner join equipo as e on e.nombre_equipo = f.nombre_equipo
            where id_actuacion is null
            and e.nombre_dep="'.$deporte.'"
            LIMIT 10;');

            if ($actuaciones) {
                return $actuaciones;
                exit();
            }else {
                $error = 'No hay datos para mostrar';
                return $error;
            }
        }

        public function getDeportistas($nombre_equipo,$id_partido){
            $db = new Conexion;
            $deportistas = $db->query('SELECT u.nombre,u.apellido,u.ci_usuario,d.nro_camiseta,d.posicion,e.nombre_dep,e.ci_entrenador
            from usuario as u
            inner join deportista as d on d.ci_deportista=u.ci_usuario
            inner join equipo as e on e.nombre_equipo=d.nombre_equipo
            inner join fixture as f on f.nombre_equipo=e.nombre_equipo
            and d.carne_salud = "SI"
            and d.nombre_equipo="'.$nombre_equipo.'"
            and id_partido = '.$id_partido.'
            order by d.posicion desc;');

            if($deportistas){
                return $deportistas;
                exit();
            }else {
                $error = 'No hay datos para mostrar';
                return $error;
            }
        } 
        
        public function insertEstadisticaFutbol($ci_deportista,$ci_entrenador,$anotaciones,$pases,$asistencias,$quites,$tiros,$nombre_equipo,$id_partido,$faltas,$tarjetaAmarilla,$tarjetaRoja,$resultado){
            $db = new Conexion;
            $insertEstadistica = $db->queryInsert('INSERT into estadistica (pases,asistencias,anotaciones,faltas,quites,tiros,ci_deportista,nombre_equipo,id_partido,ci_entrenador)
            values('.$pases.','.$asistencias.','.$anotaciones.','.$faltas.','.$quites.','.$tiros.','.$ci_deportista.',"'.$nombre_equipo.'",'.$id_partido.','.$ci_entrenador.');');

            $selectEstadisticas = $db->query('SELECT sum(anotaciones) as "anotaciones",sum(pases) as "pases",sum(asistencias) as "asistencias",sum(faltas) as "faltas",sum(tiros) as "tiros"
            from estadistica
            where nombre_equipo="'.$nombre_equipo.'"
            and id_partido='.$id_partido.';');
            
            $selectIdActuacion = $db->query('SELECT id_actuacion 
            from actuacion
            order by id_actuacion desc
            LIMIT 1;');

            $updateFixture = $db->queryInsert('UPDATE fixture
            set id_actuacion='.$selectIdActuacion[0]['id_actuacion'].'
            where nombre_equipo="'.$nombre_equipo.'"
            and id_partido='.$id_partido.'');

            if ($resultado == 'gano') {
                $updateActuacionSuma = $db->queryInsert('INSERT into actuacion(anotaciones,pases,tiros,'.$resultado.') values 
                ('.$selectEstadisticas[0]['anotaciones'].','.$selectEstadisticas[0]['pases'].','.$selectEstadisticas[0]['tiros'].',1);');
            }
            if ($resultado == 'perdio') {
                $updateActuacionSuma = $db->queryInsert('INSERT into actuacion(anotaciones,pases,faltas,tiros,'.$resultado.') values 
                ('.$selectEstadisticas[0]['anotaciones'].','.$selectEstadisticas[0]['pases'].','.$selectEstadisticas[0]['tiros'].',1);');
            }
            if ($resultado == 'empato') {
                $updateActuacionSuma = $db->queryInsert('INSERT into actuacion(anotaciones,pases,tiros,'.$resultado.') values 
                ('.$selectEstadisticas[0]['anotaciones'].','.$selectEstadisticas[0]['pases'].','.$selectEstadisticas[0]['tiros'].',1);');
            }

            if ($tarjetaRoja >= 1) {
                $insertSancion1 = $db->queryInsert('INSERT into sancion(cantidad,suspendido,tipo,id_partido,ci_deportista,ci_entrenador)
                values('.$tarjetaRoja.',"SI","Tarjeta Roja",'.$id_partido.','.$ci_deportista.','.$ci_entrenador.');');
            }

            if ($tarjetaAmarilla >= 2) {
                $insertSancion2 = $db->queryInsert('INSERT into sancion(cantidad,suspendido,tipo,id_partido,ci_deportista,ci_entrenador)
                values('.$tarjetaAmarilla.',"SI","Tarjeta Amarilla",'.$id_partido.','.$ci_deportista.','.$ci_entrenador.');');

                $insertSancion3 = $db->queryInsert('INSERT into sancion(cantidad,suspendido,tipo,id_partido,ci_deportista,ci_entrenador)
                values(1,"SI","Tarjeta Roja",'.$id_partido.'.$id_partido.'.$ci_deportista.','.$ci_entrenador.');');
            }
            $success = "Se cargaron los datos.";
            return $success;
        }

        public function insertEstadisticaBasquetbol($ci_deportista,$ci_entrenador,$anotaciones,$pases,$asistencias,$quites,$tiros,$nombre_equipo,$id_partido,$faltas,$resultado,$falta_antideportiva,$falta_descalificante,$falta_personal,$falta_tecnica){
            $db = new Conexion;
            $insertEstadistica = $db->queryInsert('INSERT into estadistica (rebotes,pases,asistencias,anotaciones,faltas,quites,tiros,ci_deportista,nombre_equipo,id_partido,ci_entrenador)
            values('.$rebotes.','.$pases.','.$asistencias.','.$anotaciones.','.$faltas.','.$quites.','.$tiros.','.$ci_deportista.',"'.$nombre_equipo.'",'.$id_partido.','.$ci_entrenador.');');

            $selectEstadisticas = $db->query('SELECT sum(anotaciones) as "anotaciones",sum(pases) as "pases",sum(asistencias) as "asistencias",sum(faltas) as "faltas",sum(tiros) as "tiros",sum(rebotes) as "Rebotes"
            from estadistica
            where nombre_equipo="'.$nombre_equipo.'"
            and id_partido='.$id_partido.';');
            
            $selectIdActuacion = $db->query('SELECT id_actuacion 
            from actuacion
            order by id_actuacion desc
            LIMIT 1;');

            $updateFixture = $db->queryInsert('UPDATE fixture
            set id_actuacion='.$selectIdActuacion[0]['id_actuacion'].'
            where nombre_equipo="'.$nombre_equipo.'"
            and id_partido='.$id_partido.'');

            if ($resultado == 'gano') {
                $updateActuacionSuma = $db->queryInsert('INSERT into actuacion(rebotes,anotaciones,pases,tiros,'.$resultado.') values 
                ('.$selectEstadisticas[0]['rebotes'].','.$selectEstadisticas[0]['anotaciones'].','.$selectEstadisticas[0]['pases'].','.$selectEstadisticas[0]['tiros'].',1);');
            }
            if ($resultado == 'perdio') {
                $updateActuacionSuma = $db->queryInsert('INSERT into actuacion(rebotes,anotaciones,pases,faltas,tiros,'.$resultado.') values 
                ('.$selectEstadisticas[0]['rebotes'].','.$selectEstadisticas[0]['anotaciones'].','.$selectEstadisticas[0]['pases'].','.$selectEstadisticas[0]['tiros'].',1);');
            }
            if ($resultado == 'empato') {
                $updateActuacionSuma = $db->queryInsert('INSERT into actuacion(rebotes,anotaciones,pases,tiros,'.$resultado.') values 
                ('.$selectEstadisticas[0]['rebotes'].','.$selectEstadisticas[0]['anotaciones'].','.$selectEstadisticas[0]['pases'].','.$selectEstadisticas[0]['tiros'].',1);');
            }

            if ($tarjetaRoja >= 1) {
                $insertSancion1 = $db->queryInsert('INSERT into sancion(cantidad,suspendido,tipo,id_partido,ci_deportista,ci_entrenador)
                values('.$tarjetaRoja.',"SI","Tarjeta Roja",'.$id_partido.','.$ci_deportista.','.$ci_entrenador.');');
            }

            if ($tarjetaAmarilla >= 2) {
                $insertSancion2 = $db->queryInsert('INSERT into sancion(cantidad,suspendido,tipo,id_partido,ci_deportista,ci_entrenador)
                values('.$tarjetaAmarilla.',"SI","Tarjeta Amarilla",'.$id_partido.','.$ci_deportista.','.$ci_entrenador.');');

                $insertSancion3 = $db->queryInsert('INSERT into sancion(cantidad,suspendido,tipo,id_partido,ci_deportista,ci_entrenador)
                values(1,"SI","Tarjeta Roja",'.$id_partido.'.$id_partido.'.$ci_deportista.','.$ci_entrenador.');');
            }
            $success = "Se cargaron los datos.";
            return $success;
        }

    }

?>