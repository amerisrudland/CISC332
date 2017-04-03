<!DOCTYPE HTML>
<html>
	<head>
	 <meta charset="UTF-8"> 
			<title>Favourite Products | Farmer's Market</title>
	</head>
<body>
<?php include_once 'config/connection.php';?>

<?php //include 'delete.php';?>
<?php
  //Create a user session or resume an existing one
 session_start();
 /*
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
*/
 ?>
<h1>Favourite Products</h1>

<?php  
$sql = "SELECT SellerID, Fav_Products.ProdNo, Name, UserName AS SellerName FROM Fav_Products JOIN Products JOIN Seller ON (Products.ProdNo = Fav_Products.ProdNo AND Seller.ID = Products.SellerID) WHERE Fav_Products.PurchaserID = 6";
$result = $con->query($sql);

if ($result->num_rows > 0) {
    // output data of each row
	echo "<table > <tr><th>Item</th><th>Seller</th><th> </th></tr>";
    while($row = $result->fetch_assoc()) {
		$url = "Seller.php?SellerID=" . $row['SellerID'];
        echo " <tr > <td>" . $row["Name"]. "</td><td onclick=\"window.location.href='" . $url . "'\">" . $row["SellerName"].'</td><td><form action="delete.php?ProdNo=' . $row["ProdNo"] . '"  method="post">
                <input type="submit" name="deleteFav" value="Delete"></form></td><br>';
    }
	echo"</table>";
} else {
    echo "0 results";
}

?>
</body>
</html>