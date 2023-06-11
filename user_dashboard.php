<!DOCTYPE html>
<html>
<head>
  <title>User Dashboard</title>
  <link rel="stylesheet" type="text/css" href="css/usdas.css">
</head>
<body>
  <div class="container">
    <div class="profile">
      <h2>Welcome, <?php echo $user['customer_name']; ?></h2>
      <p>Phone Number: <?php echo $user['customer_phone_number']; ?></p>
      <p>Email: <?php echo $user['customer_email']; ?></p>
    </div>

    <div class="dashboard">
      <h2>User Dashboard</h2>

      <div class="button-container">
        <a href="user_dashboard.php" class="btn">Home</a>
        <a href="user_dashboard.php?action=profile" class="btn">Profile</a>
        <a href="user_dashboard.php?action=orders" class="btn">Orders</a>
        <a href="user_dashboard.php?action=settings" class="btn">Settings</a>
        <a href="logout.php" class="btn btn-danger">Logout</a>
      </div>

      <?php
      if ($action === 'profile') {
        include 'profile.php';
      } elseif ($action === 'orders') {
        include 'orders.php';
      } elseif ($action === 'settings') {
        include 'settings.php';
      } else {
        include 'home.php';
      }
      ?>
    </div>
  </div>
</body>
</html>
