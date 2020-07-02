<%@ page language="java" contentType="text/html;charset=UTF-8"
    import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Health Care</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta http-equiv="Content-Language" content="en">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
	<link rel="Shortcut Icon" type="image/x-icon" href="./assets/images/LogoIcon.ico" />
    <link rel="apple-touch-icon" href="./assets/images/LogoIcon.ico">
    <link rel="icon" href="./assets/images/LogoIcon.ico">
	<link href="./css/animate.css" rel="stylesheet">	
  <style>
  	body{
  		font-family:sans-serif, 'Microsoft JhengHei', 'Helvetica Neue', Helvetica, Arial;
  		    background: #2e353d;
  	}
    /* Bordered form */
    form {
      padding: 20px;
      box-shadow: 4px 4px 12px -2px rgba(51, 51, 102, 0.5);
      border-radius: 30px;
      margin: 0 auto;
      width: 500px;
      background-color: #1e2a37;
      margin-top: 10%;
      color: #FFFFFF;
    }


    /* Full-width inputs */
    input[type=text],
    input[type=password] {
      width: 100%;
      padding: 12px 20px;
      margin: 8px 0;
      display: inline-block;
      border: 1px solid #ccc;
      box-sizing: border-box;
          border-color: rgba(153, 153, 153, 0.3);
    background-color: rgba(0, 0, 0, 0.3);
    color: rgba(255, 255, 255, 0.8);
    }

    /* Set a style for all buttons */
    button {
      background-color: #4697ce;
      border-radius: 5px;
      color: white;
      padding: 10px 18px;
      margin: 8px 0;
      border: none;
      cursor: pointer;
      /* width: 100%; */
    }

    /* Add a hover effect for buttons */
    button:hover {
      opacity: 0.8;
    }

    /* Extra style for the cancel button (red) */
    .cancelbtn {
      width: auto;
      padding: 10px 18px;
      /* background-color: #f44336; */
    }

    /* Center the avatar image inside this container */
    .imgcontainer {
      text-align: center;
      margin: 24px 0 12px 0;
    }


    img {
      height: 36px;
      /* border-radius: 50%; */
    }

    /* Add padding to containers */
    .container {
      padding: 16px;
      border-radius: 0px 0px 25px 25px;
    }

    /* The "Forgot password" text */
    span.psw {
      float: right;
      padding-top: 16px;
    }

    /* Change styles for span and cancel button on extra small screens */
    @media screen and (max-width: 300px) {
      span.psw {
        display: block;
        float: none;
      }

      .cancelbtn {
        width: 100%;
      }
    }
  </style>

</head>

<body onbeforeunload="window.location='./logout.jsp'">
  
  <%if((Integer)session.getAttribute("count")!=null && (Integer)session.getAttribute("count")>0) {%>	 
	  
	  <script type="text/javascript">		 
	 	 alert("Please check you username/password is correct");		
	  </script>
	 
  <%}%>
  
  
  <form action="./Login" method="post" class="animated fadeInUpSmall">
    <div class="imgcontainer">
      <img src="./assets/images/HCLogo2.png">
    </div>

    <div class="container">
      <label for="empno"><b>Username</b></label>
      <input type="text" placeholder="Enter Username" name="empno" required="required" autocomplete="off">

      <label for="psw"><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="psw" required="required" autocomplete="off" >
      <br>
      <button type="submit">Login</button>
      <button type="reset" class="cancelbtn">Clear</button>

    </div>

    <div class="container">
      <!-- <span class="psw">Forgot <a href="#">password?</a></span> -->
      
    </div>
  </form>
</body>

</html>