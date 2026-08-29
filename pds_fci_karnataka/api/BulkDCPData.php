<?php
require('../util/Connection.php');
require('../structures/DCP.php');
require('../util/SessionFunction.php');
ini_set('max_execution_time', 3000);
require('../structures/Login.php');
require('../util/Security.php');
require('../util/Logger.php');
require ('../util/Encryption.php');
$nonceValue = 'nonce_value';


if(!SessionCheck()){
	return;
}

require('Header.php');

$person = new Login;
$person->setUsername($_POST["username"]);
$Encryption = new Encryption();
$person->setPassword($Encryption->decrypt($_POST["password"], $nonceValue));

$mapData = [
    "District" => "district",
    "Taluka" => "block",
    "Name of FCI" => "name",
    "FCI ID" => "id",
    "Type" => "type",
    "Latitude" => "latitude",
    "Longitude" => "longitude",
    "Offered Rice" => "demand",
	"Offered FRice" => "demand_rice",
	"Active/Not-Active" => "active"
];

// Reverse mapping
$reverseMapData = array_flip($mapData);

$districts = [];
$query = "SELECT name FROM districts WHERE 1";
$result = mysqli_query($con,$query);
$numrows = mysqli_num_rows($result);
if($numrows>0){
	while($row=mysqli_fetch_assoc($result)){
		array_push($districts,$row["name"]);
	}
}


function formatName($name) {
	$name = preg_replace('/[^a-zA-Z0-9_ ]/', '', $name);
    $name = ucwords(strtolower($name));
    return trim($name);
}

function isValidCoordinate($value, $coordinateType) {
    if (!is_numeric($value)) {
        return false;
    }
    $coordinate = floatval($value);
    switch ($coordinateType) {
        case 'latitude':
            return ($coordinate > 0 && $coordinate <= 45);
        case 'longitude':
            return ($coordinate >= 65 && $coordinate < 100);
        default:
            return false;
    }
}

function isStringNumber($stringValue) {
    return is_numeric($stringValue) && floatval($stringValue) >= 0;
}

$redirect = 1;
$query = "SELECT * FROM login WHERE username='".$person->getUsername()."'";
$result = mysqli_query($con,$query);
$row = mysqli_fetch_assoc($result);

