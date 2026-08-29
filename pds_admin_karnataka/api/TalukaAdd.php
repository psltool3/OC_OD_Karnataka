<?php

require('../util/Connection.php');
require('../structures/Taluka.php');
require('../util/SessionFunction.php');
require('../structures/Login.php');
require('../util/Security.php');
require ('../util/Encryption.php');
require('../util/Logger.php');
$nonceValue = 'nonce_value';

if(!SessionCheck()){
	return;
}

require('Header.php');

function talukaNameFormat($name){
	$name = preg_replace('/[^a-zA-Z0-9_ ]/', '', $name);
	$name = ucwords(strtolower(trim($name)));
	return $name;
}

function formatName($name) {
    if(preg_match('/[^a-zA-Z\s]/', $name)){
        echo "Error : Name contains invalid characters. Only letters and spaces are allowed.";
		exit();
    }
    $name = ucwords(strtolower($name));
    return trim($name);
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

$dbHashedPassword = $row['password'];
if(password_verify($person->getPassword(), $dbHashedPassword)){
if (!isset($_POST["name"]) || !preg_match('/^[A-Za-z0-9 ]+$/', trim($_POST["name"]))) {
    echo "Error : Check Taluka name (only letters, numbers, and spaces allowed, no special characters)";
    exit();
}
$taluka_name = $_POST["name"];
$taluka_name = talukaNameFormat($taluka_name);

$Taluka = new Taluka;
$Taluka->setId(uniqid());
$Taluka->setName($taluka_name);
$query = $Taluka->check($Taluka);
$result = mysqli_query($con, $query);
$numrows = mysqli_num_rows($result);
if($numrows>0){
	echo "Error : Taluka name already exist";
	exit();
}
$query = $Taluka->insert($Taluka);
mysqli_query($con, $query);
mysqli_close($con);

$filteredPost = $_POST;
unset($filteredPost['username'], $filteredPost['password']);
writeLog("User ->" ." Taluka added ->". $_SESSION['user'] . "| Requested JSON -> " . json_encode($filteredPost));


echo "<script>window.location.href = '../Taluka.php';</script>";
	
} 
else{
    echo "Error : Password or Username is incorrect";
}

?>
<?php require('Fullui.php');  ?>