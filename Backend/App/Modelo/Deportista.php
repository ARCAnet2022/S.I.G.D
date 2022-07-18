<?php

class Deportista{
    private $ciUsuarioDep
    private $NroCamiseta
    private $AptitudFisica
    private $Grupo
    private $nombreEquipo

    /**
     * Get the value of ciUsuarioDep
     */
    public function getCiUsuarioDep()
    {
        return $this->ciUsuarioDep;
    }

    /**
     * Set the value of ciUsuarioDep
     */
    public function setCiUsuarioDep($ciUsuarioDep): self
    {
        $this->ciUsuarioDep = $ciUsuarioDep;

        return $this;
    }

    /**
     * Get the value of NroCamiseta
     */
    public function getNroCamiseta()
    {
        return $this->NroCamiseta;
    }

    /**
     * Set the value of NroCamiseta
     */
    public function setNroCamiseta($NroCamiseta): self
    {
        $this->NroCamiseta = $NroCamiseta;

        return $this;
    }

    /**
     * Get the value of AptitudFisica
     */
    public function getAptitudFisica()
    {
        return $this->AptitudFisica;
    }

    /**
     * Set the value of AptitudFisica
     */
    public function setAptitudFisica($AptitudFisica): self
    {
        $this->AptitudFisica = $AptitudFisica;

        return $this;
    }

    /**
     * Get the value of Grupo
     */
    public function getGrupo()
    {
        return $this->Grupo;
    }

    /**
     * Set the value of Grupo
     */
    public function setGrupo($Grupo): self
    {
        $this->Grupo = $Grupo;

        return $this;
    }

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

    function __constructor(int $ciUsuarioDep , int $NroCamiseta , string $AptitudFisica , string $Grupo , string $nombreEquipo){

        $this -> ciUsuarioDep = $ciUsuarioDep ;
        $this -> NroCamiseta = $NroCamiseta ;
        $this -> AptitudFisica = $AptitudFisica ;
        $this -> Grupo = $Grupo ;
        $this -> nombreEquipo = $nombreEquipo ; 
    
    }  
}

?>