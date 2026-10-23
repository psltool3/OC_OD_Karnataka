<?php

require('../util/Connection.php');
require('../util/SessionFunction.php');
require('../util/Logger.php');

if(!SessionCheck()){
	return;
}

require('Header.php');


$id = $_POST["uid"];



$query = "SELECT * FROM fps WHERE uniqueid='$id'";
$result = mysqli_query($con,$query);
$numrows = mysqli_num_rows($result);

if($numrows>0){
	$row = mysqli_fetch_assoc($result);
	$status = $row['active'];
	$fpsname = $row['name'];
	if($status==0){
		// Attempting to ACTIVATE: Enforce strict range validation
		$lat = $row['latitude'];
		$lng = $row['longitude'];
		$qty = $row['demand'];

		$isValidLat = ($lat !== null && $lat !== '' && is_numeric($lat) && (float)$lat > 0 && (float)$lat < 40);
		$isValidLng = ($lng !== null && $lng !== '' && is_numeric($lng) && (float)$lng > 65 && (float)$lng < 100);
		$isValidQty = ($qty !== null && $qty !== '' && is_numeric($qty) && (float)$qty >= 0);

		if (!$isValidLat || !$isValidLng || !$isValidQty) {
			echo "<script>alert('Cannot activate: Coordinates out of range or negative value.'); window.location.href = '../FPS.php';</script>";
			exit();
		}

		$query = "UPDATE fps SET active='1' WHERE uniqueid='$id'";
		
		writeLog("User ->" ." FPS Active -> ". $_SESSION['user'] . "| " . $fpsname);
		mysqli_query($con,$query);
	}
	else{
		$query = "UPDATE fps SET active='0' WHERE uniqueid='$id'";
		
		writeLog("User ->" ." FPS Inactive -> ". $_SESSION['user'] . "| " . $fpsname);
		mysqli_query($con,$query);
	}
}


mysqli_close($con);

echo "<script>window.location.href = '../FPS.php';</script>";

?>
<?php require('Fullui.php');  ?>