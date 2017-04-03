<?php
if(isset($_POST['addProductBtn'])){
	include_once 'config/connection.php';
//Define the query
$query = "INSERT INTO Products (Name, SellerID, Date_Listed, Quantity, Unit, Price_Per_Unit, Days_To_Delivery)
VALUES(?, ?, CURDATE(), ?, ?, ?, ?)";
$seller = 1;
//sends the query to delete the entry
if($stmt = $con->prepare($query)){
			$stmt->bind_Param("sidsdi", $_POST['Name'], $seller, $_POST['Quantity'], $_POST['Unit'], $_POST['ppunit'], $_POST['ddays']);
			$stmt->execute();
			die();
		} else{
			echo "bad query";
		}
}
/* if (mysql_affected_rows() == 1) { 
//if it updated
?>

            <strong>Product has been added!</strong><br /><br />

<?php
 } else { 
//if it failed
?>

            <strong>Insertion Failed</strong><br /><br />


<?php
}  */
?>