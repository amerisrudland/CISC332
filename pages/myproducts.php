<!DOCTYPE HTML>
<html>
	<head>
	 <meta charset="UTF-8"> 
			<title>My Products | Farmer's Market</title>
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
<h1>My Products</h1>

<?php  
$sql = "SELECT Name, Quantity, Unit, Price_Per_Unit, Date_Listed  FROM `products` WHERE SellerID=100033550";
$result = $con->query($sql);

if ($result->num_rows > 0) {
    // output data of each row
	echo "<table> <tr><th>Item</th><th>Quantity</th><th>Unit</th><th>Price/Unit</th><th>Date Listed</th><th></th><th></th></tr>";
    while($row = $result->fetch_assoc()) {
        echo " <tr> <td>" . $row["Name"]. "</td><td>" . $row["Quantity"]. "</td><td>" . $row["Unit"]. "</td><td>" . $row["Price_Per_Unit"]. "</td><td>" . $row["Date_Listed"]. '</td><td><a href="https://google.ca">Google</a></td><td>edit</td><br>';
    }
	echo"</table";
} else {
    echo "0 results";
}
?>

</body>
</html>