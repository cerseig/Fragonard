<?php

header("Access-Control-Allow-Origin:* ");

include 'dbconnect.php';

//SÉLECTION DES QUESTIONS AU CAS PAR CAS
if (isset($_GET['level']) && isset($_GET['category']) && isset($_GET['question'])) {
  $request = $db->query('SELECT * FROM question WHERE id ='.$_GET['question'].' AND category_id = '.$_GET['category'].' AND level_id ='.$_GET['level'].' LIMIT 1');
  try {
    $question = array();
    while ($data = $request->fetch(PDO::FETCH_ASSOC)) {
      $question = $data;
    }
  }
  catch (PDOException $e) {
    echo $e->getMessage();
  }
  echo json_encode($question);
}

//SÉLECTION DES RÉPONSES
else if (isset($_GET['question'])) {
  $request = $db->query('SELECT * FROM response WHERE question_id ='.$_GET['question']);
  try {
    $answers = array();
    while ($data = $request->fetch(PDO::FETCH_ASSOC)) {
      $answers[] = $data;
    }
  }
  catch (PDOException $e) {
    echo $e->getMessage();
  }
  echo json_encode($answers);
}

//SÉLECTION DE LA PREMIÈRE QUESTION SI CHOIX CATÉGORIE + NIVEAU
else if (isset($_GET['level']) && isset($_GET['category'])) {
  $request = $db->query('SELECT * FROM question WHERE category_id = '.$_GET['category'].' AND level_id ='.$_GET['level'].' LIMIT 1');
  try {
    $question = array();
    while ($data = $request->fetch(PDO::FETCH_ASSOC)) {
      $question = $data;
    }
  }
  catch (PDOException $e) {
    echo $e->getMessage();
  }
  echo json_encode($question);
}

//SÉLECTION DU NIVEAU SI CHOIX DE CATÉGORIE
else if (isset($_GET['category'])){
  $request = $db->query('SELECT * FROM level');
  try {
    $levels = array();
    while ($data = $request->fetch(PDO::FETCH_ASSOC)) {
      $levels[] = $data;
    }
  }
  catch (PDOException $e){
    echo $e->getMessage();
  }
  echo json_encode($levels);
}
else if (isset($_GET['user'])){
    $request = $db->query('SELECT * FROM category');
    try {
      $categories = array();
      while ($data = $request->fetch(PDO::FETCH_ASSOC)) {
  	    $categories[] = $data;
      }
    }
    catch (PDOException $e){
      echo $e->getMessage();
    }
    echo json_encode($categories);
}

//CRÉATION USER
else if (isset($_GET['register']) && isset($_GET['iut'])) {
    $request = $db->query('SELECT * FROM user WHERE login="'.$_GET['register'].'"');
    try {
      if ($data = $request->fetch(PDO::FETCH_ASSOC)) {
  	    echo "Le login est déjà pris.";
      }
      else {
        try {
          $request = $db->prepare('INSERT INTO user (login, score, iut_id) VALUES (:login, :score, :iut)');
          $request->bindValue(':login',  $_GET['register']);
          $request->bindValue(':score',  0);
          $request->bindValue(':iut',  $_GET['iut']);
          $request->execute();
          echo "";
        }
        catch (PDOException $e){
          echo $e->getMessage();
        }
      }
    }
    catch (PDOException $e){
      echo $e->getMessage();
    }
}

//AFFICHAGE DES IUTS
else {
    $request = $db->query('SELECT * FROM iut');
    try {
      $iuts = array();
      while ($data = $request->fetch(PDO::FETCH_ASSOC)) {
  	    $iuts[] = $data;
      }
    }
    catch (PDOException $e){
      echo $e->getMessage();
    }
    echo json_encode($iuts);
}

 ?>
