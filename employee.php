<?php
// Include the database connection and functions
require_once 'db_connection.php';

// Function to fetch all workers from the admin table
function getAllWorkers($conn) {
    $sql = "SELECT * FROM admin";
    $result = $conn->query($sql);

    $workers = [];
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $workers[] = $row;
        }
    }
    return $workers;
}

// Function to add an employee
function addEmployee($conn, $name, $email, $phone) {
    $sql = "INSERT INTO admin (Name, Email, Phone_Number) 
            VALUES ('$name', '$email', '$phone')";
    $result = $conn->query($sql);

    if ($result) {
        return true;
    } else {
        return false;
    }
}

// Function to search employees by name
function searchEmployees($conn, $name) {
    $sql = "SELECT * FROM admin WHERE Name LIKE '%$name%'";
    $result = $conn->query($sql);

    $employees = [];
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $employees[] = $row;
        }
    }
    return $employees;
}

// Handle the form submission for adding an employee
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['add_employee'])) {
        $name = $_POST['name'];
        $email = $_POST['email'];
        $phone = $_POST['phone'];

        if (addEmployee($conn, $name, $email, $phone)) {
            $successMsg = "Employee added successfully.";
        } else {
            $errorMsg = "Error: Failed to add the employee.";
        }
    }
}

// Handle the form submission for searching employees
if (isset($_POST['search_employee'])) {
    $searchName = $_POST['search_name'];
    $employees = searchEmployees($conn, $searchName);
} else {
    // Get all workers
    $employees = getAllWorkers($conn);
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Employee Management</title>
    <link rel="stylesheet" type="text/css" href="css/styles3.css">
</head>
<body>
    <?php //include 'top_navbar.php'; ?>

    <div class="container">
        <h2>Employee Management</h2>

        <h3>Add Employee</h3>
        <form method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>
            </div>

            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>

            <div class="form-group">
                <label for="phone">Phone:</label>
                <input type="text" id="phone" name="phone" required>
            </div>

            <div class="form-group">
                <input type="submit" value="Add Employee" name="add_employee">
            </div>
        </form>

        <h3>Search Employee</h3>
        <form method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>">
            <div class="form-group">
                <label for="search_name">Employee Name:</label>
                <input type="text" id="search_name" name="search_name" required>
            </div>

            <div class="form-group">
                <input type="submit" value="Search" name="search_employee">
            </div>
        </form>

        <h3>Available Workers</h3>
        <?php if (!empty($employees)): ?>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone Number</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($employees as $employee): ?>
                        <tr>
                            <td><?php echo $employee['admin_id']; ?></td>
                            <td><?php echo $employee['Name']; ?></td>
                            <td><?php echo $employee['Email']; ?></td>
                            <td><?php echo $employee['Phone_Number']; ?></td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        <?php else: ?>
            <p>No employees found.</p>
        <?php endif; ?>

        <?php if (isset($errorMsg)): ?>
            <p class="error-message"><?php echo $errorMsg; ?></p>
        <?php endif; ?>

        <?php if (isset($successMsg)): ?>
            <p class="success-message"><?php echo $successMsg; ?></p>
        <?php endif; ?>
    </div>
</body>
</html>
