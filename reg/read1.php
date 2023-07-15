<?php 
if(!empty($_POST)){
    $serverName = "MOHAMED-KHALED"; 
    $connectionInfo = array( "Database"=>"register");
    $conn = sqlsrv_connect( $serverName, $connectionInfo);
$username=$_POST['username'];
$phone=$_POST['phone'];
$landline=$_POST['landline'];
$password=$_POST['password'];

$insertar="INSERT into user1(username,phone,landline,password)values( '$username' ,'$phone','$landline' ,'$password' )";
$resource =sqlsrv_prepare($conn,$insertar);
if(sqlsrv_execute($resource)){
    header('location: signin.php');
}
else{
    echo "not worked";
    }
}
?>