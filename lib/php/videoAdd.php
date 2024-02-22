<?php
    include_once("cryptage.php");
    include('db.php');
    $msg="";
    $success=0;

    if (isset($_POST['send'])) {
        // Récupération des élements des utilisateurs 
    // $designation=htmlspecialchars(decrypt($_POST['designation']));
    // $fichier=htmlspecialchars(decrypt($_FILES["file"]["name"]));

    if (isset($_POST['designation'])) {
        $designation=htmlspecialchars($_POST['designation']);
    $fichier=htmlspecialchars($_FILES["file"]["name"]);
    $package="videos/";
    if (isset($designation,$fichier)) {

            // Enregistrement proprement dit
            move_uploaded_file($_FILES["file"]["tmp_name"],$package.$fichier);
            $insert=$db->prepare("INSERT INTO multimedias(designation,fichier) VALUES(?,?)");
            $insert->execute([$designation,$fichier]);
            $msg="Enregistrement réusi";
            $success=1;
            echo $msg;
    }else {
        $success=0;
        $msg="Tous les champs sont nécessaires";
        echo $msg;
    }
    }
}
    
    // echo encrypt(json_encode([
    //     "data"=>[
    //         $msg,
    //         $success
    //     ]
    //     ]));
    // }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <form action="" method="post" enctype="multipart/form-data">
        <input type="text" placeholder="designation" name="designation"> <br> <br>
        <input type="file" name="file">
        <input type="submit" value="Envoyer" name="send">
    </form>
</head>
<body>
    
</body>
</html>