<?php
require('mysql_info.php');
$mysqli = new mysqli($host, $user, $pass, $db_name);
$mysqli->set_charset('utf8');

$select_target_region_id = "SELECT * FROM `cim_regions` WHERE region_selector=\"".$_POST["region"]."\"";
$selected_region = $mysqli->query($select_target_region_id)->fetch_assoc();

$region_id = $selected_region ? $selected_region["id_region"] : null;
$type_id = $_POST['type'];

if ($region_id) {
    
    //QUERIES
    $select_persons_with_type_and_region = 
    "SELECT page_id_person
    FROM cim_page
    WHERE page_id_region=$region_id AND page_id_type=$type_id";
    
    
    $persons_ids_as_arrays = $mysqli->query($select_persons_with_type_and_region)->fetch_all();
    $persons_ids_strings = array_map(function ($el) { return 'id_person='.$el[0]; }, $persons_ids_as_arrays);
    
    $select_persons_with_ids =
    'SELECT * FROM cim_person WHERE ' . join(' OR ', $persons_ids_strings);
    $persons = $mysqli->query($select_persons_with_ids)->fetch_all(MYSQLI_ASSOC);
    
    $region_folder = $mysqli->query('SELECT region_folder FROM cim_regions WHERE id_region='.$region_id)->fetch_row()[0];
    $type_folder = $mysqli->query('SELECT type_folder FROM cim_type WHERE id_type='.$type_id)->fetch_row()[0];
    
    $mysqli->close();
    
    //BUILDING response JSON data
    $json_persons = "[";
    for ($i=0; $i < count($persons); $i++) { 
        $curr_person = $persons[$i];
        $json_person = "{";
        foreach ($curr_person as $key => $value) {
            $json_person .= "\"$key\": \"$value\",";
        }
        $json_person .= '"person_page_way":"'."$region_folder/$type_folder/".'"';
        $json_person .= $i == count($persons) - 1 ? "}" : "},";
        $json_persons .= $json_person;
    }
    $json_persons .= "]";
    
    echo $json_persons;
    
} else {
    
    echo 'No such region declared in data base';
    
}