<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" href="main.css">
<title>Updated Sighting Results</title>
</head>
<body>
<%@ include file="nav.jsp"%>

<div class="container">

<c:choose>
		<c:when test="${! empty sighting}">
			
				
		
				<ul>
					<li><div class="grow">Sighting Title: ${sighting.title}</div></li>
					<li><div class="grow">Date of Sighting: ${sighting.sightingDate}</div></li>
					<li><div class="grow">Description: ${sighting.description}</div></li>
				</ul>
			
				
			
		</c:when>
		
		<c:when test="${empty sighting}">
		 <p> No Sighting Found </p>
		</c:when>
		
	</c:choose>
</div>
	 	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
	
</body>
</html>