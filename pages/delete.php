<?php
if(isset($_POST['ProdNo'])){
//Define the query
echo "got here <br />";
$delete = $_POST['ProdNo'];
$query = "DELETE FROM fav_products WHERE ProdNo=$delete LIMIT 1";

//sends the query to delete the entry
mysql_query ($query);
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