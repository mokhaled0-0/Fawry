<?php 
if(!empty($_POST)){
    $serverName = "DESKTOP-7GAVU9F\SQLEXPRESS"; 
    $connectionInfo = array( "Database"=>"Fawry_Project");
    $conn = sqlsrv_connect($serverName, $connectionInfo);
$username=$_POST['username'];
$phone=$_POST['phone'];
$landline=$_POST['landline'];
$password=$_POST['password'];

$insertar="INSERT into users(username,phone,landline,password)values( '$username' ,'$phone','$landline' ,'$password' )";
$resource =sqlsrv_prepare($conn,$insertar);
if(sqlsrv_execute($resource)){
    header('location: signin.php');
}
else{
    echo "not worked";
    }
}
?>