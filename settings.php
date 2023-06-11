<?php
session_start();

// Check if the user is logged in
if (!isset($_SESSION['admin_id'])) {
    // Redirect to the login page if not logged in
    header("Location: login.php");
    exit();
}

// Include your database connection code here
require_once 'db_connection.php';

// Handle password update
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['update_password'])) {
    $admin_id = $_SESSION['admin_id'];
    $new_password = $_POST['new_password'];

    // Update the password in the database
    // Write your database update code here
    // ...

    // Redirect to the settings page with a success message
    header("Location: settings.php?success=password_updated");
    exit();
}

// Handle account deletion
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['delete_account'])) {
    $admin_id = $_SESSION['admin_id'];

    // Delete the account from the database
    // Write your database delete code here
    // ...

    // Destroy the session and redirect to the login page
    session_destroy();
    header("Location: login.php");
    exit();
}

// Handle logout
if (isset($_GET['logout'])) {
    // Destroy the session and redirect to the login page
    session_destroy();
    header("Location: login.php");
    exit();
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Settings</title>
    <link rel="stylesheet" type="text/css" href="css/set.css">
</head>
<body>
    <h1>Settings</h1>

    <?php if (isset($_GET['success']) && $_GET['success'] === 'password_updated'): ?>
        <p>Password updated successfully!</p>
    <?php endif; ?>

    <h2>Update Password</h2>
    <form method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>">
        <label for="new_password">New Password:</label>
        <input type="password" name="new_password" id="new_password" required><br>
        <input type="submit" name="update_password" value="Update Password">
    </form>

    <h2>Delete Account</h2>
    <form method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>" onsubmit="return confirm('Are you sure you want to delete your account? This action cannot be undone.');">
        <input type="submit" name="delete_account" value="Delete Account">
    </form>

    <h2>Logout</h2>
    <a href="settings.php?logout=true">Logout</a>
</body>
</html>

