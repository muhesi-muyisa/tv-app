<?php
    include_once("cryptage.php");
    include('db.php');
    $msg="";
    $success=0;

    // Récupération des élements des utilisateurs 
    $nom=htmlspecialchars(decrypt($_POST['nom']));
    $postnom=htmlspecialchars(decrypt($_POST['postnom']));
    $adresse=htmlspecialchars(decrypt($_POST['adresse']));
    $email=htmlspecialchars(decrypt($_POST['email']));
    $telephone=htmlspecialchars(decrypt($_POST['telephone']));
    $pass=sha1(htmlspecialchars(decrypt($_POST['pass'])));

    $req=$db->prepare("SELECT * FROM membres WHERE email=? OR telephone=?");
    $req->execute([$email,$telephone]);
    $exist=$req->rowCount();

    if (isset($nom,$postnom,$email,$adresse,$telephone,$pass)) {
        if ($exist==1) {
            $success=0;
            $msg="Le compte existe déjà";
        }else {
            // Enregistrement proprement dit
            $insert=$db->prepare("INSERT INTO membres VALUES(null,?,?,?,?,?,?)");
            $insert->execute([$nom,$postnom,$adresse,$email,$telephone,$pass]);
            $msg="Enregistrement réusi";
            $success=1;
        }
    }else {
        $success=0;
        $msg="Tous les champs sont nécessaires";
    }
    echo encrypt(json_encode([
        "data"=>[
            $msg,
            $success
        ]
        ]));

       
?>