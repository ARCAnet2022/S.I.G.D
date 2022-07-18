<?php

class Administrador{
    private $ciUsuarioAdmin
    private $Fecha
    private $TipoDeAccion
    private $UsuarioAccion

    /**
     * Get the value of ciUsuarioAdmin
     */
    public function getCiUsuarioAdmin()
    {
        return $this->ciUsuarioAdmin;
    }

    /**
     * Set the value of ciUsuarioAdmin
     */
    public function setCiUsuarioAdmin($ciUsuarioAdmin): self
    {
        $this->ciUsuarioAdmin = $ciUsuarioAdmin;

        return $this;
    }

    /**
     * Get the value of Fecha
     */
    public function getFecha()
    {
        return $this->Fecha;
    }

    /**
     * Set the value of Fecha
     */
    public function setFecha($Fecha): self
    {
        $this->Fecha = $Fecha;

        return $this;
    }

    /**
     * Get the value of TipoDeAccion
     */
    public function getTipoDeAccion()
    {
        return $this->TipoDeAccion;
    }

    /**
     * Set the value of TipoDeAccion
     */
    public function setTipoDeAccion($TipoDeAccion): self
    {
        $this->TipoDeAccion = $TipoDeAccion;

        return $this;
    }

    /**
     * Get the value of UsuarioAccion
     */
    public function getUsuarioAccion()
    {
        return $this->UsuarioAccion;
    }

    /**
     * Set the value of UsuarioAccion
     */
    public function setUsuarioAccion($UsuarioAccion): self
    {
        $this->UsuarioAccion = $UsuarioAccion;

        return $this;
    }

    function __constructor( int $ciUsuarioAdmin , int $Fecha , string $TipoDeAccion, int $UsuarioAccion){

        $this -> ciUsuarioAdmin = $ciUsuarioAdmin ;
        $this -> Fecha = $Fecha ;
        $this -> TipoDeAccion = $TipoDeAccion ;
        $this -> UsuarioAccion = $UsuarioAccion ;
        
    
    }  
}

?>