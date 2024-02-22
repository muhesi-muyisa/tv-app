<?php
    include_once("conn.php");
    include_once("encrypt.php");
    $result=array();
    try {
        $sql="SELECT * FROM membres u INNER JOIN souscription s ON u.idMembre=s.idSouscription";
        $select=$db->query($sql);
        while ($a = $select->fetch()) {
            $result[]=$a;
        }
    } catch (\Throwable $th) {
        echo"Erreur".$th->getMessage();
    }

    echo encrypt(json_encode($result));
?>