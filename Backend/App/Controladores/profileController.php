<?php
include '../Modelo/Usuario.php';

class profileController(){

    public function profileAdminShow(){
        $init = new Usuario;
        $admin = $init->getAdminProfile();
        if (!empty($admin)) {
            foreach ($admin as $adm ) {
                foreach ($adm as $ad ) {
                    echo $ad;
                }
            }
        }else {
            echo "Is empty";
        }
    }
    
    public function profileAdministrativeShow(){
        $init = new Usuario;
        $administrative = $init->getAdministrativeProfile();
        if (!empty($administrative)){
            foreach ($administrative as $administ) {
                foreach ($administ as $ad) {
                    echo $ad;
                }
            }
        }else {
            echo "Is empty";
        }
    }

    public function profileAnalistaShow(){
        $init = new Usuario;
        $analista = $init->getAnalistaProfile();
        if (!empty($analista)){
            foreach ($analista as $anali) {
                foreach ($anali as $an) {
                    echo $an;
                }
            }
        }else {
            echo "Is empty";
        }
    }

    public function profileScoutShow(){
        $init = new Usuario;
        $scout = $init->getScoutProfile();
        if (!empty($scout)){
            foreach ($scout as $sct) {
                foreach ($sct as $sc) {
                    echo $sc;
                }
            }
        }else {
            echo "Is empty";
        }
    }

    public function profileEntrenadorShow(){
        $init = new Usuario;
        $entrenador = $init->getEntrenadorProfile();
        if (!empty($entrenador)){
            foreach ($entrenador as $entre) {
                foreach ($entre as $ent) {
                    echo $ent;
                }
            }
        }else {
            echo "Is empty";
        }
    }

    public function profileJuezShow(){
        $init = new Usuario;
        $juez = $init->getJuezProfile();
        if (!empty($juez)){
            foreach ($juez as $jue) {
                foreach ($jue as $jz) {
                    echo $jz;
                }
            }
        }else {
            echo "Is empty";
        }
    }


}

?>