<?php
    // Variables constante 
    $host="localhost";
    $dbName="web243_g3igkmuhesi";
    $dbUser="web243_g3igkmuhesi";
    $dbPwd="ehwKD9T29#";
    try {
        $db=new PDO("mysql:host=$host;dbname=$dbName",$dbUser,$dbPwd);
        //echo"Connexion réussie";
    } catch (\Throwable $th) {
        echo"Erreur ".$th->getMessage();
    }
?>