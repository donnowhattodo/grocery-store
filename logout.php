<?php
// Start the session (if not already started)
// Include the database connection file
require_once 'db_connection.php';
session_start();

// Unset all session variables
$_SESSION = array();

// Destroy the session
session_destroy();

// Redirect to the login page
header("Location: user_login.php");
exit();
?>
