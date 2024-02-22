<?php
session_start();
session_destroy();
if ($_POST['inner_logout'])
    header('location: ./');
else 
    header('location: ./..');