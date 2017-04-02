<!DOCTYPE HTML>
<html>
	<head>
	 <meta charset="UTF-8"> 
			<title>Welcome | Farmer's Market</title>
	</head>
<body>
<?php
  //Create a user session or resume an existing one
 //session_start();
  $host = "localhost";
 $user = "root";
 $password = "toor";
 $database = "farmers market";
 try {
    $con = new mysqli($host,$user,$password, $database);
}
 
// show error
catch(Exception $exception){
    echo "Connection error: " . $exception->getMessage();
}
 ?>
Put landing page shit here!
<p>
This is shit such as:
<p>
<ul>
	<li>Log In</li>
	<li>Sign Up</li>
	<li>Other general info</li>
	<li>Pretty things</li>
</ul>
<?php  
$sql = "SELECT ProdNo, Name, SellerID FROM `fav_products`";
$result = $con->query($sql);

if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
        echo "ProdNo: " . $row["ProdNo"]. " - Name: " . $row["Name"]. " " . $row["SellerID"]. "<br>";
    }
} else {
    echo "0 results";
}
?>

</body>
</html>