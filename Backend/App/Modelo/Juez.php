<?php

class Juez{
    private $ciUsuarioJuez
    private $Experiencia
    private $AptitudFisica

    /**
     * Get the value of ciUsuarioJuez
     */
    public function getCiUsuarioJuez()
    {
        return $this->ciUsuarioJuez;
    }

    /**
     * Set the value of ciUsuarioJuez
     */
    public function setCiUsuarioJuez($ciUsuarioJuez): self
    {
        $this->ciUsuarioJuez = $ciUsuarioJuez;

        return $this;
    }

    /**
     * Get the value of Experiencia
     */
    public function getExperiencia()
    {
        return $this->Experiencia;
    }

    /**
     * Set the value of Experiencia
     */
    public function setExperiencia($Experiencia): self
    {
        $this->Experiencia = $Experiencia;

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

    function __constructor(int $ciUsuarioJuez , int $Experiencia , string $AptitudFisica){

        $this -> ciUsuarioJuez = $ciUsuarioJuez ;
        $this -> Experiencia = $Experiencia ;
        $this -> AptitudFisica = $AptitudFisica ;
    
    } 
}

?>