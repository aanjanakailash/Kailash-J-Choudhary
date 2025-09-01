<?php
require('connection.inc.php');
require('functions.inc.php');
$email=get_safe_value($con,$_POST['email']);
$added_on=date('Y-m-d h:i:s');
mysqli_query($con,"insert into subscribe(email,added_on) values('$email','$added_on')");
echo "Thank you";
?>