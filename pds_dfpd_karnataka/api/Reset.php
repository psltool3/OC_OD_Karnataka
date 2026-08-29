<?php
session_start();
require('../util/Connection.php');
require('../structures/Login.php');
require('../util/Security.php');
require('../util/Encryption.php');
$nonceValue = 'nonce_value';

if (
    !isset($_POST['captchainput'], $_SESSION['captcha']) ||
    $_SESSION['captcha'] !== $_POST['captchainput']
) {
    echo "<script>alert('Please check captcha.'); window.location.href = '../Reset.html';</script>";
    exit;
}

$person = new Login;
$Encryption = new Encryption();

$person->setUsername($_POST["username"]);
$person->setPassword($Encryption->decrypt($_POST["oldpassword"], $nonceValue));
$newpassword = $Encryption->decrypt($_POST["newpassword"], $nonceValue);
$confirmpassword = $Encryption->decrypt($_POST["confirmpassword"], $nonceValue);

if ($newpassword == "" || $confirmpassword == "") {
    echo "<script>alert('Error: Password is Empty'); window.location.href = '../Reset.html';</script>";
    exit;
}

if ($newpassword != $confirmpassword) {
    echo "<script>alert('Error: Both Passwords don\'t match'); window.location.href = '../Reset.html';</script>";
    exit;
}

// Validate password strength
$pattern = '/^(?=.*[A-Z])(?=.*[\W_]).{8,}$/';
if (!preg_match($pattern, $newpassword)) {
    echo "<script>alert('Error: Password must be at least 8 characters long, contain at least one uppercase letter, and one special character.'); window.location.href = '../Reset.html';</script>";
    exit;
}

$query = "SELECT * FROM login WHERE username='".mysqli_real_escape_string($con, $person->getUsername())."'";
$result = mysqli_query($con, $query);

if (!$result) {
    echo "Error: " . mysqli_error($con);
    exit;
}

$row = mysqli_fetch_assoc($result);

if (!$row) {
    echo "<script>alert('Error: User not found'); window.location.href = '../Reset.html';</script>";
    exit;
}

$dbHashedPassword = $row['password'];

if (password_verify($person->getPassword(), $dbHashedPassword)) {
    $newhashedPassword = password_hash($newpassword, PASSWORD_DEFAULT);

    $query1 = "UPDATE login SET password='$newhashedPassword' WHERE username='".mysqli_real_escape_string($con, $person->getUsername())."'";

    $updateResult = mysqli_query($con, $query1);

    if (!$updateResult) {
        echo "Error updating password: " . mysqli_error($con);
    } else {
        echo "<script>alert('Password updated successfully.'); window.location.href = '../Login.html';</script>";
    }

    mysqli_close($con);
} else {
    echo "<script>alert('Error: Current Password or Username is incorrect'); window.location.href = '../Reset.html';</script>";
}
?>