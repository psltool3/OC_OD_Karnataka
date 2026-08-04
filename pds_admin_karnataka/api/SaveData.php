<?php
require('../util/Connection.php');
require('../util/SessionCheck.php');
require('Header.php');
require('../util/Logger.php');
ini_set('max_input_vars', 23000000000000);
ini_set('memory_limit', '4G');
set_time_limit(300); // Set to 300 seconds (5 minutes), or 0 for no limit

//echo json_encode($_POST);

$query = "SELECT * FROM optimised_table ORDER BY last_updated DESC LIMIT 1";
$result = mysqli_query($con,$query);
$response = array();
$id = "";
while($row = mysqli_fetch_array($result))
{
	$id= $row["id"];
}

$tablename = "optimiseddata_".$id;
echo $tablename;
echo "</br>";
foreach ($_POST as $key => $value) {
	if ($key === 'accept_all' || substr($key, -11) === '_iddistance' || substr($key, -9) === '_idreason' || substr($key, -8) === '_approve' || $value === "") {
		if ($key !== 'accept_all' && substr($key, -8) === '_approve') {
			$parts = explode("_", $key, 3);
			$fromid = isset($parts[0]) ? $parts[0] : '';
			$toid = isset($parts[1]) ? $parts[1] : '';
			$commodity = isset($parts[2]) ? $parts[2] : '';
			$toid = str_replace('_', '.', $toid);
			$commodity = str_replace('_', '.', $commodity);
			$commodity = str_replace('.bool', '', $commodity);
			if($value=="yes"){
				$query = "UPDATE " . $tablename . " SET district_change_approve='yes' WHERE from_id='$fromid' AND to_id='$toid' AND commodity='$commodity'";
				writeLog("User ->" ." Save Data | approve district change yes ->". $_SESSION['user'] . "| " . $fromid . " - " . $toid . " - ". $commodity);
			}
			else if($value=="no"){
				$query = "UPDATE " . $tablename . " SET district_change_approve='no' WHERE from_id='$fromid' AND to_id='$toid' AND commodity='$commodity'";
				writeLog("User ->" ." Save Data | approve district change no ->". $_SESSION['user'] . "| " . $fromid . " - " . $toid . " - ". $commodity);
			}
			mysqli_query($con,$query);
			echo $query;
		}
		continue;
	}
	$parts = explode("_", $key, 3);
	$fromid = isset($parts[0]) ? $parts[0] : '';
	$toid = isset($parts[1]) ? $parts[1] : '';
	$commodity = isset($parts[2]) ? $parts[2] : '';
	$toid = str_replace('_', '.', $toid);
	$commodity = str_replace('_', '.', $commodity);
	$commodity = str_replace('.bool', '', $commodity);
	
	// Check if district has provided any suggestions (warehouse, reason, or distance)
	// $query_check = "SELECT new_id_district, reason_district, new_distance_district FROM " . $tablename . " WHERE from_id='$fromid' AND to_id='$toid' AND commodity='$commodity'";
	// $result_check = mysqli_query($con, $query_check);
	// $row_check = mysqli_fetch_assoc($result_check);
	
	// $has_district_suggestion = (!empty($row_check['new_id_district']) || !empty($row_check['reason_district']) || !empty($row_check['new_distance_district']));
	
	// // If district has provided any value, clear the admin approval for this row
	// if($has_district_suggestion){
	// 	$query = "UPDATE " . $tablename . " SET approve_admin='', new_id_admin='' WHERE from_id='$fromid' AND to_id='$toid' AND commodity='$commodity'";
	// 	writeLog("User ->" ." Save Data | admin approval cleared - district provided data ->". $_SESSION['user'] . "| " . $fromid . " - " . $toid . " - ". $commodity);
	// 	mysqli_query($con,$query);
	// 	continue;
	// }
	
	if($value=="yes"){
		$query = "UPDATE " . $tablename . " SET approve_admin='yes' WHERE from_id='$fromid' AND to_id='$toid' AND commodity='$commodity'";
		writeLog("User ->" ." Save Data | approve admin change yes ->". $_SESSION['user'] . "| " . $fromid . " - " . $toid . " - ". $commodity);
	}
	else if($value=="same"){
		$query = "UPDATE " . $tablename . " SET approve_admin='no' WHERE from_id='$fromid' AND to_id='$toid' AND commodity='$commodity'";
		writeLog("User ->" ." Save Data | approve admin change no ->". $_SESSION['user'] . "| " . $fromid . " - " . $toid . " - ". $commodity);
	}
	else if($value=="no"){
		// this case will not fall as we have check for this in js
		$query = "UPDATE " . $tablename . " SET approve_admin='', new_id_admin='' WHERE from_id='$fromid' AND to_id='$toid' AND commodity='$commodity'";
	}
	else if($value==""){
		$query = "";
		//$query = "UPDATE " . $tablename . " SET approve_admin='', new_id_admin='' WHERE from_id='$fromid' AND to_id='$toid' AND commodity='$commodity'";
	}
	else{
		$query_name = "SELECT name FROM warehouse WHERE id='$value'";
		$result_name = mysqli_query($con,$query_name);
		$row_name = mysqli_fetch_assoc($result_name);
		$name = isset($row_name['name']) ? $row_name['name'] : '';
		$reason = isset($_POST[$key."_idreason"]) ? $_POST[$key."_idreason"] : '';
		$distance = isset($_POST[$key."_iddistance"]) ? $_POST[$key."_iddistance"] : '';
		if ($distance !== '' && !preg_match('/^\d+(\.\d+)?$/', trim($distance))) {
			echo "<script>alert('Invalid distance value: must be a positive integer or float.'); window.history.back();</script>";
			exit;
		}
		$query = "UPDATE " . $tablename . " SET new_id_admin='$value', new_name_admin='$name', approve_admin='yes', new_distance_admin='$distance', reason_admin='$reason' WHERE from_id='$fromid' AND to_id='$toid'";
		writeLog("User ->" ." Save Data | approve district change id ->". $_SESSION['user'] . "| " . $fromid . " - " . $toid . "| " . $value);
	}
	mysqli_query($con,$query);
}
mysqli_close($con);

echo "<script>window.location.href = '../OptimisedData.php';</script>";

?>
<?php require('Fullui.php');  ?>