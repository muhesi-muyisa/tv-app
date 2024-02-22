<?php
    // Variables constante 
    include_once("db.php");
    include_once("cryptage.php");
    $post=json_decode(decrypt($_POST['data']));
    
    //récupération des  objets 
    $membre=$post->membre;
    $desigation=$post->designation;
    $valeur=$post->valeur;
    $msg="";
    $success=false;

    //Enregsitrement dans la base de données 
    try {
        $req=$db->prepare("INSERT INTO souscription(designation,valeur,membre)VALUES(?,?,?)");
        $req->execute([$desigation,$valeur,$membre]);
        if ($req) {
            $msg="Ajouter avec succes";
            $success=true;
        }else {
            $msg="Echec d'ajout";
            $success=false;
        }
    } catch (\Throwable $th) {
        $msg="Echec d'ajout";
        $success=false;
    }
    echo encrypt(json_encode([
        "resultat"=>[
            $success,
            $msg
        ]
        ]));
?>