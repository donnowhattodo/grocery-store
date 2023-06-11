<!DOCTYPE html>
<html>
<head>
  <title>User Registration</title>
  <link rel="stylesheet" type="text/css" href="css/reg.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
  <h2>User Registration</h2>
  <form method="POST" action="register.php">
    <label for="name">Name:</label>
    <input type="text" id="name" name="name" required><br>
    <label for="phone">Phone Number:</label>
    <input type="text" id="phone" name="phone" required><br>
    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required><br>
    <input type="submit" value="Register">
  </form>

  <script>
    $(document).ready(function() {
      $('form').submit(function(event) {
        event.preventDefault();
        var name = $('#name').val();
        var phone = $('#phone').val();
        var password = $('#password').val();
        $.ajax({
          url: 'register.php',
          method: 'POST',
          data: {
            name: name,
            phone: phone,
            password: password
          },
          success: function(response) {
            alert(response);
            $('form')[0].reset();
          }
        });
      });
    });
  </script>
</body>
</html>
