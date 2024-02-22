<?php  
    // Déclaration de la cle
    const key="bonjourtoutlemondejesuisonprogra";
    const iv="hellotoutlemonde";
    const methode="aes-256-cbc";
    function encrypt($text){
        return openssl_encrypt($text,methode,key,0,iv);
    } 
    function decrypt($text){
        return openssl_decrypt($text,methode,key,0,iv);
    } 
?>