$dbHashedPassword = $row['password'];
if(password_verify($person->getPassword(), $dbHashedPassword)){
try{
	$fileName = $_FILES["file"]["tmp_name"];
	if ($_FILES["file"]["size"] > 0) {
		$file = fopen($fileName, "r");
		$i = 0;
		$district = -1;
		$taluka = -1;
		$name = -1;
		$id = -1;
		$type = -1;
		$demand = -1;
		$demand_rice = -1;
		$longitude = -1;
		$latitude = -1;
		$active = -1;
		while (($column = fgetcsv($file, 10000, ",")) !== FALSE) {
			if($i>0){
				if($district<0 or $taluka<0 or $name<0 or $id<0 or $type<0 or $demand<0 or $demand_rice<0 or $latitude<0 or $longitude<0 or $active<0){
					echo "Error : You have modified Template Header, please check";
					exit();
				}
				if(!is_numeric($column[$latitude]) || floatval($column[$latitude]) <= 0 || floatval($column[$latitude]) > 45){
					echo "Error : Check Latitude Value (must be > 0 and <= 45): ".$column[$latitude];
					echo "</br>";
					$redirect = 0;
				}
				if(!is_numeric($column[$longitude]) || floatval($column[$longitude]) < 65 || floatval($column[$longitude]) >= 100){
					echo "Error : Check Longitude Value (must be >= 65 and < 100): ".$column[$longitude];
					echo "</br>";
					$redirect = 0;
				}
				if(strtoupper(trim($column[$type])) !== 'FCI'){
					echo "Error : Check Type Value: ".$column[$type]." (must be FCI)";
					echo "</br>";
					$redirect = 0;
				}
				if(!isStringNumber($column[$demand])){
					echo "Error : Check Offered Rice Value: ".$column[$demand]." (must be 0 or above)";
					echo "</br>";
					$redirect = 0;
				}
				if(!isStringNumber($column[$demand_rice])){
					echo "Error : Check Offered FRice Value: ".$column[$demand_rice]." (must be 0 or above)";
					echo "</br>";
					$redirect = 0;
				}
				$upperDistricts = array_map('strtoupper', $districts);
				if(!in_array(strtoupper(trim($column[$district])), $upperDistricts)){
					echo "Error : Check District Name: ".$column[$district];
					echo "</br>";
					$redirect = 0;
				}
				if(!($column[$active]==0 || $column[$active]==1)){
					echo "Error : Check value of active/inactive column: ".$column[$active];
					echo "</br>";
					$redirect = 0;
				}
				if (
					!isset($column[$id]) ||
					!preg_match('/^[A-Za-z0-9]+$/', $column[$id])
				) {
					echo "Error: FCI ID should contain only letters and numbers with no spaces or special characters: " . ($column[$id] ?? 'Missing');
					echo "<br>";
					$redirect = 0;
				}
				if (!isset($column[$taluka]) || !preg_match('/^[A-Za-z0-9 ]+$/', trim($column[$taluka]))) {
					echo "Error: Check Taluka value (only letters, numbers, and spaces allowed, no special characters): " . ($column[$taluka] ?? 'Missing');
					echo "<br>";
					$redirect = 0;
				}
			}
			else{
				for($j=0;$j<count($column);$j++){
					switch($column[$j]){
						case $reverseMapData["district"]:
							$district = $j;
							break;
						case $reverseMapData["block"]:
							$taluka = $j;
							break;
						case $reverseMapData["latitude"]:
							$latitude = $j	;
							break;
						case $reverseMapData["longitude"]:
							$longitude = $j;
							break;
						case $reverseMapData["name"]:
							$name = $j;
							break;
						case $reverseMapData["id"]:
							$id = $j;
							break;
						case $reverseMapData["type"]:
							$type = $j;
							break;
						case $reverseMapData["demand"]:
							$demand = $j;
							break;
						case $reverseMapData["demand_rice"]:
							$demand_rice = $j;
							break;
						case $reverseMapData["active"]:
							$active = $j;
							break;
					}
				}
			}
			$i = $i+1;
		}
	}
}
catch(Exception $e){
	echo "Error : Please check data in  .csv file";
}

if($redirect == 0){
	exit();
}

try{
	//if (isset($_POST["submit"])){
		$fileName = $_FILES["file"]["tmp_name"];
		if ($_FILES["file"]["size"] > 0) {
			
			$file = fopen($fileName, "r");
			$i = 0;
			$district = -1;
			$taluka = -1;
			$name = -1;
			$id = -1;
			$type = -1;
			$demand = -1;
			$demand_rice = -1;
			$longitude = -1;
			$latitude = -1;
			$active = -1;
			while (($column = fgetcsv($file, 10000, ",")) !== FALSE) {
				if($i>0){
					if($district<0 or $taluka<0 or $name<0 or $id<0 or $type<0 or $demand<0 or $demand_rice<0 or $latitude<0 or $longitude<0 or $active<0){
						echo "Error : You have modified Template Header, please check";
						exit();
					}
					$DCP = new DCP;
					$uniqueid = uniqid("DCP_",);
					$DCP->setUniqueid(substr($uniqueid,0,15));
					$DCP->setDistrict(strtoupper(trim($column[$district])));
					$DCP->setTaluka(ucwords(strtolower(trim($column[$taluka]))));
					$DCP->setLatitude($column[$latitude]);
					$DCP->setLongitude($column[$longitude]);
					$DCP->setName($column[$name]);
					$DCP->setId($column[$id]);
					$DCP->setType($column[$type]);
					$DCP->setDemand($column[$demand]);
					$DCP->setDemandRice($column[$demand_rice]);
					$DCP->setActive($column[$active]);

					if (!preg_match('/^[A-Za-z0-9]+$/', $column[$id])) {
						echo "Error: Row " . ($i + 1) . " - FCI ID must contain only letters and numbers with no spaces or special characters</br>";
						$redirect = 2;
						$i++;
						continue;
					}
					if (!isset($column[$taluka]) || !preg_match('/^[A-Za-z0-9 ]+$/', trim($column[$taluka]))) {
						echo "Error: Row " . ($i + 1) . " - Taluka must contain only letters, numbers, and spaces with no special characters</br>";
						$redirect = 2;
						$i++;
						continue;
					}
					if (!is_numeric($column[$latitude]) || floatval($column[$latitude]) <= 0 || floatval($column[$latitude]) > 45) {
						echo "Error: Row " . ($i + 1) . " - Latitude must be greater than 0 and less than or equal to 45</br>";
						$redirect = 2;
						$i++;
						continue;
					}
					if (!is_numeric($column[$longitude]) || floatval($column[$longitude]) < 65 || floatval($column[$longitude]) >= 100) {
						echo "Error: Row " . ($i + 1) . " - Longitude must be greater than or equal to 65 and less than 100</br>";
						$redirect = 2;
						$i++;
						continue;
					}
					if (!is_numeric($column[$demand]) || floatval($column[$demand]) < 0) {
						echo "Error: Row " . ($i + 1) . " - Offered Rice must be 0 or above</br>";
						$redirect = 2;
						$i++;
						continue;
					}
					if (!is_numeric($column[$demand_rice]) || floatval($column[$demand_rice]) < 0) {
						echo "Error: Row " . ($i + 1) . " - Offered FRice must be 0 or above</br>";
						$redirect = 2;
						$i++;
						continue;
					}
					while(true){
						$query_check = $DCP->check($DCP);
						$query_result = mysqli_query($con, $query_check);
						$numrows = mysqli_num_rows($query_result);
						if($numrows==0){
							break;
						}
						else{
							$uniqueid = uniqid("DCP_",);
							$DCP->setUniqueid(substr($uniqueid,0,15));
						}
					}
					$query_insert_check = $DCP->checkInsert($DCP);
					$query_insert_result = mysqli_query($con, $query_insert_check);
					$numrows_insert = mysqli_num_rows($query_insert_result);
					if($numrows_insert==0){
						writeLog("User ->" ." DCP Added -> ". $_SESSION['user'] . "| " . $DCP->getName());
						$query_add = $DCP->insert($DCP);
						mysqli_query($con, $query_add);
					}
					else{
						echo "Error : DCP with id ".$DCP->getId()." Already Exist</br>";
						$redirect = 2;
					}
				}
					
				else{
					for($j=0;$j<count($column);$j++){
						switch($column[$j]){
							case $reverseMapData["district"]:
								$district = $j;
								break;
							case $reverseMapData["block"]:
								$taluka = $j;
								break;
							case $reverseMapData["latitude"]:
								$latitude = $j;
								break;
							case $reverseMapData["longitude"]:
								$longitude = $j;
								break;
							case $reverseMapData["name"]:
								$name = $j;
								break;
							case $reverseMapData["id"]:
								$id = $j;
								break;
							case $reverseMapData["type"]:
								$type = $j;
								break;
							case $reverseMapData["demand"]:
								$demand = $j;
								break;
							case $reverseMapData["demand_rice"]:
								$demand_rice = $j;
								break;
							case $reverseMapData["active"]:
								$active = $j;
								break;
						}
					}
				}
				$i = $i+1;
				
			}
			if($redirect==1){
				echo "<script>window.location.href = '../DCP.php';</script>";
			}
		}
	//}
	
}
catch(Exception $e){
	echo "Error : Please check data in  .csv file";
}
} 
else{
    echo "Error : Password or Username is incorrect";
}
?>
<?php require('Fullui.php');  ?>