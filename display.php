<?PHP


$url = $_POST['launch_presentation_return_url'];
$query=parse_url($url,PHP_URL_QUERY);
parse_str($query, $out);

$course_id=$out['course_id'];
$course_title=$_POST['context_title'];
$course_batchUID=$_POST['context_label'];
$user_id=$_POST['user_id'];
$name=$_POST['lis_person_name_full'];

//replacement for the Constant public $HOSTNAME =
preg_match_all('/\//', $url,$matches, PREG_OFFSET_CAPTURE);
$clientURL = substr($url, 0, $matches[0][2][1]);


require("conn.php");


$query = "SELECT DISTINCT (user),STATUS , course_added_date, bb_user FROM course_dropadds, course_lookup 
  WHERE
course_lookup.course_id = '$course_batchUID' and 
course_dropadds.course_number = '$course_batchUID' and 
 (course_dropadds.course_added_date > course_lookup.start_date OR course_dropadds.status = 'D' )";



$r1 = mysqli_query($db, $query);


?><!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">

<link rel='stylesheet' type='text/css' href='css/style2.css'>
<script src='js/js2.js'></script>
 <style>
      table {
        border-collapse: separate;
        border-spacing: 0 15px;
      }
      th {
        background-color: #4287f5;
        color: white;
      }
      th,
      td {
        width: 150px;
        text-align: center;
        border: 1px solid black;
        padding: 5px;
      }
      h2 {
        color: #4287f5;
      }
    </style>

<title>Course Drop/Adds</title>
</head>

<body onLoad="showTab(currentTab)" >



<div class="header">

<form id="regForm" action="" method=GET >


<!-- One "tab" for each step in the form: -->
<div class="tab">
<h1>Course Drop/Adds: <?PHP echo $course_title; ?></h1>
<p>
<b>This report listing is generated daily at 2:00 AM. </b>
</p>
<p>
Hello Professor <?PHP echo $name; ?>, Below is a list of students who are added or disabled in your course.
</p>
<p>    
<ul>
<li>
Student name
</li>
<li>
Status: A="Added" D="Disabled"
</li>
<li> 
Date Added to Course: Students listed with the Status of "A" were added to the course after the course start date for the term. 
If a student is listed with the Status of "D", he or she has dropped or withdrawn after the course start date.
</li>
</p>




<p>
<center>
<table border=0>

<tr>
<th>Status Icon</th>  
<th>Student</th><th>UserID</th><th>Status</th><th>Added Date</th>
</th>
</tr>

<?php
while ( $rows = $r1->fetch_assoc() ) {
echo"$user";
if ($rows['STATUS'] == "D")
{
 echo"<tr>";  
 echo"<td><img src=disabled_li.gif width='20px' height='20px'></td>";
 echo"<td>".$rows['user']."</td><td>".$rows['bb_user']."</td><td>".$rows['STATUS']."</td><td>&nbsp;</td>
</tr>";
}
if ($rows['STATUS'] == "A")
{
 echo"<tr>";  
 echo"<td><img src=green.png width='20px' height='20px'></td>";
 echo"<td>".$rows['user']."</td><td>".$rows['bb_user']."</td><td>".$rows['STATUS']."</td><td>".$rows['course_added_date']."</td>
</tr>";
}
}
$resource->free();
$db->close();

?>
</table>
</center>
</p>
</div>
</form>
</div>
</body>
</html>
