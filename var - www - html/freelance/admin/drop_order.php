<?php

require("./../mysqli_info.php");
$mysqli = new mysqli($host, $user, $password, $db_name);
$mysqli->query("DELETE FROM `orders` WHERE `orders`.`id_order` = ".$_POST['id_order']);
$mysqli->close();
print_r($_POST);