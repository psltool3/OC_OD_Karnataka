<?php
require('../util/Connection.php');
require('../util/SessionCheck.php');
require('../util/Logger.php');

require('Header.php');
set_time_limit(300); // Set to 300 seconds (5 minutes), or 0 for no limit

$query = "SELECT * FROM optimised_table ORDER BY last_updated DESC LIMIT 1";
$result = mysqli_query($con,$query);
$response = array();
$id = "";
while($row = mysqli_fetch_array($result))
{
	$id= $row["id"];
}

$tablename = "optimiseddata_".$id;

foreach ($_POST as $key => $value) {
	// Restore any dots that were encoded as __DOT__ before posting
	$rawKey = str_replace('__DOT__', '.', $key);

	$parts = explode("_", $rawKey, 3);
	if (count($parts) < 3) continue;

	$fromid = $parts[0];
	$toid = $parts[1];
	$commodity = $parts[2];
	$toid = str_replace('_', '.', $toid);
	$commodity = str_replace('_', '.', $commodity);
	$fromid_clean = preg_replace('/\.00$/', '', $fromid);

	if($value=="yes"){
		$query = "SELECT * FROM " . $tablename . " WHERE (from_id='$fromid' OR from_id='$fromid_clean') AND to_id='$toid' AND commodity='$commodity'";
		$result = mysqli_query($con, $query);
		$numrows = mysqli_num_rows($result);
		if($numrows==0){
			$query = "SELECT * FROM " . $tablename . " WHERE (new_id_admin='$fromid' OR new_id_admin='$fromid_clean') AND to_id='$toid' AND commodity='$commodity'";
			$result = mysqli_query($con, $query);
			$numrows = mysqli_num_rows($result);
			if($numrows==0){
				$query = "SELECT * FROM " . $tablename . " WHERE (new_id_district='$fromid' OR new_id_district='$fromid_clean') AND to_id='$toid' AND commodity='$commodity'";
				$result = mysqli_query($con, $query);
				$numrows = mysqli_num_rows($result);
				if($numrows!=0){
					$query = "UPDATE " . $tablename . " SET status='implemented' WHERE (new_id_district='$fromid' OR new_id_district='$fromid_clean') AND to_id='$toid' AND commodity='$commodity'";
					mysqli_query($con,$query);
					writeLog("district User ->" ." Save Data | implemeneted ->". $_SESSION['district_user'] . "| " . $fromid . " - " . $toid . " - " . $commodity);
				}
			}
			else{
				$query = "UPDATE " . $tablename . " SET status='implemented' WHERE (new_id_admin='$fromid' OR new_id_admin='$fromid_clean') AND to_id='$toid' AND commodity='$commodity'";
				mysqli_query($con,$query);
				writeLog("district User ->" ." Save Data | implemeneted ->". $_SESSION['district_user'] . "| " . $fromid . " - " . $toid . " - " . $commodity);
			}
		}
		else{
			$query = "UPDATE " . $tablename . " SET status='implemented' WHERE (from_id='$fromid' OR from_id='$fromid_clean') AND to_id='$toid' AND commodity='$commodity'";
			mysqli_query($con,$query);
			writeLog("district User ->" ." Save Data | implemeneted ->". $_SESSION['district_user'] . "| " . $fromid . " - " . $toid . " - " . $commodity);
		}
	}
}
mysqli_close($con);
echo "<script>window.location.href = '../RolloutPlan.php';</script>";
?>
<?php require('Fullui.php'); ?>
