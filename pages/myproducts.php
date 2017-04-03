<!DOCTYPE HTML>
<html>
	<head>
	 <meta charset="UTF-8"> 
			<title>My Products | Farmer's Market</title>
	</head>
<body>
<?php include 'delete.php';?>
<?php
  //Create a user session or resume an existing one
 //session_start();
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
<h1>My Products</h1>

<?php  
$sql = "SELECT Name, Unit, Price_Per_Unit, UserName, Quantity AS QuantityAvailable, Delivery_Method, Days_To_Delivery FROM Products JOIN Seller ON Products.SellerID = Seller.ID ";
$result = $con->query($sql);

if ($result->num_rows > 0) {
    // output data of each row
	echo "<table> <tr><th>Item</th><th>Quantity</th><th>Unit</th><th>Price/Unit</th><th>Date Listed</th><th></th><th></th></tr>";
    while($row = $result->fetch_assoc()) {
        echo " <tr> <td>" . $row["Name"]. "</td><td>" . $row["QuantityAvailable"]. "</td><td>" . $row["Unit"]. "</td><td>" . $row["Price_Per_Unit"]. "</td><td>" . $row["Delivery_Method"]. '</td><td>' . $row["Days_To_Delivery"]. '</td><td>edit</td><br>';
    }
	echo"</table";
} else {
    echo "0 results";
}
?>

<!-- Add a new item -->
<form name='addNew' id='addNew' action='myproducts.php' method='post'>
    <table border='0'>
        <tr>
            <td>Name</td>
            <td><input type='text' name='Name' id='Name' /></td>
        </tr>
        <tr>
            <td>Quantity</td>
             <td><input type='password' name='Quantity' id='Quantity' /></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <input type='submit' id='loginBtn' name='loginBtn' value='Add Product' /> 
            </td>
        </tr>
    </table>
</form>
</body>
</html>