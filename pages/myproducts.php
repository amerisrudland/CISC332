<!DOCTYPE HTML>
<html>
	<head>
	 <meta charset="UTF-8"> 
			<title>My Products | Farmer's Market</title>
	</head>
<body>
<?php include 'addproduct.php';?>
<?php include_once 'config/connection.php';?>
<h1>My Products</h1>

<?php  
$seller = 1;
// IF $SESSIONID=SELLER
$sql = "SELECT ProdNo, Name, Unit, Price_Per_Unit, UserName, Quantity AS QuantityAvailable, Delivery_Method, Days_To_Delivery FROM Products JOIN Seller ON Products.SellerID = Seller.ID WHERE SellerID = ?";
if($stmt = $con->prepare($sql))
		{
			$stmt->bind_Param("i", $seller);
			$stmt->execute();
			$result = $stmt->get_result();
		}

if ($result->num_rows > 0) {
    // output data of each row
	echo "<table> <tr><th>Item</th><th>Quantity</th><th>Unit</th><th>Price/Unit</th><th>Delivery Method</th><th>Avg. Delivery days</th><th></th><th></th></tr>";
    while($row = $result->fetch_assoc()) {
        echo " <tr> <td>" . $row["Name"]. "</td><td>" . $row["QuantityAvailable"]. "</td><td>" . $row["Unit"]. "</td><td>" . $row["Price_Per_Unit"]. "</td><td>" . $row["Delivery_Method"]. '</td><td>' . $row["Days_To_Delivery"]. '</td><td><form name="editProd" id="editProd" action="editproduct.php?ProdNo=' . $row["ProdNo"]'" method="post"><input type="submit" id="editProductBtn" name="editProductBtn" value="Edit" /> </form></td><td><form name="deleteProd" id="deleteProd" action="delete.php?ProdNo=' . $row["ProdNo"] . '"  method="post">
		<input type="submit" name="deleteProductBtn" value="Delete"></form></td><br />';
    }
	echo"</table>";
} else {
    echo "0 results";
}
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