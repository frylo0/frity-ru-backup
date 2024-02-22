<?php
require_once './state.queries.php';

$req = $_GET;

$type = $req['type'];
$data = $req['data'];

print_r(json_decode($data, true));

print_r(insert_state($type, json_decode($data, true)));
