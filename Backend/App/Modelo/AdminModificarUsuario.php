<?php
include '../../config/Conexion.php';

    class AdminModificarUsuario
    {

        public function getUsers($rol){
            $db = new Conexion;
            $datos = $db->query('select u.nombre,u.apellido,u.ci_usuario
            from usuario as u
            inner join '.$rol.' as x on x.ci_'.$rol.'=u.ci_usuario;');
            
            if (!$datos) {
                $error= 'No se encontraron datos';
                return $error;
                exit();
            }else {
                return $datos;
                exit();
            }
        }

        public function getSpecificUser($ci,$rol){
            $db = new Conexion;
            if ($rol == 'administrador') 
            {
                $datos = $db->query('SELECT u.ci_usuario,u.nombre,u.apellido,u.email,u.telefono,u.nacionalidad,u.fecha_nac,u.calle,u.numero,u.ciudad,a.horas_trabajo_semanales,a.experiencia
                from usuario as u
                inner join administrador as a on a.ci_administrador=u.ci_usuario
                and a.ci_administrador='.$ci.';');

                if (!$datos) 
                {
                    $error= 'No se encontraron datos';
                    return $error;
                    exit();
                }
                else 
                {
                    return $datos;
                    exit();
                }
            }

            if ($rol == 'analista') 
            {
                $datos = $db->query('SELECT u.ci_usuario,u.nombre,u.apellido,u.email,u.telefono,u.nacionalidad,u.fecha_nac,u.calle,u.numero,u.ciudad,a.nro_funcionario,a.horas_trabajo_semanales
                from usuario as u
                inner join analista as a on a.ci_analista=u.ci_usuario
                and a.ci_analista='.$ci.';');

                if (!$datos) 
                {
                    $error= 'No se encontraron datos';
                    return $error;
                    exit();
                }
                else 
                {
                    return $datos;
                    exit();
                }
            }

            if ($rol == 'administrativo') 
            {
                $datos = $db->query('SELECT u.ci_usuario,u.nombre,u.apellido,u.email,u.telefono,u.nacionalidad,u.fecha_nac,u.calle,u.numero,u.ciudad,a.nro_funcionario,a.horas_trabajo_semanales
                from usuario as u
                inner join administrativo as a on a.ci_administrativo=u.ci_usuario
                and a.ci_administrativo='.$ci.';');

                if (!$datos) 
                {
                    $error= 'No se encontraron datos';
                    return $error;
                    exit();
                }
                else 
                {
                    return $datos;
                    exit();
                }
            }

            if ($rol == 'deportista') 
            {
                $datos = $db->query('SELECT u.ci_usuario,u.nombre,u.apellido,u.email,u.telefono,u.nacionalidad,u.fecha_nac,u.calle,u.numero,u.ciudad,d.carne_salud,g.grupo
                from usuario as u
                inner join deportista as d on d.ci_deportista=u.ci_usuario
                inner join grupo_deportista as g on g.ci_deportista=d.ci_deportista
                and d.ci_deportista='.$ci.';');

                if (!$datos) 
                {
                    $error= 'No se encontraron datos';
                    return $error;
                    exit();
                }
                else 
                {
                    return $datos;
                    exit();
                }
            }
            
            if ($rol == 'entrenador') 
            {
                $datos = $db->query('SELECT u.ci_usuario,u.nombre,u.apellido,u.email,u.telefono,u.nacionalidad,u.fecha_nac,u.calle,u.numero,u.ciudad,e.horas_trabajo_semanales,e.nro_funcionario,g.grupo
                from usuario as u
                inner join entrenador as e on e.ci_entrenador=u.ci_usuario
                inner join grupo_entrenador as g on e.ci_entrenador=g.ci_entrenador
                and e.ci_entrenador='.$ci.';');

                if (!$datos) 
                {
                    $error= 'No se encontraron datos';
                    return $error;
                    exit();
                }
                else 
                {
                    return $datos;
                    exit();
                }
            }

            if ($rol == 'juez') 
            {
                $datos = $db->query('SELECT u.ci_usuario,u.nombre,u.apellido,u.email,u.telefono,u.nacionalidad,u.fecha_nac,u.calle,u.numero,u.ciudad,j.carne_salud,j.horas_trabajo_semanales,j.experiencia
                from usuario as u
                inner join juez as j on j.ci_juez=u.ci_usuario
                and j.ci_juez='.$ci.';');

                if (!$datos) 
                {
                    $error= 'No se encontraron datos';
                    return $error;
                    exit();
                }
                else 
                {
                    return $datos;
                    exit();
                }
            }

            if ($rol == 'scout') 
            {
                $datos = $db->query('SELECT u.ci_usuario,u.nombre,u.apellido,u.email,u.telefono,u.nacionalidad,u.fecha_nac,u.calle,u.numero,u.ciudad,s.experiencia
                from usuario as u
                inner join scout as s on s.ci_scout=u.ci_usuario
                and s.ci_scout='.$ci.';');

                if (!$datos) 
                {
                    $error= 'No se encontraron datos';
                    return $error;
                    exit();
                }
                else 
                {
                    return $datos;
                    exit();
                }
            }


        }
        
        public function insertModAdmin($ci,$nombre,$apellido,$email,$telefono,$nacionalidad,$fecha_nac,$calle,$numero,$ciudad,$horas_trabajo_semanales,$experiencia)
        {
            $db = new Conexion;

            $datosAdmin = $db->queryInsert('call admin_modificar_administrador('.$ci.',"'.$nombre.'","'.$apellido.'","'.$email.'",
            '.$telefono.',"'.$nacionalidad.'","'.$fecha_nac.'","'.$calle.'",'.$numero.',"'.$ciudad.'",'.$horas_trabajo_semanales.','.$experiencia.');');

            if (!$datosAdmin) {
                $success = "Datos cargados con exito!";
                return $success;
                exit();
            }else {
                $error = "Error cargando los datos!";
                return $error;
                exit();
            }
        }

        public function insertModAdministrativo($ci,$nombre,$apellido,$email,$telefono,$nacionalidad,$fecha_nac,$calle,$numero,$ciudad,$horas_trabajo_semanales,$nro_funcionario)
        {
            $db = new Conexion;

            $datosAdministrativo = $db->queryInsert('call admin_modificar_administrativo('.$ci.',"'.$nombre.'","'.$apellido.'","'.$email.'",'.$telefono.',"'.$nacionalidad.'","'
            .$fecha_nac.'","'.$calle.'",'.$numero.',"'.$ciudad.'",'.$horas_trabajo_semanales.','.$nro_funcionario.');');

            if (!$datosAdministrativo) {
                $success = "Datos cargados con exito!";
                return $success;
                exit();
            }else {
                $error = "Error cargando los datos!";
                return $error;
                exit();
            }
        }

        public function insertModAnalista($ci,$nombre,$apellido,$email,$telefono,$nacionalidad,$fecha_nac,$calle,$numero,$ciudad,$horas_trabajo_semanales,$nro_funcionario)
        {
            $db = new Conexion;

            $datosAnalista = $db->queryInsert('call admin_modificar_analista('.$ci.',"'.$nombre.'","'.$apellido.'","'.$email.'",'.$telefono.',"'
            .$nacionalidad.'","'.$fecha_nac.'","'.$calle.'",'.$numero.',"'.$ciudad.'",'.$horas_trabajo_semanales.','.$nro_funcionario.');');

            if (!$datosAnalista) {
                $success = "Datos cargados con exito!";
                return $success;
                exit();
            }else {
                $error = "Error cargando los datos!";
                return $error;
                exit();
            }
        }

        public function insertModDeportista($ci,$nombre,$apellido,$email,$telefono,$nacionalidad,$fecha_nac,$calle,$numero,$ciudad,$carne_salud,$grupo)
        {
            $db = new Conexion;

            $datosDeportista = $db->queryInsert('call admin_modificar_deportista('.$ci.',"'.$nombre.'","'.$apellido.'","'.$email.'",'.$telefono.',"'
            .$nacionalidad.'","'.$fecha_nac.'","'.$calle.'",'.$numero.',"'.$ciudad.'","'.$carne_salud.'","'.$grupo.'");');

            if (!$datosDeportista) {
                $success = "Datos cargados con exito!";
                return $success;
                exit();
            }else {
                $error = "Error cargando los datos!";
                return $error;
                exit();
            }
        }

        public function insertModEntrenador($ci,$nombre,$apellido,$email,$telefono,$nacionalidad,$fecha_nac,$calle,$numero,$ciudad,$grupo,$nro_funcionario,$horas_trabajo_semanales)
        {
            $db = new Conexion;

            $datosEntrenador = $db->queryInsert('call admin_modificar_entrenador('.$ci.',"'.$nombre.'","'.$apellido.'","'.$email.'",'.$telefono.',"'
            .$nacionalidad.'","'.$fecha_nac.'","'.$calle.'",'.$numero.',"'.$ciudad.'","'.$grupo.'",'.$ci.','.$horas_trabajo_semanales.');');

            if (!$datosEntrenador) {
                $success = "Datos cargados con exito!";
                return $success;
                exit();
            }else {
                $error = "Error cargando los datos!";
                return $error;
                exit();
            }
        }

        public function insertModScout($ci,$nombre,$apellido,$email,$telefono,$nacionalidad,$fecha_nac,$calle,$numero,$ciudad,$experiencia)
        {
            $db = new Conexion;

            $datosScout = $db->queryInsert('call admin_modificar_scout('.$ci.',"'.$nombre.'","'.$apellido.'","'.$email.'",'.$telefono.',"'
            .$nacionalidad.'","'.$fecha_nac.'","'.$calle.'",'.$numero.',"'.$ciudad.'",'.$experiencia.');');

            if (!$datosScout) {
                $success = "Datos cargados con exito!";
                return $success;
                exit();
            }else {
                $error = "Error cargando los datos!";
                return $error;
                exit();
            }
        }

        public function insertModJuez($ci,$nombre,$apellido,$email,$telefono,$nacionalidad,$fecha_nac,$calle,$numero,$ciudad,$experiencia,$carne_salud,$horas_trabajo_semanales)
        {
            $db = new Conexion;

            $dataJuez = $db->queryInsert('call admin_modificar_juez('.$ci.',"'.$nombre.'","'.$apellido.'","'.$email.'",'.$telefono.',"'
            .$nacionalidad.'","'.$fecha_nac.'","'.$calle.'",'.$numero.',"'.$ciudad.'",'.$experiencia.',"'.$carne_salud.'",'.$horas_trabajo_semanales.');');

            if (!$dataJuez) {
                $success = "Datos cargados con exito!";
                return $success;
                exit();
            }else {
                $error = "Error cargando los datos!";
                return $error;
                exit();
            }
        }

    }

?>