<?php 
if(!empty($_POST)){
    $serverName = "MOHAMED-KHALED"; 
    $connectionInfo = array( "Database"=>"register");
    $conn = sqlsrv_connect( $serverName, $connectionInfo);
    $username=$_POST['username'];
    $password=$_POST['password'];

    $query="SELECT * FROM user1 WHERE username='$username' AND password= '$password'";
    $result = sqlsrv_query($conn,$query);
    #checks if the search was made
    if($result === false){
    header('location: mainpage.html');
   }
   if(sqlsrv_has_rows($result) == 1){
    header('location: mainpage.html');
    }
   #checks if the search brought some row and if it is one only row
   if(sqlsrv_has_rows($result) != 1){
      echo "username/password not found";
   }
}
?>

