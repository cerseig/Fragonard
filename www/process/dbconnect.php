<?php
ini_set('display_errors',1);

    try {
      $db = new PDO('mysql:dbname=mmi_quizz;host:127.0.0.1','root','root', array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));
    } catch(PDOException $e){
      echo 'Echec lors de la connection'. $e->getMessage();
    }
?>
