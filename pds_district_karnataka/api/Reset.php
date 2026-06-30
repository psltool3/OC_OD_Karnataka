<?php
require('../util/Connection.php');
require('../structures/Login.php');
require('../util/Security.php');
require ('../util/Encryption.php');
$nonceValue = 'nonce_value';



$person = new Login;
$Encryption = new Encryption();

$person->setUsername($_POST["username"]);
$person->setPassword($Encryption->decrypt($_POST["oldpassword"], $nonceValue));
$newpassword = $Encryption->decrypt($_POST["newpassword"], $nonceValue);
$confirmpassword = $Encryption->decrypt($_POST["confirmpassword"], $nonceValue);

if ($newpassword == "" || $confirmpassword == "") {
    echo "Error: Password is Empty";
    return;
}

if ($newpassword != $confirmpassword) {
    echo "Error: Both Passwords don't match";
    return;
}

// Validate password strength
$pattern = '/^(?=.*[A-Z])(?=.*[\W_]).{8,}$/';
if (!preg_match($pattern, $newpassword)) {
    echo "Error: Password must be at least 8 characters long, contain at least one uppercase letter, and one special character.";
    return;
}

$query = "SELECT * FROM login WHERE username='".$person->getUsername()."'";
$result = mysqli_query($con, $query);

if (!$result) {
    echo "Error: " . mysqli_error($con);
    exit;
}

$row = mysqli_fetch_assoc($result);

if (!$row) {
    echo "Error: User not found";
    exit;
}

$dbHashedPassword = $row['password'];

if (password_verify($person->getPassword(), $dbHashedPassword)) {
    $newhashedPassword = password_hash($newpassword, PASSWORD_DEFAULT);
    echo "New Hashed Password: " . $newhashedPassword . "<br/>";
    echo "Username: " . $person->getUsername() . "<br/>";

    $query1 = "UPDATE login SET password='$newhashedPassword' WHERE username='".$person->getUsername()."'";

    $updateResult = mysqli_query($con, $query1);

    if (!$updateResult) {
        echo "Error updating password: " . mysqli_error($con);
    } else {
        echo "Password updated successfully.";
    }

    mysqli_close($con);
    
    echo "<script>window.location.href = '../AdminLogin.html';</script>";
} else {
    echo "Error: Password or Username is incorrect";
}
?>
<?php require('Fullui.php'); ?>
