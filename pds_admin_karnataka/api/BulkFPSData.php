<?php
require('../util/Connection.php');
require('../structures/FPS.php');
require('../util/SessionFunction.php');
require('../structures/Login.php');
require('../util/Logger.php');
ini_set('max_execution_time', 3000);
require('../util/Security.php');
require ('../util/Encryption.php');
$nonceValue = 'nonce_value';

if(!SessionCheck()){
	return;
}

require('Header.php');

$mapData = [
    "District" => "district",
	"Taluka" => "taluka",
    "Name of FPS" => "name",
    "ID" => "id",
    "Model FPS/Normal FPS" => "type",
    "Latitude" => "latitude",
    "Longitude" => "longitude",
    "Demand of FRice" => "demand",
	"Demand of Rice" => "demand_rice",
    "Demand of ragi" => "inventory_ragi",
    "Demand of jowar" => "inventory_jowar",
	"Active/Not-Active" => "active"
];

// Reverse mapping
$reverseMapData = array_flip($mapData);

$person = new Login;
$person->setUsername($_POST["username"]);
$Encryption = new Encryption();
$person->setPassword($Encryption->decrypt($_POST["password"], $nonceValue));

if($_SESSION['user']!=$person->getUsername()){
	echo "User is logged in with different username and password";
	return;
}

$query = "SELECT * FROM login WHERE username='".$person->getUsername()."'";
$result = mysqli_query($con,$query);
$row = mysqli_fetch_assoc($result);

$dbHashedPassword = $row['password'];
if(password_verify($person->getPassword(), $dbHashedPassword)){
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
    // Check if the value is a number and not a string
    if (!is_numeric($value)) {
        return false;
    }
	
    // Convert the value to a float
    $coordinate = floatval($value);

    // Check if it's latitude or longitude and validate within the range
    switch ($coordinateType) {
        case 'latitude':
            return ($coordinate >= -90 && $coordinate <= 90);
        case 'longitude':
            return ($coordinate >= -180 && $coordinate <= 180);
        default:
            return false;
    }
}

function isStringNumber($stringValue) {
    return is_numeric($stringValue);
}

$redirect = 1;

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
        $inventory_ragi = -1;
		$inventory_jowar = -1;
		$longitude = -1;
		$latitude = -1;
		$active = -1;
		while (($column = fgetcsv($file, 10000, ",")) !== FALSE) {
			if($i>0){
				if($district<0 or $taluka<0 or $name<0 or $id<0 or $type<0 or $demand<0 or $demand_rice<0 or $latitude<0 or $longitude<0 or $active<0 or $inventory_ragi<0 or $inventory_jowar<0){
					echo "Error : You have modified Template Header, please check";
					exit();
				}
				if(!isValidCoordinate($column[$latitude],'latitude') or !isValidCoordinate($column[$longitude],'longitude')){
					echo "Error : Check Latitude and Longitude Value Latitude: ".$column[$latitude]." Longitude: ".$column[$longitude];
					echo "</br>";
					$redirect = 0;
				}
				if(!isStringNumber($column[$demand])){
					echo "Error : Check Demand Value: ".$column[$demand];
					echo "</br>";
					$redirect = 0;
				}
				if(!isStringNumber($column[$demand_rice])){
					echo "Error : Check DemandRice Value: ".$column[$demand_rice];
					echo "</br>";
					$redirect = 0;
				}
                if(!isStringNumber($column[$inventory_ragi])){
					echo "Error : Check Inventory ragi Value: ".$column[$inventory_ragi];
					echo "</br>";
					$redirect = 0;
				}
				if(!isStringNumber($column[$inventory_jowar])){
					echo "Error : Check Inventory jowar Value: ".$column[$inventory_jowar];
					echo "</br>";
					$redirect = 0;
				}
				if(!in_array($column[$district], $districts)){
					echo "Error : Check District Name: ".$column[$district];
					echo "</br>";
					$redirect = 0;
				}
				if(!($column[$active]==0 || $column[$active]==1)){
					echo "Error : Check value of active/inactive column: ".$column[$active];
					echo "</br>";
					$redirect = 0;
				}
				if (!preg_match('/^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9]+$/', $column[$id])) {
					echo "Error : FPS ID must contain both characters and numbers, and only alphanumeric characters are allowed. Invalid ID found: ".$column[$id];
					echo "</br>";
					$redirect = 0;
				}
			}
			else{
				for($j=0;$j<count($column);$j++){
					switch($column[$j]){
						case $reverseMapData["district"]:
							$district = $j;
							break;
						case $reverseMapData["taluka"]:
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
                        case $reverseMapData["inventory_ragi"]:
                            $inventory_ragi = $j;
                            break;
						case $reverseMapData["inventory_jowar"]:
                            $inventory_jowar = $j;
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
            $inventory_ragi = -1;
			$inventory_jowar = -1;
			$longitude = -1;
			$latitude = -1;
			$active = -1;
			while (($column = fgetcsv($file, 10000, ",")) !== FALSE) {
				if($i>0){
					if($district<0 or $taluka<0 or $name<0 or $id<0 or $type<0 or $demand<0 or $demand_rice<0 or $latitude<0 or $longitude<0 or $active<0 or $inventory_ragi<0 or $inventory_jowar<0){
						echo "Error : You have modified Template Header, please check";
						exit();
					}
					$FPS = new FPS;
					$uniqueid = uniqid("FPS_",);
					$FPS->setUniqueid(substr($uniqueid,0,15));
					$FPS->setDistrict(ucwords(strtolower($column[$district])));
					$FPS->setTaluka(ucwords(strtolower($column[$taluka])));
					$FPS->setLatitude($column[$latitude]);
					$FPS->setLongitude($column[$longitude]);
					$FPS->setName($column[$name]);
					$FPS->setId($column[$id]);
					$FPS->setType($column[$type]);
					$FPS->setDemand($column[$demand]);
					$FPS->setDemandRice($column[$demand_rice]);
                    $FPS->setInventoryragi($column[$inventory_ragi]);
					$FPS->setInventoryjowar($column[$inventory_jowar]);
					$FPS->setActive($column[$active]);
					while(true){
						$query_check = $FPS->check($FPS);
						$query_result = mysqli_query($con, $query_check);
						$numrows = mysqli_num_rows($query_result);
						if($numrows==0){
							break;
						}
						else{
							$uniqueid = uniqid("FPS_",);
							$FPS->setUniqueid(substr($uniqueid,0,15));
						}
					}
					$query_insert_check = $FPS->checkInsert($FPS);
					$query_insert_result = mysqli_query($con, $query_insert_check);
					$numrows_insert = mysqli_num_rows($query_insert_result);
					if($numrows_insert==0){
						writeLog("User ->" ." FPS Added -> ". $_SESSION['user'] . "| " . $FPS->getName());
						$query_add = $FPS->insert($FPS);
						mysqli_query($con, $query_add);
					}
					else{
						echo "Error : FPS with id ".$FPS->getId()." Already Exist</br>";
						$redirect = 2;
					}
				}
				else{
					for($j=0;$j<count($column);$j++){
						switch($column[$j]){
							case $reverseMapData["district"]:
								$district = $j;
								break;
							case $reverseMapData["taluka"]:
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
                            case $reverseMapData["inventory_ragi"]:
                                $inventory_ragi = $j;
                                break;
							case $reverseMapData["inventory_jowar"]:
                                $inventory_jowar = $j;
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
				echo "<script>window.location.href = '../FPS.php';</script>";
			}
		}
	//}
	//else{
		//echo "Error Please Select .csv file";
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