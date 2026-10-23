<?php

require('../util/Connection.php');
require('../util/SessionFunction.php');
require('../util/Logger.php');

if(!SessionCheck()){
	return;
}

require('Header.php');


$id = $_POST["uid"];

$query = "SELECT * FROM dcp WHERE uniqueid='$id'";
$result = mysqli_query($con,$query);
$numrows = mysqli_num_rows($result);

if($numrows>0){
	$row = mysqli_fetch_assoc($result);
	$status = $row['active'];
	$dcpname = $row['name'];
	if($status==0){
		// Attempting to ACTIVATE: Enforce strict range validation
		$lat = $row['latitude'];
		$lng = $row['longitude'];
		$qty = $row['demand'];

		$isValidLat = ($lat !== null && $lat !== '' && is_numeric($lat) && (float)$lat > 0 && (float)$lat < 40);
		$isValidLng = ($lng !== null && $lng !== '' && is_numeric($lng) && (float)$lng > 65 && (float)$lng < 100);
		$isValidQty = ($qty !== null && $qty !== '' && is_numeric($qty) && (float)$qty >= 0);

		if (!$isValidLat || !$isValidLng || !$isValidQty) {
			echo "<script>alert('Cannot activate: Coordinates out of range or negative value.'); window.location.href = '../DCP.php';</script>";
			exit();
		}

		$query = "UPDATE dcp SET active='1' WHERE uniqueid='$id'";
		writeLog("User ->" ." DCP Active -> ". $_SESSION['user'] . "| " . $dcpname);
		mysqli_query($con,$query);
	}
	else{
		$query = "UPDATE dcp SET active='0' WHERE uniqueid='$id'";
		writeLog("User ->" ." DCP InActive -> ". $_SESSION['user'] . "| " . $dcpname);
		mysqli_query($con,$query);
	}
}


mysqli_close($con);

echo "<script>window.location.href = '../DCP.php';</script>";

?>
<?php require('Fullui.php');  ?>