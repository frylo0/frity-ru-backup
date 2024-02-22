<?php
require_once './state.queries.php';

$req = $_GET;

$type = $req['type'];
$id = $req['id'];
$data = $req['data'];

echo update_state($type, $id, $data);
