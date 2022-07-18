<?php

class Fixture{
    private $idFixture
    private $hora
    private $local
    private $visitante
    private $fecha
    private $lugar

    /**
     * Get the value of idFixture
     */
    public function getIdFixture()
    {
        return $this->idFixture;
    }

    /**
     * Set the value of idFixture
     */
    public function setIdFixture($idFixture): self
    {
        $this->idFixture = $idFixture;

        return $this;
    }

    /**
     * Get the value of hora
     */
    public function getHora()
    {
        return $this->hora;
    }

    /**
     * Set the value of hora
     */
    public function setHora($hora): self
    {
        $this->hora = $hora;

        return $this;
    }

    /**
     * Get the value of local
     */
    public function getLocal()
    {
        return $this->local;
    }

    /**
     * Set the value of local
     */
    public function setLocal($local): self
    {
        $this->local = $local;

        return $this;
    }

    /**
     * Get the value of visitante
     */
    public function getVisitante()
    {
        return $this->visitante;
    }

    /**
     * Set the value of visitante
     */
    public function setVisitante($visitante): self
    {
        $this->visitante = $visitante;

        return $this;
    }

    /**
     * Get the value of fecha
     */
    public function getFecha()
    {
        return $this->fecha;
    }

    /**
     * Set the value of fecha
     */
    public function setFecha($fecha): self
    {
        $this->fecha = $fecha;

        return $this;
    }

    /**
     * Get the value of lugar
     */
    public function getLugar()
    {
        return $this->lugar;
    }

    /**
     * Set the value of lugar
     */
    public function setLugar($lugar): self
    {
        $this->lugar = $lugar;

        return $this;
    }

    function __constructor(int $idFixture , int $hora , string $local , string $visitante , int $fecha , string $lugar){

        $this -> idFixture = $idFixture ;
        $this -> hora = $hora ;
        $this -> local = $local ;
        $this -> visitante = $visitante ;
        $this -> fecha = $fecha ;
        $this -> lugar = $lugar ;
    
    } 
}

?>