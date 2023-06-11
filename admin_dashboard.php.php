<!DOCTYPE html>
<html>
<head>
  <title>User Dashboard</title>
  <link rel="stylesheet" type="text/css" href="css/addas.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
    // JavaScript code
    $(document).ready(function() {
      // Change password button click event
      $('#change-password-btn').click(function() {
        $('.change-password-form').toggle();
      });
    });
  </script>
</head>
<body>
  <?php
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "";

    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Retrieve user information from the database
    $sql = "SELECT * FROM customer WHERE customer_id = 1"; // Assuming user ID 1 for demonstration purposes
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // Output user information
        while ($row = $result->fetch_assoc()) {
            $name = $row["customer_name"];
            $phone = $row["customer_phone_number"];

            echo "<div class='container'>";
            echo "<div class='profile'>";
            echo "<h2>User Profile</h2>";
            echo "<p><strong>Name:</strong> $name</p>";
            echo "<p><strong>Phone:</strong> $phone</p>";
            echo "<div class='button-container'>";
            echo "<button id='change-password-btn'>Change Password</button>";
            echo "</div>";
            echo "</div>";

            // Change password form
            echo "<div class='change-password-form'>";
            echo "<h2>Change Password</h2>";
            echo "<form method='POST' action='change_password.php'>";
            echo "<label for='current-password'>Current Password:</label>";
            echo "<input type='password' id='current-password' name='current-password' required>";
            echo "<label for='new-password'>New Password:</label>";
            echo "<input type='password' id='new-password' name='new-password' required>";
            echo "<input type='submit' value='Update Password'>";
            echo "</form>";
            echo "</div>";

            echo "<div class='dashboard'>";
            echo "<h2>User Dashboard</h2>";
            // Display user's dashboard content here
            echo "</div>";
            echo "</div>";
        }
    }

    $conn->close();
  ?>
</body>
</html>
