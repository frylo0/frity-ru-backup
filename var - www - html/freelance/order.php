<?php
require('./mysqli_info.php');
$mysqli = new mysqli($host, $user, $password, $db_name);

$insert_new_order_SQL = "INSERT INTO `orders` (`id_order`, `order_name`, `order_contact`, `order_datetime`) VALUES (NULL, '".$_POST['name']."', '".$_POST['contact']."', CURRENT_TIME());";

$mysqli->set_charset('utf8');
$mysqli->query($insert_new_order_SQL);

$mysqli->close();
header('location: order_ok.html');