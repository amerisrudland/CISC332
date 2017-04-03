<!DOCTYPE HTML>
<html>
	<head>
	 <meta charset="UTF-8"> 
			<title>Favourite Products | Farmer's Market</title>
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
<h1>Favourite Products</h1>

<?php  
$sql = "SELECT ProdNo, Name, SellerID FROM `fav_products` where PurchaserID=780033540";
$result = $con->query($sql);

if ($result->num_rows > 0) {
    // output data of each row
	echo "<table> <tr><th>ProdNo</th><th>Item</th><th>Seller</th><th> </th></tr>";
    while($row = $result->fetch_assoc()) {
		$fkey = $row["ProdNo"];
        echo " <tr> <td>" . $fkey. "</td><td>" . $row["Name"]. '</td><td>' . $row["SellerID"]. '</td><td> <form action="delete.php?ProdNo=$row["ProdNo"]  method="post"><input type="hidden" name="name" value="">
                <input type="submit" name="ProdNo" value="Delete"></form></td><br>';
    }
	echo"</table>";
} else {
    echo "0 results";
}
/*
$sql = "DELETE FROM MyGuests WHERE id=3";

if ($conn->query($sql) === TRUE) {
    echo "Record deleted successfully";
} else {
    echo "Error deleting record: " . $conn->error;
}
*/
?>

</body>
</html>