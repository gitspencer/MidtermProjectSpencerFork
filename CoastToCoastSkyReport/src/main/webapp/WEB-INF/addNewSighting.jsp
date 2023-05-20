<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add New Sighting</title>
</head>
<body>
<%@ include file="nav.jsp"%>


	<h1>Report a Sighting</h1>   
	<form class="container" action="addNewSighting.do" method="POST">
		<fieldset class="items add">
			<label id="one"> Sighting Title: </label> 
			<input type="text" name="title" required /> 
			<br> 
			<label id="two"> Sighting Date: </label> 
			<input type="date" name="sightingDate" /> 
			<br> 
			<label id="three"> Description: </label> 
			<input type="text" name="description" required /> 
			<br> 
			<label id="four">Image of Sighting: </label> 
			<input type="text" name="pictureUrl" /> 
			<br> 
			<label id="five">Sighting Location: </label> 
			<input type="text" name="locationId" /> 
			<br> 
			<input type="submit" value="addNewSighting" />
		</fieldset>
	</form>

</body>
</html>