<?php
//$title = $_GET['title']; //surname name secondname

require 'mysql_info.php';
$mysqli  = new mysqli($host, $user, $pass, $db_name);

$link_split = explode('/', $_GET['page']);

$person_page = $link_split[2];
$type_folder = $link_split[1];
$region_folder = $link_split[0];

$region_name = $mysqli->query("SELECT region_name FROM cim_regions WHERE region_folder=\"$region_folder\"")->fetch_row()[0];
$type_name = $mysqli->query("SELECT type_name FROM cim_type WHERE type_folder=\"$type_folder\"")->fetch_row()[0];
$person = $mysqli->query("SELECT * FROM cim_person WHERE person_page=\"$person_page\"")->fetch_assoc();

$title = join(
    ' ', [
        $person['person_surname'], 
        $person['person_name'], 
        $person['person_secondname']
    ]
);

$mysqli->close();

require('html/show-person/head.php');
include('files/'.$_GET['page']);
require('html/show-person/foot.html');