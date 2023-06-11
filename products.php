<?php
// Include the database connection
require_once 'db_connection.php';

// Function to retrieve the list of products
function getProducts($conn, $category = null) {
    $sql = "SELECT * FROM products";
    
    // Add category filter if provided
    if ($category !== null) {
        $category = $conn->real_escape_string($category);
        $sql .= " WHERE category = '$category'";
    }
    
    $result = $conn->query($sql);

    $products = array();
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $products[] = $row;
        }
    }

    return $products;
}

// Function to add a product to the cart
function addToCart($conn, $productId, $customerId) {
    $sql = "INSERT INTO cart (product_id, customer_id) 
            VALUES ('$productId', '$customerId')";
    $result = $conn->query($sql);

    if ($result) {
        return true;
    } else {
        return false;
    }
}

// Get the list of products based on category filter
$categoryFilter = isset($_GET['category']) ? $_GET['category'] : null;
$products = getProducts($conn, $categoryFilter);

// Handle the form submission for adding a product to the cart
if (isset($_POST['add_to_cart'])) {
    $productId = $_POST['product_id'];
    $customerId = 1; // Replace with the actual customer ID, or retrieve it from the session

    if (addToCart($conn, $productId, $customerId)) {
        $successMsg = "Product added to cart successfully.";
    } else {
        $errorMsg = "Error: Failed to add the product to cart.";
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Products</title>
    <link rel="stylesheet" type="text/css" href="css/styles3.css">
</head>

<body>
    <div class="container">
        <h2>Add Product</h2>
        <form method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>">
            <div class="form-group">
                <label for="product_id">Product ID:</label>
                <input type="text" id="product_id" name="product_id" required>
            </div>
            <div class="form-group">
                <label for="product_name">Product Name:</label>
                <input type="text" id="product_name" name="product_name" required>
            </div>
            <div class="form-group">
                <label for="product_type">Product Type:</label>
                <input type="text" id="product_type" name="product_type" required>
            </div>
            <div class="form-group">
                <label for="product_price">Price per Unit:</label>
                <input type="number" id="product_price" name="product_price" step="0.01" required>
            </div>
            <div class="form-group">
                <label for="product_category">Category:</label>
                <input type="text" id="product_category" name="product_category" required>
            </div>
            <div class="form-group">
                <input type="submit" value="Add Product" name="add_product">
            </div>
        </form>

        <?php if (isset($errorMsg)): ?>
            <p class="error-message"><?php echo $errorMsg; ?></p>
        <?php endif; ?>

        <?php if (isset($successMsg)): ?>
            <p class="success-message"><?php echo $successMsg; ?></p>
        <?php endif; ?>

        <div class="product-list">
            <h2>List of Products</h2>
            <form method="GET" action="<?php echo $_SERVER['PHP_SELF']; ?>">
                <div class="form-group">
                    <label for="category">Filter by Category:</label>
                    <select id="category" name="category">
                        <option value="">All</option>
                        <option value="Automotive" <?php if ($categoryFilter === 'Automotive') echo 'selected'; ?>>Automotive</option>
                        <option value="Baby Products" <?php if ($categoryFilter === 'Baby Products') echo 'selected'; ?>>Baby Products</option>
                        <option value="Bakery" <?php if ($categoryFilter === 'Bakery') echo 'selected'; ?>>Bakery</option>
                        <option value="Baking" <?php if ($categoryFilter === 'Baking') echo 'selected'; ?>>Baking</option>
                        <option value="Beverages" <?php if ($categoryFilter === 'Beverages') echo 'selected'; ?>>Beverages</option>
                        <option value="Books" <?php if ($categoryFilter === 'Books') echo 'selected'; ?>>Books</option>
                        <option value="Canned Goods" <?php if ($categoryFilter === 'Canned Goods') echo 'selected'; ?>>Canned Goods</option>
                        <option value="Cleaning Supplies" <?php if ($categoryFilter === 'Cleaning Supplies') echo 'selected'; ?>>Cleaning Supplies</option>
                        <option value="Clothing" <?php if ($categoryFilter === 'Clothing') echo 'selected'; ?>>Clothing</option>
                        <option value="Condiments" <?php if ($categoryFilter === 'Condiments') echo 'selected'; ?>>Condiments</option>
                        <option value="Dairy" <?php if ($categoryFilter === 'Dairy') echo 'selected'; ?>>Dairy</option>
                        <option value="Frozen Foods" <?php if ($categoryFilter === 'Frozen Foods') echo 'selected'; ?>>Frozen Foods</option>
                        <option value="Gardening and Outdoor" <?php if ($categoryFilter === 'Gardening and Outdoor') echo 'selected'; ?>>Gardening and Outdoor</option>
                        <option value="Grains" <?php if ($categoryFilter === 'Grains') echo 'selected'; ?>>Grains</option>
                        <option value="Health and Beauty" <?php if ($categoryFilter === 'Health and Beauty') echo 'selected'; ?>>Health and Beauty</option>
                        <option value="Home Decor" <?php if ($categoryFilter === 'Home Decor') echo 'selected'; ?>>Home Decor</option>
                        <option value="Household Supplies" <?php if ($categoryFilter === 'Household Supplies') echo 'selected'; ?>>Household Supplies</option>
                        <option value="Meat" <?php if ($categoryFilter === 'Meat') echo 'selected'; ?>>Meat</option>
                        <option value="Office Supplies" <?php if ($categoryFilter === 'Office Supplies') echo 'selected'; ?>>Office Supplies</option>
                        <option value="Pasta" <?php if ($categoryFilter === 'Pasta') echo 'selected'; ?>>Pasta</option>
                        <option value="Pet Supplies" <?php if ($categoryFilter === 'Pet Supplies') echo 'selected'; ?>>Pet Supplies</option>
                        <option value="Personal Care" <?php if ($categoryFilter === 'Personal Care') echo 'selected'; ?>>Personal Care</option>
                        <option value="Produce" <?php if ($categoryFilter === 'Produce') echo 'selected'; ?>>Produce</option>
                        <option value="Seafood" <?php if ($categoryFilter === 'Seafood') echo 'selected'; ?>>Seafood</option>
                        <option value="Snacks" <?php if ($categoryFilter === 'Snacks') echo 'selected'; ?>>Snacks</option>
                        <option value="Spices" <?php if ($categoryFilter === 'Spices') echo 'selected'; ?>>Spices</option>
                        <option value="Sports and Fitness" <?php if ($categoryFilter === 'Sports and Fitness') echo 'selected'; ?>>Sports and Fitness</option>
                        <option value="Sweets" <?php if ($categoryFilter === 'Sweets') echo 'selected'; ?>>Sweets</option>
                        <option value="Tools and Hardware" <?php if ($categoryFilter === 'Tools and Hardware') echo 'selected'; ?>>Tools and Hardware</option>
                    </select>

                    <input type="submit" value="Filter">
                </div>
            </form>
            
            <?php if (!empty($products)): ?>
                <table>
                    <tr>
                        <th>Product ID</th>
                        <th>Name</th>
                        <th>Product Type</th>
                        <th>Price per Unit</th>
                        <th>Category</th>
                        <th>Action</th>
                    </tr>
                    <?php foreach ($products as $product): ?>
                        <tr>
                            <td><?php echo $product['product_id']; ?></td>
                            <td><?php echo $product['name']; ?></td>
                            <td><?php echo $product['uom_id']; ?></td>
                            <td><?php echo $product['price_unit']; ?></td>
                            <td><?php echo $product['category']; ?></td>
                            <td>
                                <form method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>">
                                    <input type="hidden" name="product_id" value="<?php echo $product['product_id']; ?>">
                                    <input type="submit" value="Add to Cart" name="add_to_cart">
                                </form>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </table>
            <?php else: ?>
                <p>No products available.</p>
            <?php endif; ?>
        </div>
    </div>
</body>
</html>
