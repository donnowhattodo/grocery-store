<?php
// Start the session (if not already started)
// Include the database connection file
require_once 'db_connection.php';
session_start();

// Check if the user is not logged in
if (!isset($_SESSION['is_logged_in']) || $_SESSION['is_logged_in'] !== true) {
    // Redirect to the login page
    header("Location: user_login.php");
    exit();
}

// The user is logged in, display the dashboard or any other content
?>

<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
</head>
<body>
    <h1>Welcome to the Dashboard</h1>
    <p>Hello, <?php echo $_SESSION['username']; ?>!</p>
    <a href="logout.php">Logout</a>
</body>
</html>
