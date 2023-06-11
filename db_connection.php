
<?php
// db_connection.php

$host = 'localhost';
$username = 'root';
$password = '';
$database = 'grocery311';

$connect = mysqli_connect($host, $username, $password, $database);

if ($connect->connect_error) {
    die("Connection failed: " . $connect->connect_error);
}
?>
