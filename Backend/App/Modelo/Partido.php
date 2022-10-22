<?php
include '../../config/Conexion.php';

Class Partido{
    public $id_partido;
    public $lugar; 
    public $hora_inicio; 
    public $hora_fin;
    public $fecha;
    public $ci_analista; 
    public $ci_juez; 


    public function createPartido($id_partido,$lugar,$hora_inicio,$hora_fin,$fecha,$ci_analista,$ci_juez){
        $db = new Conexion;
        $qry = $db->query('INSERT INTO partido VALUES ('.$id_partido.','.$lugar.','.$hora_inicio.','.$hora_fin.','.$fecha.','.$ci_analista.','.$ci_juez.');');
    }

    public function getPartidoById($id_partido){
        $db = new Conexion;
        $qry = $db->query('SELECT * FROM partido WHERE id_partido='.$id_partido);
    }

    public function
    
}



?>