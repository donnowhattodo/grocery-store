<?php
// Include the database connection and functions
require_once 'db_connection.php';

// Function to calculate the price of a product based on uom_id and price
function calculatePrice($conn, $uomId, $price) {
    $sql = "SELECT uom_name FROM uom WHERE uom_id = '$uomId'";
    $result = $conn->query($sql);
    
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $uomName = $row['uom_name'];
        
        return "Price per $uomName: $price";
    }
    
    return "";
}

// Function to save the buying history of a customer
function saveBuyingHistory($conn, $customerId, $productId, $quantity, $totalPrice) {
    $date = date("Y-m-d");
    $time = date("H:i:s");
    
    $sql = "INSERT INTO orders (customer_id, date, time, total) 
            VALUES ('$customerId', '$date', '$time', '$totalPrice')";
    $conn->query($sql);
    $orderId = $conn->insert_id;
    
    $sql = "INSERT INTO order_details (order_id, product_id, quantity, total_price) 
            VALUES ('$orderId', '$productId', '$quantity', '$totalPrice')";
    $conn->query($sql);
}

// Get the product details and perform the transaction
if (isset($_POST['buy'])) {
    $customerId = $_POST['customer_id'];
    $productId = $_POST['product_id'];
    $quantity = $_POST['quantity'];
    
    $sql = "SELECT price_unit, uom_id FROM products WHERE product_id = '$productId'";
    $result = $conn->query($sql);
    
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $price = $row['price_unit'];
        $uomId = $row['uom_id'];
        
        $totalPrice = $price * $quantity;
        
        saveBuyingHistory($conn, $customerId, $productId, $quantity, $totalPrice);
        
        $successMsg = "Transaction completed successfully.";
    } else {
        $errorMsg = "Error: Product not found.";
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Transaction</title>
    <link rel="stylesheet" type="text/css" href="css/styles1.css">
</head>
<body>
    <div class="navbar">
        <?php include 'Top_navbar.php'; ?>
    </div>
    <div class="content">
        <?php //include 'header.php'; ?>
        <div class="container">
            <h2>Transaction</h2>
            <form method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>">
                <div class="form-group">
                    <label for="customer_id">Customer ID:</label>
                    <input type="text" id="customer_id" name="customer_id" required>
                </div>
                <div class="form-group">
                    <label for="product_id">Product ID:</label>
                    <input type="text" id="product_id" name="product_id" required>
                </div>
                <div class="form-group">
                    <label for="quantity">Quantity:</label>
                    <input type="number" id="quantity" name="quantity" required>
                </div>
                <div class="form-group">
                    <input type="submit" value="Buy" name="buy">
                </div>
            </form>

            <?php if (isset($errorMsg)): ?>
                <p class="error-message"><?php echo $errorMsg; ?></p>
            <?php endif; ?>

            <?php if (isset($successMsg)): ?>
                <p class="success-message"><?php echo $successMsg; ?></p>
            <?php endif; ?>
        </div>
    </div>
</body>
</html>
