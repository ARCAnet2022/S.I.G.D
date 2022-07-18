<?php

class Administrativo{
    private $ciUsuarioAdministrativo
    private $NroFuncionario
    private $horasTrabajadas

    /**
     * Get the value of ciUsuarioAdministrativo
     */
    public function getCiUsuarioAdministrativo()
    {
        return $this->ciUsuarioAdministrativo;
    }

    /**
     * Set the value of ciUsuarioAdministrativo
     */
    public function setCiUsuarioAdministrativo($ciUsuarioAdministrativo): self
    {
        $this->ciUsuarioAdministrativo = $ciUsuarioAdministrativo;

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

    function __constructor( int $ciUsuarioAdministrativo , int $NroFuncionario , int $horasTrabajadas){

        $this -> ciUsuarioAdministrativo = $ciUsuarioAdministrativo ;
        $this -> NroFuncionario = $NroFuncionario ;
        $this -> horasTrabajadas = $horasTrabajadas ;
        
        
    
    }  

    
    
    
}

?>