<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
<%--Edit the file nav.jsp to change nav links --%>
	<%@ include file="nav.jsp"%>
	
	<h2>Log In</h2>
	
	<form action="login.do" method="post">
		<input type="text" name="username"> 
		<input type="password" name="password" /> 
		<input type="submit" value="Log In">
	</form>
</body>
</html>