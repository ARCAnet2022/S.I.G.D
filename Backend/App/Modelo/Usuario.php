<?php

class Usuario{

    private $ciUsuario
    private $Nombre
    private $Apellido
    private $Telefono
    private $Nacionalidad
    private $FechaNac
    private $Calle
    private $Numero
    private $Ciudad

    /**
     * Get the value of ciUsuario
     */
    public function getCiUsuario()
    {
        return $this->ciUsuario;
    }

    /**
     * Set the value of ciUsuario
     */
    public function setCiUsuario($ciUsuario): self
    {
        $this->ciUsuario = $ciUsuario;

        return $this;
    }

    /**
     * Get the value of Nombre
     */
    public function getNombre()
    {
        return $this->Nombre;
    }

    /**
     * Set the value of Nombre
     */
    public function setNombre($Nombre): self
    {
        $this->Nombre = $Nombre;

        return $this;
    }

    /**
     * Get the value of Apellido
     */
    public function getApellido()
    {
        return $this->Apellido;
    }

    /**
     * Set the value of Apellido
     */
    public function setApellido($Apellido): self
    {
        $this->Apellido = $Apellido;

        return $this;
    }

    /**
     * Get the value of Telefono
     */
    public function getTelefono()
    {
        return $this->Telefono;
    }

    /**
     * Set the value of Telefono
     */
    public function setTelefono($Telefono): self
    {
        $this->Telefono = $Telefono;

        return $this;
    }

    /**
     * Get the value of Nacionalidad
     */
    public function getNacionalidad()
    {
        return $this->Nacionalidad;
    }

    /**
     * Set the value of Nacionalidad
     */
    public function setNacionalidad($Nacionalidad): self
    {
        $this->Nacionalidad = $Nacionalidad;

        return $this;
    }

    /**
     * Get the value of FechaNac
     */
    public function getFechaNac()
    {
        return $this->FechaNac;
    }

    /**
     * Set the value of FechaNac
     */
    public function setFechaNac($FechaNac): self
    {
        $this->FechaNac = $FechaNac;

        return $this;
    }

    /**
     * Get the value of Calle
     */
    public function getCalle()
    {
        return $this->Calle;
    }

    /**
     * Set the value of Calle
     */
    public function setCalle($Calle): self
    {
        $this->Calle = $Calle;

        return $this;
    }

    /**
     * Get the value of Numero
     */
    public function getNumero()
    {
        return $this->Numero;
    }

    /**
     * Set the value of Numero
     */
    public function setNumero($Numero): self
    {
        $this->Numero = $Numero;

        return $this;
    }

    /**
     * Get the value of Ciudad
     */
    public function getCiudad()
    {
        return $this->Ciudad;
    }

    /**
     * Set the value of Ciudad
     */
    public function setCiudad($Ciudad): self
    {
        $this->Ciudad = $Ciudad;

        return $this;
    }

    function __constructor( int $ciUsuario , string $Nombre , string $Apellido , int $Telefono , string $Nacionalidad , 
                            int $FechaNac , string $Calle , int $Numero , string $Ciudad){

        $this -> ciUsuario = $ciUsuario ;
        $this -> Nombre = $Nombre ;
        $this -> Apellido = $Apellido ;
        $this -> Telefono = $Telefono ;
        $this -> Nacionalidad = $Nacionalidad ;
        $this -> FechaNac = $FechaNac ;
        $this -> Calle = $Calle ;
        $this -> Numero = $Numero ;
        $this -> Ciudad = $Ciudad ;
    } 
}

?>