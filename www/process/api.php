<?php

header("Access-Control-Allow-Origin:*");
include 'dbconnect.php';

    $request = $db->query('SELECT * FROM question');
    try {
      $questions = array();
      while ($data = $request->fetch(PDO::FETCH_ASSOC))
      {
	      $questions[] = $data;
      }
    }
    catch (PDOException $e){
      echo $e->getMessage();
    }

    echo json_encode($questions);

 ?>
