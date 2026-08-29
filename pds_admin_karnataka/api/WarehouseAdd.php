<?php

require('../util/Connection.php');
require('../structures/Warehouse.php');
require('../util/SessionFunction.php');
require('../structures/Login.php');
require('../util/Logger.php');
require('../util/Security.php');
require ('../util/Encryption.php');
$nonceValue = 'nonce_value';

if(!SessionCheck()){
	return;
}

require('Header.php');


function formatName($name) {
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
    return is_numeric($stringValue) && floatval($stringValue) >= 0;
}

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

if(!isStringNumber($_POST["storage"])){
	echo "Error : Check Storage Value (must be 0 or above)";
	exit();
}

if(!isStringNumber($_POST["ragi"])){
	echo "Error : Check Ragi Value (must be 0 or above)";
	exit();
}

if(!isStringNumber($_POST["jowar"])){
	echo "Error : Check Jowar Value (must be 0 or above)";
	exit();
}

if (!isset($_POST["latitude"]) || !is_numeric($_POST["latitude"]) || floatval($_POST["latitude"]) <= 0 || floatval($_POST["latitude"]) > 45) {
    echo "Check Latitude: value must be greater than 0 and less than or equal to 45";
    exit();
}

if (!isset($_POST["longitude"]) || !is_numeric($_POST["longitude"]) || floatval($_POST["longitude"]) < 65 || floatval($_POST["longitude"]) >= 100) {
    echo "Check Longitude: value must be greater than or equal to 65 and less than 100";
    exit();
}

if (!isset($_POST["id"]) || !preg_match('/^[A-Za-z0-9]+$/', $_POST["id"])) {
	echo "Error : Warehouse ID must contain only letters and numbers with no spaces or special characters.";
	exit();
}

if (!isset($_POST["taluka"]) || !preg_match('/^[A-Za-z0-9 ]+$/', trim($_POST["taluka"]))) {
    echo "Error : Check Taluka value (only letters, numbers, and spaces allowed, no special characters)";
    exit();
}

$dbHashedPassword = $row['password'];
if(password_verify($person->getPassword(), $dbHashedPassword)){
$district = strtoupper(trim($_POST["district"]));
$taluka = formatName($_POST['taluka']);
$latitude = $_POST["latitude"];
$longitude = $_POST["longitude"];
$name = formatName($_POST["name"]);
$id = $_POST["id"];
$type = $_POST["type"];
$storage = $_POST["storage"];
$warehousetype = $_POST["warehousetype"];
$ragi = $_POST["ragi"];
$jowar = $_POST["jowar"];
$uniqueid = uniqid("WH_",);


$Warehouse = new Warehouse;
$Warehouse->setUniqueid(substr($uniqueid,0,15));
$Warehouse->setDistrict($district);
$Warehouse->setTaluka($taluka);
$Warehouse->setLatitude($latitude);
$Warehouse->setLongitude($longitude);
$Warehouse->setName($name);
$Warehouse->setId($id);
$Warehouse->setType($type);
$Warehouse->setStorage($storage);
$Warehouse->setragi($ragi);
$Warehouse->setjowar($jowar);
$Warehouse->setWarehousetype($warehousetype);
$Warehouse->setActive("1");
$query_insert_check = $Warehouse->checkInsert($Warehouse);
$query_insert_result = mysqli_query($con, $query_insert_check);
$numrows_insert = mysqli_num_rows($query_insert_result);
if($numrows_insert==0){
	$query = $Warehouse->insert($Warehouse);
	mysqli_query($con, $query);
	mysqli_close($con);
	$filteredPost = $_POST;
	unset($filteredPost['username'], $filteredPost['password']);
	writeLog("User ->" ." Warehouse added ->". $_SESSION['user'] . "| Requested JSON -> " . json_encode($filteredPost));
	echo "<script>window.location.href = '../Warehouse.php';</script>";
}
else{
	echo "Error : in Insertion as Warehouse id already exist";
}
} 
else{
    echo "Error : Password or Username is incorrect";
}

?>
<?php require('Fullui.php');  ?>