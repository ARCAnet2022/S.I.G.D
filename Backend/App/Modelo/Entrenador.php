<?php

class Entrenador{
    private $ciUsuarioEnt
    private $grupo
    private $NroFuncionario
    private $horasTrabajadas

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

    /**
     * Get the value of grupo
     */
    public function getGrupo()
    {
        return $this->grupo;
    }

    /**
     * Set the value of grupo
     */
    public function setGrupo($grupo): self
    {
        $this->grupo = $grupo;

        return $this;
    }

    /**
     * Get the value of NroFuncionario
     */
    public function getNroFuncionario()
    {
        return $this->NroFuncionario;
    }

    /**
     * Set the value of NroFuncionario
     */
    public function setNroFuncionario($NroFuncionario): self
    {
        $this->NroFuncionario = $NroFuncionario;

        return $this;
    }

    /**
     * Get the value of horasTrabajadas
     */
    public function getHorasTrabajadas()
    {
        return $this->horasTrabajadas;
    }

    /**
     * Set the value of horasTrabajadas
     */
    public function setHorasTrabajadas($horasTrabajadas): self
    {
        $this->horasTrabajadas = $horasTrabajadas;

        return $this;
    }

    function __constructor( int $ciUsuarioEnt , string $grupo , int $NroFuncionario , int $horasTrabajadas){

        $this -> ciUsuarioEnt = $ciUsuarioEnt ;
        $this -> grupo = $grupo ;
        $this -> NroFuncionario = $NroFuncionario ;
        $this -> horasTrabajadas = $horasTrabajadas ;
    
    }  
}

?>