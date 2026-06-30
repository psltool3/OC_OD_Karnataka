<?php

require('../util/Connection.php');
require('../structures/Taluka.php');
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
$Taluka = new Taluka;

$Taluka->setName(formatName(str_replace("'","",$_POST['name'])));
$Taluka->setId(str_replace("'","",$_POST['uid']));

$query = $Taluka->update($Taluka);
$result = mysqli_query($con,$query);

mysqli_close($con);

if($result){
	$filteredPost = $_POST;
	unset($filteredPost['username'], $filteredPost['password']);
	writeLog("User ->" ." Taluka Name Edit->". $_SESSION['user'] . "| Requested JSON -> " . json_encode($filteredPost));
	// header("Location:../Taluka.php");
	echo "<script>window.location.href = '../Taluka.php';</script>";
}
else{
   echo "Error : in update";
}
} 
else{
    echo "Error : Password or Username is incorrect";
}

?>
<?php require('Fullui.php');  ?>