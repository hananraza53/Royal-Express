<?php
session_start();
include '../server/inc/connection.php'; // ✅ correct path

$message = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = mysqli_real_escape_string($con, $_POST['email']);
    $newPassword = mysqli_real_escape_string($con, $_POST['new_password']);
    $confirmPassword = mysqli_real_escape_string($con, $_POST['confirm_password']);

    if ($newPassword !== $confirmPassword) {
        $message = "❌ Passwords do not match!";
    } else {
        $check = mysqli_query($con, "SELECT * FROM customer WHERE email='$email'");
        if (mysqli_num_rows($check) > 0) {
            // ⚠️ Save password directly (NOT hashed)
            $update = mysqli_query($con, "UPDATE customer SET password='$newPassword' WHERE email='$email'");
            if ($update) {
                $message = "✅ Password updated successfully! <a href='login.php'>Login now</a>";
            } else {
                $message = "❌ Something went wrong. Please try again.";
            }
        } else {
            $message = "⚠️ No account found with this email.";
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">

    <?php include 'pages/head.php'; ?>


<head>
  <meta charset="UTF-8">
  <title>Forgot Password</title>
  <style>
    body { font-family: Arial, sans-serif; background: #f4f4f4; }
    .card { width: 400px; margin: 80px auto; padding: 20px; background: white; border-radius: 10px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); }
    input { width: 100%; padding: 10px; margin: 8px 0; border-radius: 6px; border: 1px solid #ccc; }
    button { width: 100%; padding: 12px; background: rgb(69,69,185); color: white; border: none; border-radius: 8px; cursor: pointer; }
    .message { margin-top: 15px; font-size: 14px; color: #333; }
  </style>
</head>
<body>


  <div class="card">
    <h2>Reset Password</h2>
    <form method="POST">
      <label>Email</label>
      <input type="email" name="email" required placeholder="Enter your registered email">

      <label>New Password</label>
      <input type="password" name="new_password" required placeholder="Enter new password">

      <label>Confirm Password</label>
      <input type="password" name="confirm_password" required placeholder="Confirm new password">

      <button type="submit">Update Password</button>
    </form>
    <div class="message"><?php echo $message; ?></div>
    <p><a href="login.php">🔙 Back to Login</a></p>
  </div>
</body>
</html>
