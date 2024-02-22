<?php
require 'mysql_info.php';
$mysqli = new mysqli($host, $user, $pass, $db_name);

$region_selector = $_POST['region_selector'];
$select_region_with_selector = "SELECT id_region FROM cim_regions WHERE region_selector='$region_selector'";
$region_id = $mysqli->query($select_region_with_selector)->fetch_row()[0];

$select_types_of_region = "SELECT page_id_type FROM cim_page WHERE page_id_region='$region_id'";
$types_of_region_as_array = $mysqli->query($select_types_of_region)->fetch_all();
$types_of_region = array_map(function ($el) { return $el[0]; }, $types_of_region_as_array);

if (count($types_of_region) == 0) echo '[]';

$types_no_repeat = [];
foreach ($types_of_region as $i => $type) {
    if (!in_array($type, $types_no_repeat)) {
        $types_no_repeat[] = 'id_type=' . $type;
    }
}

$types = $mysqli->query('SELECT * from cim_type WHERE ' . join(' OR ', $types_no_repeat))->fetch_all(MYSQLI_ASSOC);

//BUILDING response JSON data
$json = "[";
for ($i=0; $i < count($types); $i++) { 
    $curr_single = $types[$i];
    $json_single = "{";
    foreach ($curr_single as $key => $value) {
        $json_single .= "\"$key\": \"$value\",";
    }
    $json_single .= '"copywrite": "fedoritiy corp."';
    $json_single .= $i == count($types) - 1 ? "}" : "},";
    $json .= $json_single;
}
$json .= "]";

echo $json;