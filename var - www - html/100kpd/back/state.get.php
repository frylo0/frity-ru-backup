<?php
require_once './state.queries.php';

$req = $_GET;

$type = $req['type'];
$id = $req['id'];

echo get_state($type, $id);
