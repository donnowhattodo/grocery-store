<!-- header.php -->

<div class="header">
    <h1>Grocery Store Management System</h1>
    <?php
    // Check if the user is logged in
    // You can modify this condition based on your authentication logic
    $loggedIn = isset($_SESSION['user_id']);

    if ($loggedIn) {
        ?>
        <div class="logout">
            <form action="logout.php" method="post">
                <button type="submit" name="logout">Logout</button>
            </form>
        </div>
        <?php
    }
    ?>
</div>
