<!DOCTYPE HTML>
<html>
	<head>
	 <meta charset="UTF-8"> 
			<title>Edit Product | Farmer's Market</title>
	</head>
<body>
<?php include_once 'config/connection.php';?>
<h1>Edit Products</h1>

<?php  
// get query for specific product
// editable form with current information
// prepare and submit post query (Done)
// redirect to my products
if(isset($_POST['editProductBtn'])){
//Define the query
$query = "SELECT Name, Unit, Price_Per_Unit, UserName, Quantity AS QuantityAvailable, Delivery_Method, Days_To_Delivery FROM Products JOIN Seller ON Products.SellerID = Seller.ID WHERE ProdNo =?";
//sends the query to delete the entry
if($stmt = $con->prepare($query)){
			$stmt->bind_Param("i", $_GET['ProdNo']);
			$stmt->execute();
			$result = $stmt->get_result();
		} else{
			echo "bad query";
		}
}
/*


if ($result->num_rows > 0) {
    // output data of each row
	echo "<table> <tr><th>Item</th><th>Quantity</th><th>Unit</th><th>Price/Unit</th><th>Average Delivery Days</th></tr>";
    while($row = $result->fetch_assoc()) {
        echo " <tr> <td>" . $row["Name"]. "</td><td>" . $row["QuantityAvailable"]. "</td><td>" . $row["Unit"]. "</td><td>" . $row["Price_Per_Unit"]. "</td><td>" . $row["Delivery_Method"]. '</td><td>' . $row["Days_To_Delivery"]. '</td><td>edit</td><td>delete</td><br />';
    }
	echo"</table>";
} else {
    echo "0 results";
}
*/
?>

<!-- Add a new item -->
<h4>Add a new item</h4>
<form name='addNew' id='addNew' action='myproducts.php' method='post'>
    <table border='0'>
        <tr>
            <td>Name</td>
            <td><input type='text' name='Name' id='Name' /></td>
        </tr>
        <tr>
            <td>Quantity</td>
             <td><input type='number' name='Quantity'  min='1' step="0.1" id='Quantity' /></td>
        </tr>
		<tr>
            <td>Unit</td>
			<td><input type='text' name='Unit' id='Unit' /></td>
             <!-- Advanced shit
			 <td><input type='number' name='unitnum' min='1'  id='unitnum' /><select name='Unit'>
  <option value="kg">kg</option>
   <option value="g">g</option>
  <option value="lb">lb</option>
  <option value="L">L</option>
</select><? php //$Unit = unitnum + Unit; ?></td> -->
        </tr>
		<tr>
            <td>Price/Unit</td>
             <td><input type='number' name='ppunit' min='0' step="0.01" id='ppunit' /></td>
        </tr>
		<tr>
            <td>Avg. Delivery days</td>
            <td><input type='number' name='ddays' min='0' max='30' id='ddays' /></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <input type='submit' id='addProductBtn' name='addProductBtn' value='Add Product' /> 
            </td>
        </tr>
    </table>
</form>
</body>
</html>