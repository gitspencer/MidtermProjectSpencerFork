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
		
			<input type="submit" value="addNewSighting" />
		</fieldset>
	</form>

</body>
</html>