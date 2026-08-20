<?php
require('../util/Connection.php');
require('../structures/District.php');
require('../util/SessionFunction.php');
require('../structures/Login.php');

if(!SessionCheck()){
	return;
}

$reviewed = "";
$approved = "";
$from_id = "";
$to_id = "";

if(isset($_POST['fromid'])){
	$from_id = $_POST['fromid'];
}

if(isset($_POST['toid'])){
	$to_id = $_POST['toid'];
}

if(isset($_POST['approved'])){
	$approved = $_POST['approved'];
}

if(isset($_POST['reviewed'])){
	$reviewed = $_POST['reviewed'];
}

$month = $_POST['month'];
$district = $_POST['district'];

$parts = explode('_', $month);

$month = $parts[0];
$year = $parts[1]; 
$query = "SELECT * FROM optimised_table WHERE month='$month' AND year='$year'";
$result = mysqli_query($con,$query);
$numrow = mysqli_num_rows($result);
$id = "";
if($numrow>0){
	$row = mysqli_fetch_assoc($result);
	$id = $row['id'];
}

$tablename = "optimiseddata_".$id;

$query = "SHOW TABLES LIKE '$tablename'";
$result = $con->query($query);
$data = null;

if ($result && $result->num_rows > 0) {
	$where = array();

	if(!empty($district)){
		$where[] = "to_district='$district'";
	}

	if($reviewed=="reviewed"){
		$where[] = "approve_district='yes'";
	}
	else if($reviewed=="notreviewed"){
		$where[] = "(approve_district = '' OR approve_district IS NULL)";
	}
	else if($reviewed=="districtagreed"){
		$where[] = "approve_district='yes' AND (new_id_district IS NULL OR new_id_district='') AND (reason_district IS NULL OR reason_district='') AND (new_distance_district IS NULL OR new_distance_district='')";
	}
	else if($reviewed=="changerequest"){
		$where[] = "((new_id_district IS NOT NULL AND new_id_district != '') OR (reason_district IS NOT NULL AND reason_district != '') OR (new_distance_district IS NOT NULL AND new_distance_district != ''))";
	}

	if($approved=="approved"){
		$where[] = "approve_admin='yes'";
	}
	else if($approved=="notapproved"){
		$where[] = "(approve_admin='no' OR approve_admin IS NULL)";
	}

	if(!empty($from_id)){
		$where[] = "from_id='$from_id'";
	}

	if(!empty($to_id)){
		$where[] = "to_id='$to_id'";
	}

	$query = "SELECT * FROM ".$tablename;
	if(count($where) > 0){
		$query .= " WHERE " . implode(" AND ", $where);
	}
	$result = mysqli_query($con,$query);
	while($row = mysqli_fetch_assoc($result))
	{
		$data[] = $row;
	}

	$query_warehouse = "SELECT id from warehouse WHERE active='1'";
	$result_warehouse = mysqli_query($con,$query_warehouse);
	while($row_warehouse = mysqli_fetch_assoc($result_warehouse)){
		$warehouse[] = $row_warehouse;
	}
	$resultarray = [];
	if($data==null){
		$data = array();
	}
	$resultarray["data"] = $data;
	$resultarray["warehouse"] = $warehouse;
	
	echo json_encode($resultarray);
} else {
	$resultarray = [];
	$resultarray["data"] = array();
	$resultarray["warehouse"] = array();
	echo json_encode($resultarray);
}
?>