<?php
require('../util/Connection.php');
require('../structures/District.php');
require('../util/SessionFunction.php');
require('../structures/Login.php');

if(!SessionCheck()){
	return;
}

$month_param = isset($_POST['month']) ? $_POST['month'] : '';
$id = "";
if(!empty($month_param)){
	$parts = explode('_', $month_param);
	$m = $parts[0];
	$y = isset($parts[1]) ? $parts[1] : '';
	$query = "SELECT * FROM optimised_table WHERE month='$m' AND year='$y'";
	$result = mysqli_query($con,$query);
	if($result && mysqli_num_rows($result) > 0){
		$row = mysqli_fetch_assoc($result);
		$id = $row['id'];
	}
}
if(empty($id)){
	$query = "SELECT * FROM optimised_table ORDER BY last_updated DESC LIMIT 1";
	$result = mysqli_query($con,$query);
	$response = array();
	while($row = mysqli_fetch_array($result))
	{
		$id= $row["id"];
	}
}

$tablename = "optimiseddata_".$id;
$district = $_SESSION['district_district'];

$status = isset($_POST['status']) ? $_POST['status'] : '';
$data = array();
$query = "SHOW TABLES LIKE '$tablename'";
$result = $con->query($query);


if ($result && $result->num_rows > 0) {
	$query_implemented = "SELECT * FROM ".$tablename." WHERE to_district='$district' AND status='implemented' AND approve_district='yes' AND (approve_admin='yes' OR approve_admin='no')";
	$result_implemented = mysqli_query($con,$query_implemented);
	$count_implemented = mysqli_num_rows($result_implemented);
	
	$query_notimplemented = "SELECT * FROM ".$tablename." WHERE to_district='$district' AND (status IS NULL OR status='') AND approve_district='yes' AND (approve_admin='yes' OR approve_admin='no')";
	$result_notimplemented = mysqli_query($con,$query_notimplemented);
	$count_notimplemented = mysqli_num_rows($result_notimplemented);
	
	$query = "SELECT * FROM ".$tablename." WHERE to_district='$district' AND approve_district='yes' AND (approve_admin='yes' OR approve_admin='no')";
	if($status=="implemented"){
		$query = "SELECT * FROM ".$tablename." WHERE to_district='$district' AND status='implemented' AND approve_district='yes' AND (approve_admin='yes' OR approve_admin='no')";
	}
	else if($status=="not implemented"){
		$query = "SELECT * FROM ".$tablename." WHERE to_district='$district' AND (status IS NULL OR status='') AND approve_district='yes' AND (approve_admin='yes' OR approve_admin='no')";
	}
	
	$result = mysqli_query($con,$query);
	while($row = mysqli_fetch_assoc($result))
	{
		if($row['new_id_admin']!=null or $row['new_id_admin']!=""){
			$new_id = $row['new_id_admin'];
			$query_warehouse = "SELECT latitude,longitude,district FROM warehouse WHERE id='$new_id'";
			$result_warehouse = mysqli_query($con,$query_warehouse);
			$numrows_warehouse = ($result_warehouse) ? mysqli_num_rows($result_warehouse) : 0;
			if($numrows_warehouse!=0){
				$row_warehouse = mysqli_fetch_assoc($result_warehouse);
				$row["from_lat"] = $row_warehouse['latitude'];
				$row["from_long"] = $row_warehouse['longitude'];
				$row["from_district"] = $row_warehouse['district'];
			}
			$row["from_id"] = $row['new_id_admin'];
			$row["from_name"] = $row['new_name_admin'];
			$row["distance"] = $row['new_distance_admin'];
		}
		else if(($row['new_id_district']!=null or $row['new_id_district']!="") and $row['approve_admin']=="yes"){
			$new_id = $row['new_id_district'];
			$query_warehouse = "SELECT latitude,longitude,district FROM warehouse WHERE id='$new_id'";
			$result_warehouse = mysqli_query($con,$query_warehouse);
			$numrows_warehouse = ($result_warehouse) ? mysqli_num_rows($result_warehouse) : 0;
			if($numrows_warehouse!=0){
				$row_warehouse = mysqli_fetch_assoc($result_warehouse);
				$row["from_lat"] = $row_warehouse['latitude'];
				$row["from_long"] = $row_warehouse['longitude'];
				$row["from_district"] = $row_warehouse['district'];
			}
			$row["from_id"] = $row['new_id_district'];
			$row["from_name"] = $row['new_name_district'];
			$row["distance"] = $row['new_distance_district'];
		}
		$data[] = $row;			
	}
	$resultarray["data"] = $data;
	$resultarray["implemented"] = $count_implemented;
	$resultarray["notimplemented"] = $count_notimplemented;
	echo json_encode($resultarray);
} else {
	$resultarray = [];
	$resultarray["data"] = array();
	echo json_encode($resultarray);
}
?>