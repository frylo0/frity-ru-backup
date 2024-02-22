<?php
require('./view/admin_head.php');

session_start();

if (!isset($_SESSION['isAdmin'])) {
    echo file_get_contents('./view/admin_login_form.php');
} else {
    show_admin_panel();
}

require('./view/admin_foot.php');

function show_admin_panel() {
    echo "<form action=\"admin_logout.php\" method=\"post\"><input type=\"submit\" value=\"Выйти\" name=\"inner_logout\" /><input type=\"submit\" value=\"Выйти на сайт\" /></form>";
    require('./../mysqli_info.php');
    $mysqli = new mysqli($host, $user, $password, $db_name);
    $mysqli->set_charset('utf8');
    if ($mysqli->connect_errno) echo 'connection error';
    else {
        $orders = $mysqli->query('SELECT * FROM `orders`');
        while ($ord = $orders->fetch_assoc()) {
            require('./view/order.php'); //destructing ord inside into html
        }
    }

    $mysqli->close();
}