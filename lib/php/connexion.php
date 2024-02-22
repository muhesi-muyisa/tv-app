<?php
    include("db.php");
    include_once("cryptage.php");
    $msg="";
    $success=0;
    $array=[];
    $email=htmlspecialchars(decrypt($_POST['email']));
    $pass=sha1(htmlspecialchars(decrypt($_POST['pass'])));
    if (isset($email,$pass)) {
        $req=$db->prepare("SELECT * FROM membres WHERE email=? AND pass=?");
        $req->execute([$email,$pass]);
        $exist=$req->rowCount();
        if ($exist==1) {
            $array=$req->fetch();
            $msg="Connexion réussie";
            $success=1;
        }else {
            $msg="Cordonnés incorects réesayer";
            $success=0;
        }
    }else {
        $msg="Le champs sont vides";
        $success=0;
    }

    echo encrypt(json_encode([
        "resultat"=>[
            $msg,
            $success,
            $array
        ]
        ]));
?>