<?php
require('util/Connection.php'); 
$res = mysqli_query($con, 'SELECT id FROM optimised_table_leg1 LIMIT 1'); 
$row = mysqli_fetch_assoc($res); 
$id = $row['id']; 
$res2 = mysqli_query($con, "SELECT COUNT(*) as c1 FROM optimiseddata_leg1_".$id." WHERE approve_admin='yes'"); 
$res3 = mysqli_query($con, "SELECT COUNT(*) as c2 FROM optimiseddata_leg1_".$id." WHERE approve_district='yes'"); 
print_r(mysqli_fetch_assoc($res2));
print_r(mysqli_fetch_assoc($res3));
?>
