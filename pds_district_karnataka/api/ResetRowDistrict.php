<?php
require('../util/Connection.php');
require('../util/SessionCheck.php');
require('../util/Logger.php');

if (!isset($_POST['uniqueid'])) {
    echo json_encode(["status" => "error", "message" => "Missing uniqueid parameter"]);
    exit;
}

$uniqueid = $_POST['uniqueid'];

// uniqueid is from_id_to_id_commodity
$parts = explode("_", $uniqueid, 3);
if (count($parts) < 3) {
    echo json_encode(["status" => "error", "message" => "Invalid uniqueid format"]);
    exit;
}

$fromid = $parts[0];
$toid = $parts[1];
$commodity = $parts[2];
$toid = str_replace('_', '.', $toid);
$commodity = str_replace('_', '.', $commodity);
$commodity = str_replace('.bool', '', $commodity);

$fromid = mysqli_real_escape_string($con, $fromid);
$toid = mysqli_real_escape_string($con, $toid);
$commodity = mysqli_real_escape_string($con, $commodity);

$query = "SELECT * FROM optimised_table ORDER BY last_updated DESC LIMIT 1";
$result = mysqli_query($con,$query);
$id = "";
if($row = mysqli_fetch_array($result))
{
	$id= $row["id"];
}

if($id != "") {
    $tablename = "optimiseddata_".$id;
    
    // Check if admin has approved this tag
    $checkQuery = "SELECT approve_admin FROM `$tablename` WHERE from_id='$fromid' AND to_id='$toid' AND commodity='$commodity'";
    $checkResult = mysqli_query($con, $checkQuery);
    if ($checkRow = mysqli_fetch_assoc($checkResult)) {
        if ($checkRow['approve_admin'] === 'yes') {
            echo json_encode(["status" => "error", "message" => "This tag has been approved by the Admin and cannot be reset."]);
            exit;
        }
    }

    $updateQuery = "UPDATE `$tablename` SET approve_district=NULL, new_id_district=NULL, new_name_district=NULL, reason_district=NULL, new_distance_district=NULL WHERE from_id='$fromid' AND to_id='$toid' AND commodity='$commodity'";
    mysqli_query($con, $updateQuery);
    
    $username = isset($_SESSION['district_user']) ? $_SESSION['district_user'] : 'unknown';
    writeLog("User -> Reset District Data -> " . $username . " | " . $fromid . " - " . $toid . " - " . $commodity);
    
    echo json_encode(["status" => "success", "message" => "Row reset successfully"]);
} else {
    echo json_encode(["status" => "error", "message" => "No optimised data found"]);
}
?>
