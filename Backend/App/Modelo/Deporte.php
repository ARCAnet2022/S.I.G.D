<?php

class Deporte{
    private $NombreDep
    private $Tipo
    private $Materiales
    private $Duracion
    private $CantJugadoresTitulares
    private $CantJueces
    private $CantSuplentes
    private $TamCancha

    /**
     * Get the value of NombreDep
     */
    public function getNombreDep()
    {
        return $this->NombreDep;
    }

    /**
     * Set the value of NombreDep
     */
    public function setNombreDep($NombreDep): self
    {
        $this->NombreDep = $NombreDep;

        return $this;
    }

    /**
     * Get the value of Tipo
     */
    public function getTipo()
    {
        return $this->Tipo;
    }

    /**
     * Set the value of Tipo
     */
    public function setTipo($Tipo): self
    {
        $this->Tipo = $Tipo;

        return $this;
    }

    /**
     * Get the value of Materiales
     */
    public function getMateriales()
    {
        return $this->Materiales;
    }

    /**
     * Set the value of Materiales
     */
    public function setMateriales($Materiales): self
    {
        $this->Materiales = $Materiales;

        return $this;
    }

    /**
     * Get the value of Duracion
     */
    public function getDuracion()
    {
        return $this->Duracion;
    }

    /**
     * Set the value of Duracion
     */
    public function setDuracion($Duracion): self
    {
        $this->Duracion = $Duracion;

        return $this;
    }

    /**
     * Get the value of CantJugadoresTitulares
     */
    public function getCantJugadoresTitulares()
    {
        return $this->CantJugadoresTitulares;
    }

    /**
     * Set the value of CantJugadoresTitulares
     */
    public function setCantJugadoresTitulares($CantJugadoresTitulares): self
    {
        $this->CantJugadoresTitulares = $CantJugadoresTitulares;

        return $this;
    }

    /**
     * Get the value of CantJueces
     */
    public function getCantJueces()
    {
        return $this->CantJueces;
    }

    /**
     * Set the value of CantJueces
     */
    public function setCantJueces($CantJueces): self
    {
        $this->CantJueces = $CantJueces;

        return $this;
    }

    /**
     * Get the value of CantSuplentes
     */
    public function getCantSuplentes()
    {
        return $this->CantSuplentes;
    }

    /**
     * Set the value of CantSuplentes
     */
    public function setCantSuplentes($CantSuplentes): self
    {
        $this->CantSuplentes = $CantSuplentes;

        return $this;
    }

    /**
     * Get the value of TamCancha
     */
    public function getTamCancha()
    {
        return $this->TamCancha;
    }

    /**
     * Set the value of TamCancha
     */
    public function setTamCancha($TamCancha): self
    {
        $this->TamCancha = $TamCancha;

        return $this;
    }

    function __constructor( string $NombreDep , string $Tipo , string $Materiales , int $Duracion , int $CantJugadoresTitulares ,
                            int $CantJueces , int $CantSuplentes , int $TamCancha){

        $this -> NombreDep = $NombreDep ;
        $this -> Tipo = $Tipo ;
        $this -> Materiales = $Materiales ;
        $this -> Duracion = $Duracion ;
        $this -> CantJugadoresTitulares = $CantJugadoresTitulares ;
        $this -> CantJueces = $CantJueces ;
        $this -> CantSuplentes = $CantSuplentes ;
        $this -> TamCancha = $TamCancha ;   
    
    }  

}

?>