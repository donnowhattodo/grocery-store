<?php
// Include the database connection file and other required files
require_once 'db_connection.php';
//require_once 'top_navbar.php';

// Start the session (if not already started)
session_start();

// Check if the customer ID is stored in the session
if (isset($_SESSION['customer_id'])) {
    $customerId = $_SESSION['customer_id'];
} else {
    // Redirect the user to the login page or set the customer ID by any other means
    // Example: header("Location: login.php");
    // Replace the following line with the appropriate code to set the customer ID
    $customerId = 1; // Replace with the actual customer ID
}

// Store the customer ID in the session
$_SESSION['customer_id'] = $customerId;

// Function to calculate the total price of the cart
function calculateCartTotal($conn, $customerId) {
    $sql = "SELECT SUM(total_price) AS cart_total FROM cart WHERE customer_id = '$customerId'";
    $result = $conn->query($sql);
    $row = $result->fetch_assoc();
    return $row['cart_total'];
}

// Handle the form submission for adding a product to the cart
if (isset($_POST['add_to_cart'])) {
    $customerId = $_POST['customer_id'];
    $productId = $_POST['product_id'];
    $quantity = $_POST['quantity'];

    // Check if the product is already in the cart for the customer
    $sql = "SELECT * FROM cart WHERE customer_id = '$customerId' AND product_id = '$productId'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // Update the quantity of the existing cart item
        $row = $result->fetch_assoc();
        $cartId = $row['cart_id'];
        $newQuantity = $row['quantity'] + $quantity;
        $newTotalPrice = $row['total_price'] + ($row['total_price'] / $row['quantity']) * $quantity;

        $updateSql = "UPDATE cart SET quantity = '$newQuantity', total_price = '$newTotalPrice' WHERE cart_id = '$cartId'";
        $conn->query($updateSql);

        $successMsg = "Product quantity updated in the cart.";
    } else {
        // Insert the new cart item
        $sql = "INSERT INTO cart (customer_id, product_id, quantity, total_price) VALUES ('$customerId', '$productId', '$quantity', 0)";
        $conn->query($sql);

        $successMsg = "Product added to the cart.";
    }

    header("Location: shopping_cart.php");
    exit();
}

// Handle the form submission for removing a product from the cart
if (isset($_POST['remove_from_cart'])) {
    $cartId = $_POST['cart_id'];

    // Delete the cart item
    $sql = "DELETE FROM cart WHERE cart_id = '$cartId'";
    $conn->query($sql);

    $successMsg = "Product removed from the cart.";

    header("Location: shopping_cart.php");
    exit();
}

// Handle the form submission for updating the quantity of a product in the cart
if (isset($_POST['update_quantity'])) {
    $cartId = $_POST['cart_id'];
    $newQuantity = $_POST['quantity'];

    // Update the quantity and total price of the cart item
    $sql = "UPDATE cart SET quantity = '$newQuantity', total_price = (price_unit * '$newQuantity') WHERE cart_id = '$cartId'";
    $conn->query($sql);

    $successMsg = "Product quantity updated in the cart.";

    header("Location: shopping_cart.php");
    exit();
}

// Handle the form submission for placing an order
if (isset($_POST['place_order'])) {
    $customerId = $_POST['customer_id'];

    // Calculate the final price of the cart
    $cartTotal = calculateCartTotal($conn, $customerId);

    // Insert the order into the orders table
    $insertOrderSql = "INSERT INTO orders (customer_id, date, time, total) VALUES ('$customerId', CURDATE(), CURTIME(), '$cartTotal')";
    $conn->query($insertOrderSql);

    // Get the order ID of the newly inserted order
    $orderId = $conn->insert_id;

    // Retrieve the cart items for the customer
    $cartSql = "SELECT * FROM cart WHERE customer_id = '$customerId'";
    $cartResult = $conn->query($cartSql);

    // Loop through the cart items and insert them into the order_details table
    while ($cartItem = $cartResult->fetch_assoc()) {
        $productId = $cartItem['product_id'];
        $quantity = $cartItem['quantity'];
        $totalPrice = $cartItem['total_price'];

        $insertOrderDetailsSql = "INSERT INTO order_details (order_id, product_id, quantity, total_price) VALUES ('$orderId', '$productId', '$quantity', '$totalPrice')";
        $conn->query($insertOrderDetailsSql);
    }

    // Clear the cart for the customer
    $clearCartSql = "DELETE FROM cart WHERE customer_id = '$customerId'";
    $conn->query($clearCartSql);

    $successMsg = "Order placed successfully. Total amount: $" . $cartTotal;

    header("Location: shopping_cart.php");
    exit();
}

// Get the cart items for the customer
$sql = "SELECT cart.cart_id, products.name, cart.quantity, cart.total_price
        FROM cart
        INNER JOIN products ON cart.product_id = products.product_id
        WHERE cart.customer_id = '$customerId'";
$result = $conn->query($sql);
$cartItems = $result->fetch_all(MYSQLI_ASSOC);

// Close the database connection
$conn->close();
?>

<!DOCTYPE html>
<html>
<head>
    <title>Shopping Cart</title>
    <link rel="stylesheet" type="text/css" href="css/styles4.css">
</head>
<body>
    <?php // include 'top_navbar.php'; ?>

    <h1>Shopping Cart</h1>

    <?php if (isset($successMsg)): ?>
        <p><?php echo $successMsg; ?></p>
    <?php endif; ?>

    <?php if (empty($cartItems)): ?>
        <p>Your cart is empty.</p>
    <?php else: ?>
        <table>
            <tr>
                <th>Product</th>
                <th>Quantity</th>
                <th>Total Price</th>
                <th>Action</th>
            </tr>
            <?php foreach ($cartItems as $cartItem): ?>
                <tr>
                    <td><?php echo $cartItem['name']; ?></td>
                    <td>
                        <form method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>">
                            <input type="hidden" name="cart_id" value="<?php echo $cartItem['cart_id']; ?>">
                            <input type="number" name="quantity" value="<?php echo $cartItem['quantity']; ?>" min="1" required>
                            <input type="submit" value="Update" name="update_quantity">
                        </form>
                    </td>
                    <td><?php echo $cartItem['total_price']; ?></td>
                    <td>
                        <form method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>">
                            <input type="hidden" name="cart_id" value="<?php echo $cartItem['cart_id']; ?>">
                            <input type="submit" value="Remove" name="remove_from_cart">
                        </form>
                    </td>
                </tr>
            <?php endforeach; ?>
            <tr>
                <td colspan="2"></td>
                <td>Total: <?php echo calculateCartTotal($conn, $customerId); ?></td>
                <td>
                    <form method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>">
                        <input type="hidden" name="customer_id" value="<?php echo $customerId; ?>">
                        <input type="submit" value="Place Order" name="place_order">
                    </form>
                </td>
            </tr>
        </table>
    <?php endif; ?>

    <h3>Add Product to Cart</h3>
    <form method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>">
        <input type="hidden" name="customer_id" value="<?php echo $customerId; ?>">
        <label for="product_id">Product ID:</label>
        <input type="number" name="product_id" required>
        <label for="quantity">Quantity:</label>
        <input type="number" name="quantity" value="1" min="1" required>
        <input type="submit" value="Add to Cart" name="add_to_cart">
    </form>
</body>
</html>
