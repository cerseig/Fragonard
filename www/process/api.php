<?php

include 'dbconnect.php';

    $sql = "SELECT * FROM question";
    $request = mysqli_query($db, $sql) or die('Erreur SQL !<br>'.$sql.'<br>'.mysqli_error($db));
    $questions = array();

    $i = 0;
    while($row = mysqli_fetch_row($request)) {
        $questions[$i]['id'] = $row['id'];
        $questions[$i]['name'] = $row['name'];

        $i++;
    }

    echo json_encode($questions);
 ?>
