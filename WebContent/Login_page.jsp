<%@ page language="java" contentType="text/html;charset=UTF-8"
    import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<link rel="icon" href="./favicon.ico" type="image/x-icon" />
  <style>
    /* Bordered form */
    form {
      border: 3px solid #f1f1f1;
      border-radius: 30px;
      margin: 0 auto;
      width: 600px;
      margin-top: 10%;
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
    }

    /* Set a style for all buttons */
    button {
      background-color: #ADADAD;
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

    /* Avatar image */
    img.avatar {
      width: 40%;
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
  
  
  <form action="./Login" method="post">
    <div class="imgcontainer">
      <img src="./assets/images/logo.png" alt="Avatar" class="avatar">
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

    <div class="container" style="background-color:#f1f1f1">
      <!-- <span class="psw">Forgot <a href="#">password?</a></span> -->
      
    </div>
  </form>
</body>

</html>