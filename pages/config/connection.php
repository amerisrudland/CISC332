]<?php
 // used to connect to the database
 $host = "localhost";
 $user = "root";
 $password = "toor";
 $database = "farmers market";
 try {
    $con = new mysqli($host,$username,$password, $database);
}
 
// show error
catch(Exception $exception){
    echo "Connection error: " . $exception->getMessage();
}
?>