<?php
session_start();
require_once('db_connection.php');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $conn->real_escape_string($_POST['username']);
    $password = md5($_POST['password']);

    // Check login credentials
    $query = "SELECT * FROM users WHERE username = '{$username}' AND password = '{$password}'";
    $result = $conn->query($query);

    if ($result && $result->num_rows === 1) {
        $userData = $result->fetch_assoc();
        $_SESSION['username'] = $username;
        $_SESSION['user_id'] = $userData['user_id'];
        
        // Redirect to the home page or any other authorized page
        header("Location: home.php");
        exit();
    } else {
        echo "Invalid username or password.";
    }
}
?>
<!-- login.html -->
<!DOCTYPE html>
<html>
<head>
    <title>User Login</title>
</head>
<body>
    <h2>User Login</h2>
    <form action="login.php" method="POST">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br><br>
        <input type="submit" value="Login">
    </form>
</body>
</html>
