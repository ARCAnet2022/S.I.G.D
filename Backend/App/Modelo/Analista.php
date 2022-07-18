<?php

class Analista{
    private $ciUsuarioAn
    private $partidosCargados

    /**
     * Get the value of ciUsuarioAn
     */
    public function getCiUsuarioAn()
    {
        return $this->ciUsuarioAn;
    }

    /**
     * Set the value of ciUsuarioAn
     */
    public function setCiUsuarioAn($ciUsuarioAn): self
    {
        $this->ciUsuarioAn = $ciUsuarioAn;

        return $this;
    }

    /**
     * Get the value of partidosCargados
     */
    public function getPartidosCargados()
    {
        return $this->partidosCargados;
    }

    /**
     * Set the value of partidosCargados
     */
    public function setPartidosCargados($partidosCargados): self
    {
        $this->partidosCargados = $partidosCargados;

        return $this;
    }

    function __constructor( int $ciUsuarioAn , int $partidosCargados){

        $this -> ciUsuarioAn = $ciUsuarioAn ;
        $this -> partidosCargados = $partidosCargados ;   
    
    }  

}

?>