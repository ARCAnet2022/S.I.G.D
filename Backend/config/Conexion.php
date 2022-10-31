<?php 

    class Conexion{
        /*Declaro variables protegidas para incluir */
        protected $server = "localhost";
        protected $username = "root";
        protected $pass = "";
        protected $database = "SIGDFinal";
        private $conexion = NULL;

        /*Constructor de la conexion */
        function __construct(){
            
                $this->conexion = new mysqli($this->server, $this->username, $this->pass, $this->database);            
        }
        
        /*Funcion query que transforma en array asociativos las consultas a la base de datos*/
        function query($query){
            $result = $this->conexion->query($query);
            return $result->fetch_all(MYSQLI_ASSOC);
        }
    }
?>