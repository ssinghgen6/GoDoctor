<!DOCTYPE html>
<html>
<head>
	<title>login</title>

<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/material-dashboard.css?v=1.2.0" rel="stylesheet" />
<link href="css/demo.css" rel="stylesheet" />
<link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>

</head>

    <body >
<!---login pagestarts here-->
       <div class="container login_page">
       	<div class="logo_mdimg">
            <img src="images/mdlogo.svg"  height="150px" ></div>
       <div class="row">
        <div class="col-sm-2"></div>
        <div class="col-sm-8">
         <form name="Loginform" action="login.htm" method="post">
        <p><input type="text" class="user_name" name="username"   placeholder="USERNAME"></p>
        <p><input type="password" class="user_name" name="password"   placeholder="PASSWORD"></p>
       
       <button  class="btn btn-md form_color" style="color:white;">LOGIN</button>
       <div class="forgot-password">
         <p ><a href="">FORGOT PASSWORD ?</a></p> 
       </div>
      </form>
        </div>
        <div class="col-sm-2"></div>
       </div>
       </div>      

 

<!--login page ends here-->
       
<script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script src="js/material.min.js" type="text/javascript"></script>
<!--  Charts Plugin -->
<script src="js/chartist.min.js"></script>
<!--  Dynamic Elements plugin -->
<script src="js/arrive.min.js"></script>
<!--  PerfectScrollbar Library -->
<script src="js/perfect-scrollbar.jquery.min.js"></script>
<!--  Notifications Plugin    -->
<script src="js/bootstrap-notify.js"></script>
<!--  Google Maps Plugin    -->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<!-- Material Dashboard javascript methods -->
<script src="js/material-dashboard.js?v=1.2.0"></script>
<!-- Material Dashboard DEMO methods, don't include it in your project! -->
<script src="js/demo.js"></script>
</body>


</html>