<?php
//print_r($_POST);
if ($_POST['login'] == 'feodoritiy' && 
    md5( $_POST['password']) == '6918c6cfd0dead1f0f0b4783949d8359') {
    session_start();
    $_SESSION['isAdmin'] = true;
    //echo 'ok';
    header('location: ./');
} else { echo 'не верный логин или пароль!'; }