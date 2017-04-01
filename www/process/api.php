<?php

header("Access-Control-Allow-Origin:* ");

include 'dbconnect.php';

//AFFICHE ET ENVOIE LE SCORE DE L'USER
if(isset($_GET['score']) && (isset($_GET['user'])) ) {
  //Envoie le score de l'user à son user
    $request = $db->prepare('UPDATE user  SET score = :score WHERE login=:login');
    $request->bindValue(':score', $_GET['score']);
    $request->bindValue(':login', $_GET['user']);
    $request->execute();

  //Affiche le score perso de l'utilisateur
    $request=$db->prepare('SELECT * FROM user WHERE login=:login');
    $request->bindValue(':login', $_GET['user']);
    $request->execute();

    try {
      $user = array();
      while ($data = $request->fetch(PDO::FETCH_ASSOC)) {
        $user = $data;
      }
    }
    catch (PDOException $e) {
      echo $e->getMessage();
    }

    //Envoie les infos de l'user à l'app
      echo json_encode($user);

    $iut_id = $user['iut_id']; //Stocker l'id de l'iut du user
    $scoreUser = intval($user['score']); //Stocker le score de l'user et le convertit en int

    //Récupère les infos de l'IUT
      $request=$db->prepare('SELECT * FROM iut WHERE id=:id');
      $request->bindValue(':id', $iut_id);
      $request->execute();

      try {
        $user = array();
        while ($data = $request->fetch(PDO::FETCH_ASSOC)) {
          $iut = $data;
        }
      }
      catch (PDOException $e) {
        echo $e->getMessage();
      }

    $scoreIUT = intval($iut['score']); //Stocker le score de l'iut et le convertit en int
    $scoreIUT = $scoreIUT + $scoreUser; //Calcule le nouveau score de l'iut

  //Envoie le score de l'user à son IUT
    $request = $db->prepare('UPDATE iut  SET score = :score WHERE id=:iut');
    $request->bindValue(':iut', $iut_id);
    $request->bindValue(':score', $scoreIUT);
    $request->execute();
}

//SÉLECTION DES QUESTIONS AU CAS PAR CAS
else if (isset($_GET['level']) && isset($_GET['category']) && isset($_GET['question'])) {
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
        }
        catch (PDOException $e){
          // echo $e->getMessage();
        }
      }
    }
    catch (PDOException $e){
      // echo $e->getMessage();
    }
}

//AFFICHAGE DE L'IUT DE L'USER
else if (isset($_GET['iut'])){
  $request = $db->prepare('SELECT * FROM iut WHERE id = :id');
  $request->bindValue(':iut',  $_GET['iut']);

  try {
    $iut = array();
    while ($data = $request->fetch(PDO::FETCH_ASSOC)) {
      $iut[] = $data;
    }
  }
  catch (PDOException $e){
    echo $e->getMessage();
  }
  echo json_encode($userIut);
  var_dump($iut);}

//AFFICHAGE DES IUTS
else {
    $request = $db->query('SELECT * FROM iut ORDER BY score DESC');
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
