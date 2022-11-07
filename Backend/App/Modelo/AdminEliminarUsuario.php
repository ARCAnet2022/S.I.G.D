<?php
include '../../config/Conexion.php';

class AdminEliminarUsuario{

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

    public function eliminarUsuarioAdmin($cedula){
        $db = new Conexion;
        $eliminarResponse = $db->queryInsert('call admin_eliminar_admin('.$cedula.');');
        
        if ($eliminarResponse) {
            $error= 'Hubo un error eliminando al usuario..';
            return $error;
            exit();
        }else {
            $success = 'Se ha eliminado el usuario con exito!';
            return $success;
            exit();
        }
    }

    public function eliminarUsuarioAdministrativo($cedula){
        $db = new Conexion;
        $eliminarResponse = $db->queryInsert('call admin_eliminar_administrativo('.$cedula.');');
        
        if ($eliminarResponse) {
            $error= 'Hubo un error eliminando al usuario..';
            return $error;
            exit();
        }else {
            $success = 'Se ha eliminado el usuario con exito!';
            return $success;
            exit();
        }
    }

    public function eliminarUsuarioAnalista($cedula){
        $db = new Conexion;
        $eliminarResponse = $db->queryInsert('call admin_eliminar_analista('.$cedula.');');
        
        if ($eliminarResponse) {
            $error= 'Hubo un error eliminando al usuario..';
            return $error;
            exit();
        }else {
            $success = 'Se ha eliminado el usuario con exito!';
            return $success;
            exit();
        }
    }

    public function eliminarUsuarioDeportista($cedula){
        $db = new Conexion;
        $eliminarResponse = $db->queryInsert('call admin_eliminar_deportista('.$cedula.');');
        
        if ($eliminarResponse) {
            $error= 'Hubo un error eliminando al usuario..';
            return $error;
            exit();
        }else {
            $success = 'Se ha eliminado el usuario con exito!';
            return $success;
            exit();
        }
    }

    public function eliminarUsuarioEntrenador($cedula){
        $db = new Conexion;
        $eliminarResponse = $db->queryInsert('call admin_eliminar_entrenador('.$cedula.');');
        
        if ($eliminarResponse) {
            $error= 'Hubo un error eliminando al usuario..';
            return $error;
            exit();
        }else {
            $success = 'Se ha eliminado el usuario con exito!';
            return $success;
            exit();
        }
    }

    public function eliminarUsuarioJuez($cedula){
        $db = new Conexion;
        $eliminarResponse = $db->queryInsert('call admin_eliminar_juez('.$cedula.');');
        
        if ($eliminarResponse) {
            $error= 'Hubo un error eliminando al usuario..';
            return $error;
            exit();
        }else {
            $success = 'Se ha eliminado el usuario con exito!';
            return $success;
            exit();
        }
    }

    public function eliminarUsuarioScout($cedula){
        $db = new Conexion;
        $eliminarResponse = $db->queryInsert('call admin_eliminar_scout('.$cedula.');');
        
        if ($eliminarResponse) {
            $error= 'Hubo un error eliminando al usuario..';
            return $error;
            exit();
        }else {
            $success = 'Se ha eliminado el usuario con exito!';
            return $success;
            exit();
        }
    }

}

?>