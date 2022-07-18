<?php

class Partido{
    private $idPartido
    private $duracion
    private $fecha
    private $faltas
    private $ciUsuarioJuez

    /**
     * Get the value of idPartido
     */
    public function getIdPartido()
    {
        return $this->idPartido;
    }

    /**
     * Set the value of idPartido
     */
    public function setIdPartido($idPartido): self
    {
        $this->idPartido = $idPartido;

        return $this;
    }

    /**
     * Get the value of duracion
     */
    public function getDuracion()
    {
        return $this->duracion;
    }

    /**
     * Set the value of duracion
     */
    public function setDuracion($duracion): self
    {
        $this->duracion = $duracion;

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
     * Get the value of faltas
     */
    public function getFaltas()
    {
        return $this->faltas;
    }

    /**
     * Set the value of faltas
     */
    public function setFaltas($faltas): self
    {
        $this->faltas = $faltas;

        return $this;
    }

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

    function __constructor( int $idPartido , int $duracion ,  string $fecha , int $faltas , int $ciUsuarioJuez ){

        $this -> idPartido = $idPartido ;
        $this -> duracion = $duracion ;
        $this -> fecha = $fecha ;
        $this -> faltas = $faltas ;
        $this -> ciUsuarioJuez = $ciUsuarioJuez ;

    }

}



?>