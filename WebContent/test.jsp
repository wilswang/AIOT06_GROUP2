<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="emp" scope="session" class="com.userinfo.Empbean" />
	<% String name=emp.getEname(), title=emp.getTitle(), empno=emp.getEmpno();%>
	<form action="./test.jsp" method="post">

    <div class="imgcontainer">
      <img src="./assets/images/logo.png" alt="Avatar" class="avatar">
    </div>

    <div class="container">
      <label for="Empno"><b>Username</b></label>
      <input type="text" name="Empno" readonly value=<%=empno%>>

      <label for="ename"><b>Name</b></label>
      <input type="text" name="name" readonly value=<%=name%>>

      <label for="title"><b>title</b></label>
      <input type="text" name="title" readonly value=<%=title%>>

      <label for="psw"><b>Enter Password</b></label>
      <input type="password" placeholder="Enter Password" name="psw">

      <label for="pswck"><b>Enter Password again</b></label>
      <input type="password" placeholder="Enter Password" name="pswck"><br>      
      
      <button type="submit">Reset Password</button>      
      <button type="button" onclick="history.back()">Cancel</button>            

    </div>
  
    <div class="container" style="background-color:#f1f1f1"></div>
    
    </form>
</body>
</html>