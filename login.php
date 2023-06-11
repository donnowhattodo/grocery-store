<?php
session_start();
require_once('db_connection.php');

// If redirected from login.php
if (isset($_POST['username'])) {
    $username = $connect->real_escape_string($_POST['username']);
    $password = md5($_POST['password']);

    // Check login credentials
    $loginQuery = $connect->query("SELECT * FROM admin
                                    WHERE username = '{$username}' AND password = '{$password}'");
    if ($loginQuery && $loginQuery->num_rows >= 1) {
        $adminData = $loginQuery->fetch_array();
        $_SESSION['username'] = $username;
        $_SESSION['admin_id'] = $adminData['admin_id'];
        $_SESSION['user_id'] = $adminData['admin_id'];

        $_SESSION['transaction'] = 0;
        if ($adminData['admin'] == 1) $_SESSION['admin'] = 1;
        if ($adminData['admin'] == 2) $_SESSION['admin'] = 2;
    } else {
        $temp = 1;
    }
    if (isset($_SESSION['username'])) {
        header("Location: home.php");
        exit();
    }
}
?>


<html>
    <head>
        <title>Supermarket Management</title>        
        <link rel="stylesheet" type="text/css" href="css1/outline.css" />
        <link rel="stylesheet" type="text/css" href="css1/menu.css" />		
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
        <script type="text/javascript" src="js/design.js"></script>
        <script type="text/javascript" src="js/validate.js"></script>
    </head>

<body>
<div class="container">

<div id="body">
	<div align="center">
    <a href='index.php'><img src="images/logo.png" width="95" height="95" alt='Logo' /></a>
	  <?php //include_once("include/left_content.php"); ?>
    </div>
	<div class="mcontent">
    <div align="center">
        <strong>Login<br></strong>
        <div id="data">
          <div align="center">
            <?php if(isset($_SESSION['username'])){
								echo "You are logged in."; }
			  				 else{
								 if(isset($temp)) echo"Incorrect Username or Password";
								echo"<form method='post' action='login.php'><table>
					  				 <tr><td style='padding:5px' >Username:</td><td style='padding:5px' ><input type='text' name='username' placeholder='Username' /></td></tr>
					  				 <tr><td style='padding:5px' >Password:</td><td style='padding:5px' ><input type='password' name='password' placeholder='password' /></td></tr>
					   				 <tr><td colspan='2' style='padding:5px;' ><input type='submit' value='Login' /></td></tr></table>
									 </form>";
			  					 }
			  		   ?>
          </div>
        </div>
    </div>
</div>
<div align="center"><!-- body ends -->
</div>
<?php 
//	require_once("include/footer.php");
?>