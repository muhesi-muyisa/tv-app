<?php
    include_once("db.php");
    include_once("cryptage.php");
    $result=array();

    // Selection des programmes en base de données
    $sql="SELECT * FROM multimedias";
    $select=$db->query($sql);

    if ($select) {
        while ($a = $select->fetch()) {
            $result[]=$a;
        }
    }

    // Envoie de fichiers en json
    echo json_encode($result);
    //http://g3ig-kmuhesi.uaclab.net/php/getProgramme.php
?>