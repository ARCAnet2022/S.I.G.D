<?php
include "App/Controladores/login.php";

$data = $_REQUEST['ci_deportista'];
$login = new Login();
$login->loginDeportista($data); 

if(!isset($_SESSION['is_logged']) || !$_SESSION['is_logged']){
    header("location: App/Controladores/login.php");
    exit();
}




?>