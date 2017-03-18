<?php

header("Access-Control-Allow-Origin:*");
include 'dbconnect.php';

//GARDER LES VALEURS CHOISIES EN SESSION
session_start();
if (isset($_GET['category'])) $_SESSION['category'] = $_GET['category'];
if (isset($_SESSION['category'])) $category = $_SESSION['category'];

if (isset($_GET['level'])) $_SESSION['level'] = $_GET['level'];
if (isset($_SESSION['level'])) $level = $_SESSION['level'];


//AFFICHAGE QUESTIONS SI CHOIX CATÉGORIE + NIVEAU
if ( isset($_SESSION['category']) && isset($_SESSION['level']) ) {
  // $request = $db->query('SELECT * FROM questions WHERE category_id = '.$_SESSION['category'].' AND level_id ='.$_SESSION['category']) ;
  // echo($request) ;
  // try {
  //   $questions = array();
  //   while ($data = $request->fetch(PDO::FETCH_ASSOC)) {
  //     $questions[] = $data;
  //   }
  // }
  // catch (PDOException $e) {
  //   echo $e->getMessage();
  // }
  // echo json_encode($questions);
  echo "oui";
}
//SÉLECTION DU NIVEAU SI CHOIX DE CATÉGORIE
else if (isset($_SESSION['category']){
  // $request = $db->query('SELECT * FROM category WHERE id ='.$_GET['category']);
  // $category = $request->fetch(PDO::FETCH_ASSOC);
  // // echo json_encode($category);

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
  // echo json_encode($levels);

  echo json_encode($levels);
}

//AFFICHAGE DES CATÉGORIES
else {
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

 ?>
