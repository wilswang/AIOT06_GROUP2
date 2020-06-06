<%@ page language="java" contentType="text/html;charset=UTF-8"
	import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<link rel="Shortcut Icon" type="image/x-icon" href="./favicon.ico" />
<title>Login Page</title>
</head>
<body>
	<% session.invalidate(); %>
	<script>
	setTimeout(function () {
		   window.location.href = "Login_page.jsp"; 
		}, 5000);
	</script>
	
        
       <h2> Please wait for a while and try again! </h2>
</body>
</html>