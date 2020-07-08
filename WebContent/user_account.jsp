<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
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
	<title>User Account</title>

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
      height: 30px;
      /* border-radius: 50%; */
    }
	 @media screen and (max-width: 767px) {
      form {
        width:80vw;
      }
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

	
	
	<% if(request.getAttribute("psw_edit")=="F") {%>	 
	  <script type="text/javascript">		 
	 	 alert("Password failed");		
	  </script>
	 
  <%}%>
	
	<jsp:useBean id="emp" scope="session" class="com.userinfo.Empbean" />
	<% String name=emp.getEname(), title=emp.getTitle(), empno=emp.getEmpno();%>
	<form action="" method="post" id="form_psw">
    <div class="imgcontainer">
      <img src="./assets/images/HCLogoIcon2.png" alt="Avatar" class="avatar">
    </div>

    <div class="container">
      <h2 id = "psw_result"></h2>
      <label for="Empno"><b>Username</b></label>
      <input type="text" name="Empno" readonly value=<%=empno%> style="cursor:not-allowed">

      <label for="ename"><b>Name</b></label>
      <input type="text" name="name" readonly value=<%=name%> style="cursor:not-allowed">

      <label for="title"><b>title</b></label>
      <input type="text" name="title" readonly value=<%=title%> style="cursor:not-allowed">

      <label for="psw"><b>New Password</b></label>
      <input type="password" placeholder="Enter Password" name="psw" id="psw" required="required" autocomplete="off"/>

      <button type="submit" >Reset Password</button>      
      <button type="button" onclick="location.href='index.jsp'">Cancel</button>            

    </div>
  
    <div class="container" id="hint"></div>
    
    </form>
    <script type="text/javascript" src="./assets/vendor/jquery/jquery-3.5.1.min.js"></script>
    <script>
    $(function(){ 
    	
    	
    	var flagck = false;
    	$("#psw").blur(function(){
	            let flag1 = false;
	            let flag2 = false;
	            let flag3 = false;
	            let pwdvalue=$("#psw").val();
	            let upval=pwdvalue.toUpperCase();
	            let Special = new RegExp("^(?=.*[!@#$%^&*])");
	            if(pwdvalue==""){
	                $("#hint").html("Cannot be blank!");
	            }else{
	               if(pwdvalue.length>=6){
	                    for(i=0;i<pwdvalue.length;i++){
	                        if(upval.charAt(i)>="A" && upval.charAt(i)<="Z"){
	                            flag1=true;
	                        }else{
	                            $("#hint").html("Minimum <b>1 charactor</b>")
	                        }if(upval.charAt(i)>="0" && upval.charAt(i)<="9"){
	                            flag2=true;
	                        }else{
	                            $("#hint").html("Minimum <b>1 number</b>")
	                        }
	                    }
	                    if(flag1 && flag2){
	                        if(Special.test(pwdvalue)){
	                            $("#hint").html("Format correct!");
	                            flagck = true;
	                        }else{
	                            $("#hint").html("Minimum <b>1 special letter</b>");
	                        }
	                    }
	               }else{
	                    $("#hint").html("Minimum <b>6 characters</b>");
	               }
	        }
            
    	}); // password validation end
    	
    	$("#form_psw").submit(function(event) {  
    		if(flagck){
	    		$.ajax({
		            type:"post",
		            async: "false",
		            url:"PwdEdit",   
		            dataType:"json",//宣告回傳數據的資料格式，請求成功後servlet回傳json的格式 
		            data : $("#form_psw").serialize(),
		            beforesend:
		            	console.log(flagck),
		            success:
		                function(data){  
		            		$("#hint").html("Password Reset Successfully!");
		            		var result = <%=request.getParameter("psw_edit")%>;
		                	if(result){
		                		$("#psw_result").html("Password changed successfully!")
		                	}
		            },// success end  
		            error:
		                function(xhr, ajaxOptions, thrownError){
			            	alert("Password Reset Fail!"+xhr.status+"\n"+thrownError);
			            	setTimeout(function(){
					        	CommonLib.unblock("div_patient_dashboard");
					        },200);
		                }
		            
		        });return true
    		}else{
    			$("#hint").html("PLease check your password format!");
    			alert("PLease check your password format!");
    		}
		}); //pswReset end
		
    });
    </script>
    
</body>
</html>