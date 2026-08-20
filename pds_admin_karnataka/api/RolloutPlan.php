<?php
require('../util/Connection.php');
require('../util/SessionCheck.php');

require('Header.php');

if(isset($_POST["month"]) && $_POST["month"] != ""){
	$month_str = mysqli_real_escape_string($con, $_POST["month"]);
	$parts = explode("_", $month_str);
	$month = $parts[0];
	$year = isset($parts[1]) ? $parts[1] : '';
	$query = "SELECT * FROM optimised_table WHERE month='$month' AND year='$year'";
} else {
	$query = "SELECT * FROM optimised_table ORDER BY last_updated DESC LIMIT 1";
}
$result = mysqli_query($con,$query);
$response = array();
$id = "";
while($row = mysqli_fetch_array($result))
{
	$id= $row["id"];
}

if($id != ""){
	$query = "UPDATE optimised_table SET rolled_out='1' WHERE id='$id'";
	mysqli_query($con,$query);
}

mysqli_close($con);
//echo "Sent to the district for verification";
echo "<script>window.location.href = '../OptimisedData.php';</script>";

?>
<?php require('Fullui.php');  ?>