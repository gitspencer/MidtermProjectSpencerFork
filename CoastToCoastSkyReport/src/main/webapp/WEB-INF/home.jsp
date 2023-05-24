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
<title>Coast to Coast Sky Report</title>
</head>
<body>
<%@ include file="nav.jsp"%>
<div style="min-height: 100vh" class="background-image">

	<div class="container">
	
	<h1>UDPATE ME Coast to Coast Sky Report - Home Page</h1>
	
	<h2>Top Sightings</h2>
	<c:forEach var="sighting" items="${sightingList}">
		<c:if test="${empty sightingList }">
			<em>None</em>
		</c:if>
		<img src="${ sighting.pictureUrl}" alt="sightingImage" width="300" height="200"><br> 
	<div class="textbox">
		<h6><a href="sightingById.do?id=${sighting.id}" class="link-danger">${sighting.title} </a></h6>
			Sighting Date: ${ sighting.sightingDate}   <br>
			${ sighting.description}   <br>
	</div>
	</c:forEach>

	</div>
</div>	

 	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>