<!DOCTYPE html>
<html>
<body>

<h2>Project 1 B</h2>
<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">  
   Input your query here: <textarea name="input" rows="5" cols="40"><?php echo $input;?></textarea>
   <br><br>
   <input type="submit" name="submit" value="Submit"> 
</form>

<table border="1">
<?php
//initialization
$db_host = 'localhost';
$db_name = 'CS143';
$db_user = 'cs143';
$db_pwd = '';

$mysqli = new mysqli($db_host, $db_user, $db_pwd, $db_name);

//queries
#$sql = "select * from Actor";

if ($_SERVER["REQUEST_METHOD"] == "POST"){
	$sql = $_POST['input'];
	$result = $mysqli->query($sql);

	if($result === false){
	    echo $mysqli->error;
	    echo $mysqli->errno;
	}

	$field_info_arr = $result->fetch_fields();
	
	$c = 1;
	while($row = $result->fetch_assoc()){
		//choose attributes
	    #echo $row['id'];
	    #echo $row['last_name'];
	    #echo $row[count($row)];
	    #echo  "<br />";
	    //
	    if($c==1){
	    	$c = $c + 1;
	    	echo '<tr>';
	    	foreach($row as $x=>$x_value){

	    		echo '<td style="font-weight:bold">'.$x.'</td>';
	    		//echo ' ';
	    	}
	    	echo '</tr>';
	    	//echo  "<br />";
	    	
	    }
	    echo '<tr>';
	    foreach($row as $x=>$x_value) {
  			//echo $x; 
  			
  			echo '<td>'.$x_value.'</td>';
  			//echo ' ';
		}
		//echo  "<br />";
		echo '</tr>';
		
	}
	//echo $result;
	$mysqli->close();

	$result->free();

}



?>

</table>

</body>
</html>