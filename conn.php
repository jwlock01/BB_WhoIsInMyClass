<?PHP

global $db;

$db_user="phpuser";
$db_password="phpuserpw";
$db_server="localhost";
$db_schema="bb_dropadds";

//$db = mysqli_connect($db_server, $db_user, $db_password);
$db = new mysqli("localhost", "phpuser", "phpuserpw", "bb_dropadds");

if($db->connect_errno > 0){
    die('Unable to connect to database [' . $db->connect_error . ']');
}


?>
