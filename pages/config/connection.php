<?php
 // used to connect to the database
 $host = "localhost";
 $user = "root";
 $password = "toor";
 $database = "market2";
 try {
    $con = new mysqli($host,$user,$password, $database);
}
 
// show error
catch(Exception $exception){
    echo "Connection error: " . $exception->getMessage();
}
?>