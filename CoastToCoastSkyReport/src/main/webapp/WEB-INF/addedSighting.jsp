<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Created Sighting Results</title>
</head>
<body>
<%@ include file="nav.jsp"%>

<div class="container">

<c:choose>
		<c:when test="${! empty sighting}">
			
				<fieldset class="items add">
		
				<ul>
					<li><div class="grow">Sighting Title: ${sighting.pictureUrl}</div></li>
					<li><div class="grow">Sighting Title: ${sighting.title}</div></li>
					<li><div class="grow">Date of Sighting: ${sighting.sightingDate}</div></li>
					<li><div class="grow">Sighting Title: ${sighting.description}</div></li>
					<li><div class="grow">Address: ${sighting.location.address}</div></li>
					<li><div class="grow">City: ${sighting.location.city}</div></li>
					<li><div class="grow">Zipcode: ${sighting.location.zipcode}</div></li>
					<li><div class="grow">State: ${sighting.location.state}</div></li>
					<li><div class="grow">Country: ${sighting.location.country}</div></li>
				</ul>
			
				</fieldset>
			
		</c:when>
		
		<c:when test="${empty sighting}">
		 <p> No Sighting Found </p>
		</c:when>
		
	</c:choose>
</div>

</body>
</html>