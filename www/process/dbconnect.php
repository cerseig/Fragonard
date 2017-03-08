<?php
ini_set('display_errors',1);

// $dbname     = ;
// $host       = ;
// $login      = ;
// $pw         = ;

    try {
      $db = new PDO('mysql:dbname=mmi_quizz;host:localhost','root','root');
    } catch(PDOException $e){
      echo 'Echec lors de la connection'. $e->getMessage();
    }

?>
