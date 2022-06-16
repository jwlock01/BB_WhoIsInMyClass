<?PHP

$course = "original";
$role = "student";

/*
LTI key verification

if ($_POST[["oauth_consumer_key"] != "AAAABBBBBCCCC")
die();

*/

//if (strpos($_SERVER['HTTP_REFERER'], 'from_ultra=true') !== false)
if (strpos($_SERVER['HTTP_REFERER'], 'from_ultra=false') !== true)
{
	$course = "ultra";
}

if ($_POST['roles'] == "urn:lti:role:ims/lis/Instructor") 
{
	$role = "instructor";
}

if ($_GET['course'] == "ultra")
$course = "ultra";


if ($role == "instructor")
{
	if ($course == "original")
	{
	// instructor original
	 require("display.php");
	} else {
	// instructor ultra
	 require("display.php");
	}

} else {

	if ($course == "original")
        {
	// student original
	 require("display.php");
	} else {
	// student ultra
	 require("display.php");
	}

}


?>
