<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Account View</title>
</head>
<body>
	<h1>My Account View</h1>


	<%--Edit the file nav.jsp to change nav links --%>
	<%@ include file="nav.jsp"%>


	<%-- Output user details --%>
	<c:choose>
		<c:when test="${not empty sessionScope.loggedInUser}">
			<h2>Your Account Details</h2>
			<h3>
				<c:out value="${loggedInUser.firstName }"></c:out>
				<c:out value="${loggedInUser.lastName }"></c:out>
			</h3>
			ID: <c:out value="${loggedInUser.id }"></c:out>
			<br>
			User Name: <c:out value="${loggedInUser.username }"></c:out>
			<br>
		</c:when>

		<c:otherwise>
			<br> "Not Logged In."
		</c:otherwise>
	</c:choose>

</body>
</html>