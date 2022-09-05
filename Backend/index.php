<?php

session_start();

if(!isset($_SESSION['is_logged']) || !$_SESSION['is_logged']){
    header("location: App/Controladores/login.php");
    exit();
}

include "App/Controladores/header.php";



?>