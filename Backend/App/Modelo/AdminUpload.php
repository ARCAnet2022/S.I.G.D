<?php
class Upload{
    public $nombre;
    public $apellido;
    public $ci_usuario;
    public $email;
    public $telefono;
    public $nacionalidad;
    public $fecha_nac;
    public $calle;
    public $numero;
    public $ciudad;

    function insertDeportista($ci_usuario,$nombre,$apellido,$email,$telefono,$nacionalidad,$fecha_nac,$calle,$numero,$ciudad,$ci_administrador,$carne_salud,$grupo){
        $db = new Conexion;

        $insert = $db->query('INSERT INTO usuario(ci_usuario,nombre,apellido,email,telefono,nacionalidad,fecha_nac,calle,numero,ciudad,ci_administrador) 
        VALUES ('.$ci_usuario.',"'.$nombre.'","'.$apellido.'","'.$email.'",'.$telefono.',"'.$nacionalidad.'","'.$fecha_nac.'","'.$calle.'",'.$numero.',"'.$ciudad.'",'.$ci_administrador.');');

        $insertDeportista= $db->query('INSERT INTO deportista(ci_deportista,carne_salud) values('.$ci_usuario.',"'.$carne_salud.'");');

        $insertGrupo = $db->query('INSERT INTO grupo_deportista VALUES('.$ci_usuario.','.$grupo.')');
        if ($insert && $insertDeportista) {
            return $insert;
            return $insertDeportista;
            return $insertGrupo;
            echo "Datos cargados con exito";
        }else {
            echo "Error";
        }
    }

    function insertEntrenador($ci_usuario,$nombre,$apellido,$email,$telefono,$nacionalidad,$fecha_nac,$calle,$numero,$ciudad,$ci_administrador,$experiencia,$horas_trabajo_semanales,$nro_funcionario,$grupo){
        $db = new Conexion;

        $insert = $db->query('INSERT INTO usuario(ci_usuario,contrasena,nombre,apellido,email,telefono,nacionalidad,fecha_nac,calle,numero,ciudad,ci_administrador) 
        VALUES ('.$ci_usuario.','.$ci_usuario.',"'.$nombre.'","'.$apellido.'","'.$email.'",'.$telefono.',"'.$nacionalidad.'","'.$fecha_nac.'","'.$calle.'",'.$numero.',"'.$ciudad.'");');

        /*$insertEntrenador = $db->query('INSERT INTO entrenador(ci_entrenador,nro_funcionario,horas_trabajo_semanales) values('.$ci_usuario.','.$nro_funcionario','.$horas_trabajo_semanales.');');

        $insertGrupo = $db->query('INSERT INTO grupo_entrenador(ci_entrenador,grupo) VALUES ('.$ci_entrenador.','.$grupo.'); ');*/

        if ($insert) {
            return $insert;
            return $insertEntrenador;
            return $insertGrupo;
            echo "Datos cargados con exito";
        }else {
            echo "Error";
        }
    }

    function insertAdministrador($ci_usuario,$nombre,$apellido,$email,$telefono,$nacionalidad,$fecha_nac,$calle,$numero,$ciudad,$ci_administrador,$horas_trabajo_semanales,$experiencia){
        $db = new Conexion;
        $insert = $db->query('INSERT INTO usuario(ci_usuario,contrasena,nombre,apellido,email,telefono,nacionalidad,fecha_nac,calle,numero,ciudad,ci_administrador) 
        VALUES ('.$ci_usuario.','.$ci_usuario.',"'.$nombre.'","'.$apellido.'","'.$email.'",'.$telefono.',"'.$nacionalidad.'","'.$fecha_nac.'","'.$calle.'",'.$numero.',"'.$ciudad.'");');

        /*$insertAdministrador = $db->query('INSERT INTO administrador(ci_administrador,horas_trabajo_semanales) values('.$ci_usuario.','.$horas_trabajo_semanales.','.$experiencia.');');
        */
        if ($insert ) {
            echo "Datos cargados con exito";
        }else {
            echo "Error";
        }
    }

    function insertAdministrativo($ci_usuario,$nombre,$apellido,$email,$telefono,$nacionalidad,$fecha_nac,$calle,$numero,$ciudad,$ci_administrador,$horas_trabajo_semanales,$nro_funcionario){
        $db = new Conexion;
        $insert = $db->query('INSERT INTO usuario(ci_usuario,contrasena,nombre,apellido,email,telefono,nacionalidad,fecha_nac,calle,numero,ciudad,ci_administrador) 
        VALUES ('.$ci_usuario.','.$ci_usuario.',"'.$nombre.'","'.$apellido.'","'.$email.'",'.$telefono.',"'.$nacionalidad.'","'.$fecha_nac.'","'.$calle.'",'.$numero.',"'.$ciudad.'");');

        /*$insertAdministrativo = $db->query('insert into administrativo(ci_administrativo,nro_funcionario,horas_trabajo_semanales) values('.$ci_usuario.','.$nro_funcionario.','.$horas_trabajo_semanales.');');
        */
        if ($insert && $insertAdministrativo) {
            echo "Datos cargados con exito";
        }else {
            echo "Error";
        }
    }

    function insertAnalista($ci_usuario,$nombre,$apellido,$email,$telefono,$nacionalidad,$fecha_nac,$calle,$numero,$ciudad,$ci_administrador,$horas_trabajo_semanales,$nro_funcionario){
        $db = new Conexion;
        $insert = $db->query('INSERT INTO usuario(ci_usuario,contrasena,nombre,apellido,email,telefono,nacionalidad,fecha_nac,calle,numero,ciudad,ci_administrador) 
        VALUES ('.$ci_usuario.','.$ci_usuario.',"'.$nombre.'","'.$apellido.'","'.$email.'",'.$telefono.',"'.$nacionalidad.'","'.$fecha_nac.'","'.$calle.'",'.$numero.',"'.$ciudad.'");');
        /*
        $insertAnalista = $db->query('INSERT INTO analista(ci_analista,nro_funcionario,horas_trabajo_semanales) values('.$ci_usuario.','.$nro_funcionario.','.$horas_trabajo_semanales.');');
        */
        if ($insert && $insertAnalista) {
            echo "Datos cargados con exito";
        }else {
            echo "Error";
        }
    }

    function insertJuez($ci_usuario,$nombre,$apellido,$email,$telefono,$nacionalidad,$fecha_nac,$calle,$numero,$ciudad,$ci_administrador,$horas_trabajo_semanales,$experiencia,$carne_salud){
        $db = new Conexion;

        $insert = $db->query('INSERT INTO usuario(ci_usuario,contrasena,nombre,apellido,email,telefono,nacionalidad,fecha_nac,calle,numero,ciudad,ci_administrador) 
        VALUES ('.$ci_usuario.','.$ci_usuario.',"'.$nombre.'","'.$apellido.'",'.$ci_usuario.',"'.$email.'",'.$telefono.',"'.$nacionalidad.'","'.$fecha_nac.'","'.$calle.'",'.$numero.',"'.$ciudad.'");');
        /*
        $insertJuez = $db->query('INSERT INTO juez(ci_juez,experiencia,horas_trabajo_semanales,carne_salud) values('.$ci_usuario.','.$experiencia.','.$horas_trabajo_semanales.','.$carne_salud.');');
        */
        if ($insert && $insertJuez) {
            echo "Datos cargados con exito";
        }else {
            echo "Error";
        }
    }

    function insertScout($ci_usuario,$nombre,$apellido,$email,$telefono,$nacionalidad,$fecha_nac,$calle,$numero,$ciudad,$ci_administrador,$experiencia){
        $db = new Conexion;

        $insert = $db->query('INSERT INTO usuario(ci_usuario,contrasena,nombre,apellido,email,telefono,nacionalidad,fecha_nac,calle,numero,ciudad,ci_administrador) 
        VALUES ('.$ci_usuario.','.$ci_usuario.',"'.$nombre.'","'.$apellido.'","'.$email.'",'.$telefono.',"'.$nacionalidad.'","'.$fecha_nac.'","'.$calle.'",'.$numero.',"'.$ciudad.'");');
        /*
        $insertScout = $db->query('INSERT INTO scout(ci_scout,experiencia) values('.$ci_usuario.','.$experiencia');');
        */
        if ($insert && $insertScout) {
            echo "Datos cargados con exito";
        }else {
            echo "Error";
        }

        
    }

    

}

?>