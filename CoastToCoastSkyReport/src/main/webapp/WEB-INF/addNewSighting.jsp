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
<title>Add New Sighting</title>
</head>
<body>
<%@ include file="nav.jsp"%>
<div style="min-height: 100vh" class="background-image">

	<div class="container">
	<br>
	<h1>Report a Sighting</h1>   
	<form class="container" action="addNewSighting.do" method="POST">
		<fieldset class="items add">
			<label id="one"> Sighting Title: </label> 
			<input type="text" name="title" required /> 
			<br> 
			<label id="three"> Description: </label> 
			<input type="text" name="description" required /> 
			<br> 
			<label id="four">Image of Sighting: </label> 
			<input type="text" name="pictureUrl" /> 
			<br> 
			<label id="five">Sighting Address: </label> 
			<input type="text" name="address" /> 
			<br> 
			<label id="six">Sighting City: </label> 
			<input type="text" name="city" /> 
			<br> 
			<label id="seven">Sighting ZipCode: </label> 
			<input type="text" name="zipcode" /> 
			<br> 
			<label id="eight">Sighting State: </label> 
			<input type="text" name="state" /> 
			<br> 
			<label id="nine">Sighting Country: </label> 
			<input type="text" name="country" /> 
			<br> 
		
			<input type="submit" value="Report Sighting" />
		</fieldset>
	</form>
	
	</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>