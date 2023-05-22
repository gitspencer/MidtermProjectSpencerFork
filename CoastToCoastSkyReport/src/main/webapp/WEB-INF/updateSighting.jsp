<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Sighting</title>
</head>
<body>
<%@ include file="nav.jsp"%>


	<h1>Update a Sighting</h1>   
	${sighting }
	<form class="container" action="updatedSighting.do" method="POST">
		<fieldset class="items add">
			<input type="hidden" name="id" value="${sighting.id }" ><br>		
			<label id="one"> Sighting Title: </label> 
			<input type="text" value="${sighting.title }" name="title" required /> 
			<br> 
			<label id="two"> Sighting Date: </label> 
			<input type="date" value="${sighting.sightingDate}" name="sightingDate"/> 
			<br> 
			<label id="three"> Description: </label> 
			<input type="text" value="${sighting.description }" name="description" required /> 
			<br> 
			<label id="four">Image of Sighting: </label> 
			<input type="text" value="${sighting.pictureUrl }" name="pictureUrl" /> 
			<br> 
			
		<%-- 	ADD Known object	
					
			<label id="four">Known Object: </label> 
			<input type="text" value="${sighting.knownObject.id }" name="sighting.knownObject.id" /> 			
			<br> --%> 
			
			ADD location methodology
			<label id="five">Sighting Address: </label> 
			<input type="text" value="${sighting.location.address }" name="address" /> 
			<br> 
			<label id="five">Sighting City: </label> 
			<input type="text" value="${sighting.location.city }" name="city" /> 
			<br> 
			<label id="five">Sighting ZipCode: </label> 
			<input type="number" value="${sighting.location.zipcode }" name="zipcode" /> 
			<br> 
			<label id="five">Sighting State: </label> 
			<input type="text" value="${sighting.location.state }" name="state" /> 
			<br> 
			<label id="five">Sighting Country: </label> 
			<input type="text"  value="${sighting.location.country }" name="country" /> 
			<br> 
		
			<input type="submit" value="updateSighting" />
		</fieldset>
	</form>

</body>
</html>