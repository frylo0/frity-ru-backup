<?php
require './state.queries.php';

$req = $_GET;

$login = $req['login'];
$pass = $req['pass'];

echo login_state($login, $pass);
