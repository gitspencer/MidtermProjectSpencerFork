<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Navigation Bar</title>
</head>
<body>
<h1>Nav bar</h1>
<ul>
<li> <a href="home.do">Home</a> </li>
	
	<c:choose>
	<c:when test="${not empty sessionScope.loggedInUser }">
	  <li> <a href="account.do">Account</a> </li>
	  <li> <a href="logout.do">Logout</a> </li>
	  <li> <a href="addNewSighting.do">Report a Sighting</a> </li>
	  <li> <a href="deleteSightingRouting.do">Delete a Sighting</a> </li>
			
	</c:when>
	<c:otherwise>			
	  <li> <a href="login.do">Login</a> </li>
	  <li> <a href="createAccount.do">Create Account</a> </li>
	</c:otherwise>
	</c:choose>
</ul>
</body>
</html>