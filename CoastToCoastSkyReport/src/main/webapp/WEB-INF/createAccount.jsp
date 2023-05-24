<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="main.css">
<title>Create Account</title>
</head>
<body>
<%@ include file="nav.jsp"%>
<div style="min-height: 100vh" class="background-image">
<div class="flier">
<img src="https://pngimg.com/uploads/ufo/ufo_PNG71605.png"  >
	</div>
	<div class="container">
	
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
	
	</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>

</body>
</html>