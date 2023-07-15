<?php 
if(!empty($_POST)){
    $serverName = "DESKTOP-7GAVU9F\SQLEXPRESS"; 
    $connectionInfo = array( "Database"=>"Fawry_Project");
    $conn = sqlsrv_connect( $serverName, $connectionInfo);
}?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="bills.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <title>ELECTRIC | Bill</title>

    <style>
        .bill {
    margin-left: 33em;
    text-align: center;
    border-radius: 10px;
    width: 30em;
    height: 65em;
    border-radius: 7px;
    overflow: hidden;
    cursor: pointer;
    box-shadow: 0px 10px 10px rgba(0, 0, 0, 0.3);
    margin: 100px 525px;
    }
    .pack {
    margin-top: 5em;
    width: 28rem;
    margin: auto;
    margin-top: 1em;
    text-align: center;
}
    </style>
</head>

<body>
<section class="header">
            <nav>
                <a href="mainpage. php"><img src="img/fawry-logo-en-last.png" alt=""></a>
                <div class="nav-links" id="navLinks">
                    <ul>
                        <li><a href="mainpage.php">HOME</a></li>
                        <li><a href="#about">ABOUT</a></li>
                        <li><a href="#services">SERVICES</a></li>
                        <li><a target="_blank" href="payment.html"> pay now!</a></li>
                        <li><a href="#contact">Contact Us</a></li>
                    </ul>
                </div>
            </nav>
        </section>
    <h1 class="title"><i class="fas fa-bolt"></i> ELECTRIC BILL </h1>
    <center><div class="container">
        <form method="post">
            <div class="form">
                <h3 class="un">Inquire about your bill now</h3>
                <input type="tel" placeholder="please enter the telephone number.." name="search" value="">
                <br><br>
                <button type="submit" class="btn" name="ss" onclick="document.getElementById('visible').style.visibility='visible'">Enter your number</button><br>
                <button type="button" class="btn" name="sss" onclick="document.getElementById('visible').style.visibility='visible'">Get The Bill</button>
            </div>
        </form>
    </div></center>
    <script>
        var date = getDate();
    </script>
    <div id="visible" style="visibility: hidden;">
             <form class="bill">
            <div></div>
            <p>
                <h1>فوري<img style="width: 100px; height: 100px;" src="img/icon2.png" alt="">FAWRY</h1><br> 16421 <br>
                <h1>******************</h1>
                <h1 class="title"><i class="fas fa-bolt"></i> ELECTRIC BILL </h1>
                    **********************************************
                <br> Device Number <span></span><br> Account Number <span></span><br>
                <p> Date:
                    <p style="color: red;" id="demo"></p>
                </p>
                <span></span> Time:

                <p style="color: red;" id="demo2"></p>

                <span></span><br>
                <h2>Reference Number: <br>
                    <span></span></h2> <br>
                <h4>Successful Operation</h4>
                
                <div class="sr">
                <?php
                if(isset($_POST['ss'])){
                $search=$_POST['search'];
                $tsql="SELECT code,phone_number,payment_value FROM electricity_bills  WHERE phone_number like '%$search%';";
                $result=sqlsrv_query($conn,$tsql);
                while($row=sqlsrv_fetch_array($result)){
                echo "<div class='pack' ><h3  >Operation code: (".$row['code'].")</h3><h3  >Your Phone Number: (0".$row['phone_number'].")</h3><h3>Your Bill: ".$row['payment_value']." L.E</h3></div>";}
                }  
                ?>
                <h4>-----------------------------------</h4>You Can Pay With This Code In Any Brunch!<br>Or You Can Pay Here.<a target="_blank" href="payment.html"> pay now!</a><br><h4>-----------------------------------</h4>When networks are down,<br> this process takes 24 hours.</p>**********************************************
    </div>
    <script>
        const days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
        const d = new Date();
        let day = days[d.getDay()];
        document.getElementById("demo").innerHTML = day;

        const m = new Date();
        document.getElementById("demo2").innerHTML = Date();
    </script>
    </form>
    </div>

 <br><br><br><br>
</body>

</html>