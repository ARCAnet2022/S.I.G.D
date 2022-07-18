<?php

class Equipo{
    private $nombreEquipo
    private $ColoresCamiseta
    private $Partidos
    private $Plantel
    private $ciUsuarioEnt

    /**
     * Get the value of nombreEquipo
     */
    public function getNombreEquipo()
    {
        return $this->nombreEquipo;
    }

    /**
     * Set the value of nombreEquipo
     */
    public function setNombreEquipo($nombreEquipo): self
    {
        $this->nombreEquipo = $nombreEquipo;

        return $this;
    }

    /**
     * Get the value of ColoresCamiseta
     */
    public function getColoresCamiseta()
    {
        return $this->ColoresCamiseta;
    }

    /**
     * Set the value of ColoresCamiseta
     */
    public function setColoresCamiseta($ColoresCamiseta): self
    {
        $this->ColoresCamiseta = $ColoresCamiseta;

        return $this;
    }

    /**
     * Get the value of Partidos
     */
    public function getPartidos()
    {
        return $this->Partidos;
    }

    /**
     * Set the value of Partidos
     */
    public function setPartidos($Partidos): self
    {
        $this->Partidos = $Partidos;

        return $this;
    }

    /**
     * Get the value of Plantel
     */
    public function getPlantel()
    {
        return $this->Plantel;
    }

    /**
     * Set the value of Plantel
     */
    public function setPlantel($Plantel): self
    {
        $this->Plantel = $Plantel;

        return $this;
    }

    /**
     * Get the value of ciUsuarioEnt
     */
    public function getCiUsuarioEnt()
    {
        return $this->ciUsuarioEnt;
    }

    /**
     * Set the value of ciUsuarioEnt
     */
    public function setCiUsuarioEnt($ciUsuarioEnt): self
    {
        $this->ciUsuarioEnt = $ciUsuarioEnt;

        return $this;
    }

    function __constructor( string $nombreEquipo , string $ColoresCamiseta , string $Partidos , string $Plantel , int $ciUsuarioEnt){

        $this -> nombreEquipo = $nombreEquipo ;
        $this -> ColoresCamiseta = $ColoresCamiseta ;
        $this -> Partidos = $Partidos ;
        $this -> Plantel = $Plantel ;
        $this -> ciUsuarioEnt = $ciUsuarioEnt ;
    
    }  
}

?>