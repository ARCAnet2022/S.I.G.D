<?php

class Actuacion{
    private $idActuacion
    private $MVP
    private $RendimientoColectivo
    private $Pases
    private $Goles
    private $Posesion
    private $nombreEquipo
    private $idPartido
    private $nombreDep

    /**
     * Get the value of idActuacion
     */
    public function getIdActuacion()
    {
        return $this->idActuacion;
    }

    /**
     * Set the value of idActuacion
     */
    public function setIdActuacion($idActuacion): self
    {
        $this->idActuacion = $idActuacion;

        return $this;
    }

    /**
     * Get the value of MVP
     */
    public function getMVP()
    {
        return $this->MVP;
    }

    /**
     * Set the value of MVP
     */
    public function setMVP($MVP): self
    {
        $this->MVP = $MVP;

        return $this;
    }

    /**
     * Get the value of RendimientoColectivo
     */
    public function getRendimientoColectivo()
    {
        return $this->RendimientoColectivo;
    }

    /**
     * Set the value of RendimientoColectivo
     */
    public function setRendimientoColectivo($RendimientoColectivo): self
    {
        $this->RendimientoColectivo = $RendimientoColectivo;

        return $this;
    }

    /**
     * Get the value of Pases
     */
    public function getPases()
    {
        return $this->Pases;
    }

    /**
     * Set the value of Pases
     */
    public function setPases($Pases): self
    {
        $this->Pases = $Pases;

        return $this;
    }

    /**
     * Get the value of Goles
     */
    public function getGoles()
    {
        return $this->Goles;
    }

    /**
     * Set the value of Goles
     */
    public function setGoles($Goles): self
    {
        $this->Goles = $Goles;

        return $this;
    }

    /**
     * Get the value of Posesion
     */
    public function getPosesion()
    {
        return $this->Posesion;
    }

    /**
     * Set the value of Posesion
     */
    public function setPosesion($Posesion): self
    {
        $this->Posesion = $Posesion;

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
     * Get the value of nombreDep
     */
    public function getNombreDep()
    {
        return $this->nombreDep;
    }

    /**
     * Set the value of nombreDep
     */
    public function setNombreDep($nombreDep): self
    {
        $this->nombreDep = $nombreDep;

        return $this;
    }

    function __constructor( int $idActuacion , string $MVP ,  string $RendimientoColectivo , int $Pases , 
                            int $Goles , int $Posesion , string $nombreEquipo , int $idPartido , string $nombreDep){

        $this -> idActuacion = $idActuacion ;
        $this -> MVP = $MVP ;
        $this -> RendimientoColectivo = $RendimientoColectivo ;
        $this -> Pases = $Pases ;
        $this -> Goles = $Goles ;
        $this -> Posesion = $Posesion ;
        $this -> nombreEquipo = $nombreEquipo ;
        $this -> idPartido = $idPartido ;
        $this -> nombreDep = $nombreDep ;
    }  

}



   


?>