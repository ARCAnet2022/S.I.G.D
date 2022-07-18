<?php

class Sancion{
    private $idSancion
    private $tipoSancion
    private $duracion
    private $idPartido
    private $ciUsuarioJuez
    private $NombreDep
    private $nombreEquipo

    /**
     * Get the value of idSancion
     */
    public function getIdSancion()
    {
        return $this->idSancion;
    }

    /**
     * Set the value of idSancion
     */
    public function setIdSancion($idSancion): self
    {
        $this->idSancion = $idSancion;

        return $this;
    }

    /**
     * Get the value of tipoSancion
     */
    public function getTipoSancion()
    {
        return $this->tipoSancion;
    }

    /**
     * Set the value of tipoSancion
     */
    public function setTipoSancion($tipoSancion): self
    {
        $this->tipoSancion = $tipoSancion;

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

    function __constructor( int $idSancion , string $tipoSancion , int $duracion , int $idPartido , int $ciUsuarioJuez , 
                            string $NombreDep , string $nombreEquipo){

        $this -> idSancion = $idSancion ;
        $this -> tipoSancion = $tipoSancion ;
        $this -> duracion = $duracion ;
        $this -> idPartido = $idPartido ;
        $this -> ciUsuarioJuez = $ciUsuarioJuez ;
        $this -> NombreDep = $NombreDep ;
        $this -> nombreEquipo = $nombreEquipo ;
    } 
}

?>