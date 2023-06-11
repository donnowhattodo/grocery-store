<?php
// Include the database connection and functions
require_once ("include/connection.php");

// Fetch all customers from the database or search by name
if (isset($_GET['search'])) {
    $search = $_GET['search'];
    $sql = "SELECT * FROM customer WHERE customer_name LIKE '%$search%'";
} else {
    $sql = "SELECT * FROM customer";
}
$result = $conn->query($sql);

// Array to store the customers
$customers = [];

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $customers[] = $row;
    }
}

// Function to get the transaction history of a customer
function getTransactionHistory($conn, $customerId) {
    $sql = "SELECT * FROM orders WHERE customer_id = '$customerId'";
    $result = $conn->query($sql);
    
    $history = [];
    
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $history[] = $row;
        }
    }
    
    return $history;
}

// Handle form submission to add a new customer
if (isset($_POST['add_customer'])) {
    $phone_number = $_POST['phone_number'];
    $name = $_POST['name'];
    $password = $_POST['password'];

    $sql = "INSERT INTO customer (customer_phone_number, customer_name, customer_password) 
            VALUES ('$phone_number', '$name', '$password')";

    if ($conn->query($sql) === TRUE) {
        $successMsg = "Customer added successfully.";
    } else {
        $errorMsg = "Error: " . $conn->error;
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Customer Management</title>
    <link rel="stylesheet" type="text/css" href="css/styles3.css">
</head>
<body>

    <?php //include 'top_navbar.php'; ?>
    <div class="container">
        <h2>Customer Management</h2>

        <?php if (isset($errorMsg)): ?>
            <p class="error-message"><?php echo $errorMsg; ?></p>
        <?php endif; ?>

        <?php if (isset($successMsg)): ?>
            <p class="success-message"><?php echo $successMsg; ?></p>
        <?php endif; ?>

        <h3>Add New Customer</h3>
        <div class="form-group">
            <form method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>">
                <label for="phone_number">Phone Number:</label>
                <input type="text" id="phone_number" name="phone_number" required>

                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>

                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>

                <input type="submit" value="Add Customer" name="add_customer">
            </form>
        </div>

        <h3>Customers</h3>
        <form method="GET" action="<?php echo $_SERVER['PHP_SELF']; ?>">
            <div class="form-group">
                <label for="search">Search by Name:</label>
                <input type="text" id="search" name="search" placeholder="Enter customer name">
                <input type="submit" value="Search">
            </div>
        </form>

        <?php if (!empty($customers)): ?>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Phone Number</th>
                        <th>Name</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($customers as $customer): ?>
                        <tr>
                            <td><?php echo $customer['customer_id']; ?></td>
                            <td><?php echo $customer['customer_phone_number']; ?></td>
                            <td><?php echo $customer['customer_name']; ?></td>
                            <td>
                                <a href="customer_details.php?id=<?php echo $customer['customer_id']; ?>">View Details</a>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        <?php else: ?>
            <p>No customers found.</p>
        <?php endif; ?>
    </div>
</body>
</html>
