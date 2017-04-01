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
    $request->execute([':login' => $_GET['user']]);

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
      $request->execute([':id' => $iut_id]);

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
  $request = $db->prepare('SELECT * FROM question WHERE id = :id AND category_id = :category AND level_id = :level LIMIT 1');
  $request->execute([':id' => $_GET['question'], ':category' => $_GET['category'], ':level' => $_GET['level']]);

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
  $request = $db->prepare('SELECT * FROM response WHERE question_id = :question');
  $request->execute([':question' => $_GET['question']]);
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
  $request = $db->prepare('SELECT * FROM question WHERE category_id = :category AND level_id = :level LIMIT 1');
  $request->execute([':level' => $_GET['level'], ':category' => $_GET['category']]);
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

//SÉLECTION DE LA CATÉGORIE
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

//AFFICHAGE DES SCORES DE CHAQUE USER/IUT
else if (isset($_GET['iut_id'])){
  $request = $db->prepare('SELECT * FROM user WHERE iut_id = :iut ORDER BY score DESC');
  $request->execute([':iut' =>  $_GET['iut_id']]);

  try {
    $iut = array();
    while ($data = $request->fetch(PDO::FETCH_ASSOC)) {
      $iut[] = $data;
    }
  }
  catch (PDOException $e){
    echo $e->getMessage();
  }
  echo json_encode($iut);
}

//AFFICHAGE D'UN IUT
else if (isset($_GET['iut'])){
  $request = $db->prepare('SELECT * FROM iut WHERE id = :id');
  $request->execute([':id' => $_GET['iut']]);

  try {
    while ($data = $request->fetch(PDO::FETCH_ASSOC)) {
      $userIut = $data;
    }
  }
  catch (PDOException $e){
    echo $e->getMessage();
  }
  echo json_encode($userIut);
}

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
