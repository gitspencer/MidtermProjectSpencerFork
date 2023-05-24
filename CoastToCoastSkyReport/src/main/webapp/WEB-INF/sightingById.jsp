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
<title>Sighting by Id</title>
</head>
<body>
<%@ include file="nav.jsp"%>
<div style="min-height: 100vh" class="background-image">

	<div class="container">
<br>
<br>

			<h3>${sighting.title}</h3>
			
		<div class="row"  >
		<div class="col-lg-1"></div>
		<div class="col-lg-5">
		
		<img src="${sighting.pictureUrl}" alt="Picture of UFO!" width="500"
			height="350">
		</div>
			<div class="col-lg-5">
			<div class="map-container"> <iframe src="https://www.google.com/maps?q=${sighting.location.zipcode }&z=9&output=embed" width="500" height="350" frameborder="0" style="border:0" allowfullscreen> </iframe> </div> 
			</div>
		<div class="col-lg-1">
		</div>
		
			<br>
			<ul class="list-unstyled">
			<li><div class="grow">Sighting Date:
					${sighting.sightingDate}</div></li>
			<li><div class="grow">Description: ${sighting.description}</div></li>
			<li><div class="grow">Location: ${sighting.location.city}
				</div></li>
			<li><div class="grow">Rating: ${sighting.sightingRating}</div></li>
	<c:choose>	
	<c:when test="${not empty sighting.knownObject}">
	
	<li>Category: ${sighting.knownObject.name} </li>
	<li><img src="${sighting.knownObject.pictureUrl}" alt="picture of category" width="150"
			height="90">  </li>
	
	<li>${sighting.knownObject.description}</li>
	</c:when>
	<c:otherwise>
	<li>Category: UFO</li>
	</c:otherwise>
	
	</c:choose>
			
		</ul>


	</div>
	
<form action="createSightingComment.do">
<input type="hidden" value="${sighting.id }" name= "sightingId">
<textarea name="content" cols="35" rows="7"></textarea>
<button type= "submit" name="comment">Comment
</button>




</form>
			<ul class="list-unstyled">
<c:forEach var="comment" items="${commentList}">



		<li>${comment.content}</li>

	
	</c:forEach>
	</ul>

	 	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
	
	</div>
	</div>
</body>
</html>