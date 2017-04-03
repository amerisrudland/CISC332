<?php
include_once 'config/connection.php';
if(isset($_POST['deleteFav'])){
//Define the query
$query = "DELETE FROM fav_products WHERE ProdNo=? AND PurchaserID = 6";
//sends the query to delete the entry
if($stmt = $con->prepare($query)){
			$stmt->bind_Param("i", $_GET['ProdNo']);
			$stmt->execute();
			die();
		} else{
			echo "bad query";
		}
}
if (mysql_affected_rows() == 1) { 
//if it updated
?>

            <strong>Product has been removed from your favourites</strong><br /><br />

<?php
 } else { 
//if it failed
?>

            <strong>Deletion Failed</strong><br /><br />


<?php
} 
?>