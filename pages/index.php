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
<a href="favproducts.php">View Favourites List</a>
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
	echo "<table> <tr><th>ProdNo</th><th>Item</th><th>Seller</th><th>test column</th></tr>";
    while($row = $result->fetch_assoc()) {
        echo " <tr> <td>" . $row["ProdNo"]. "</td><td>" . $row["Name"]. "</td><td>" . $row["SellerID"]. '</td><td><a href="https://google.ca">Google This</a></td><br>';
    }
	echo"</table";
} else {
    echo "0 results";
}
?>

</body>
</html>