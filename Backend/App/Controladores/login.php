<?php
session_start();


if(isset($_SESSION['is_logged']) && $_SESSION['is_logged'] == true){

    header('Location: logout.php');
    exit();
}else {
    header('Location: ../../../Frontend/index.html');
    exit();
}


?>