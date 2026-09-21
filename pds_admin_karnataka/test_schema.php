<?php
require('c:/xampp/htdocs/OC_OD_Karnataka/pds_admin_karnataka/util/Connection.php');

$query = "SELECT * FROM optimised_table_leg1 ORDER BY last_updated DESC LIMIT 1";
$result = mysqli_query($con,$query);
$id = "";
while($row = mysqli_fetch_array($result)) {
	$id = $row["id"];
}

$tablename = "optimiseddata_leg1_".$id;
$q = mysqli_query($con, "DESCRIBE $tablename");
while($row=mysqli_fetch_assoc($q)) {
    echo $row['Field'] . "\n";
}
?>
