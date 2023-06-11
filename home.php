<?php
// Check if the user's name is set
require_once 'db_connection.php';
if (isset($_GET['name'])) {
    $name = $_GET['name'];
} else {
    $name = "Guest";
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Welcome</title>
    <link rel="stylesheet" type="text/css" href="css/home.css">
</head>
<body>
    <div class="navbar">
        <a href="home.php">Home</a>
        <a href="dashboard.php">Dashboard</a>
        <a href="employee.php">Employee</a>
        <a href="products.php">Products</a>
        <a href="customers.php">Customers</a>
        <a href="transactions.php">Transaction</a>
        <a href="cart.php">Cart</a>
        <a href="settings.php">Settings</a>
    </div>

    <div class="container">
        <div class="content">
            <h1>Welcome, <?php echo $name; ?>!</h1>
            <p>Thank you for visiting our website.</p>
        </div>
    </div>
</body>
</html>
