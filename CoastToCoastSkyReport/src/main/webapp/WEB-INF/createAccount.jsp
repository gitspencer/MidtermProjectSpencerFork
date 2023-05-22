<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Account</title>
</head>
<body>
<%--Edit the file nav.jsp to change nav links --%>
	<%@ include file="nav.jsp"%>

	<h2>Create Account</h2>
	<form action="createAccount.do" method="post">
		<fieldset class="items add">
			<label id="one"> User Name: </label> 
			<input type="text" name="username" required /> 
			<br> 
			<label id="two"> Password: </label> 
			<input type="text" name="password" required /> 
			<br> 
			<label id="three"> First Name: </label> 
			<input type="text" name="firstName" /> 
			<br> 
			<label id="four"> Last Name: </label> 
			<input type="text" name="lastName" required /> 
			<br> 
			<label id="six">Address: </label> 
			<input type="text" name="address" /> 
			<br> 
			<label id="six">City: </label> 
			<input type="text" name="city" /> 
			<br> 
			<label id="seven">ZipCode: </label> 
			<input type="text" name="zipcode" /> 
			<br> 
			<label id="eight">State: </label> 
			<input type="text" name="state" /> 
			<br> 
			<label id="nine">Country: </label> 
			<input type="text" name="country" /> 
			<br> 
			<label id="nine">About Me: </label> 
			<input type="text" name="aboutMe" /> 
			<br> 
			<label id="nine">Profile Picture: </label> 
			<input type="text" name="profilePictureUrl" /> 
			<br> 
			<input type="hidden" name="enabled" value="1" /> 
			<input type="hidden" name="role" value="User" /> 
			</fieldset>
			
						<input type="submit" value="Create Account" />
	</form>
</body>
</html>