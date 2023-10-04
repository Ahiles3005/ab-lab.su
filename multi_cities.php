<?php

require_once "config.php";

$mysqli = new mysqli(DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE);

if ($mysqli->connect_errno) {
    echo "Не удалось подключиться к MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

$mysqli->query("SET NAMES 'utf8'");
$mysqli->query("SET CHARACTER SET 'utf8'");
$mysqli->query("SET SESSION collation_connection = 'utf8_general_ci'");

$level = explode('.', $_SERVER['HTTP_HOST']);
if (count($level) == 3) {
    $subdomain = $level[0];
    define('HTTPS_SERVER', 'https://' . $subdomain . '.ab-lab.su/');
    $res = $mysqli->query("SELECT * FROM `geo` WHERE REPLACE ( REPLACE ( `city_en`, '\'' , '' ) , ' ' , '-' )  = '$subdomain' LIMIT 1");
    $GLOBALS['geo'] = $res->fetch_object();
    //print_r($GLOBALS['geo']);
    $mysqli->close();
} else {
    define('HTTPS_SERVER', 'https://ab-lab.su/');
}
