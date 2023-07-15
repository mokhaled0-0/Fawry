<?php 
if(!empty($_POST)){
    $serverName = "DESKTOP-7GAVU9F\SQLEXPRESS"; 
    $connectionInfo = array( "Database"=>"Fawry_Project");
    $conn = sqlsrv_connect( $serverName, $connectionInfo);
    $username=$_POST['username'];
    $password=$_POST['password'];

    $query="SELECT * FROM users WHERE username='$username' AND password= '$password'";
    $result = sqlsrv_query($conn,$query);
    #checks if the search was made
    if($result === false){
    header('location: mainpage.php');
   }
   if(sqlsrv_has_rows($result) == 1){
    header('location: mainpage.php');
    }
   #checks if the search brought some row and if it is one only row
   if(sqlsrv_has_rows($result) != 1){
      echo "username/password not found";
   }
}
?>