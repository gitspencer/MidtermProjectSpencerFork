<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sighting by Id</title>
</head>
<body>
	<%@ include file="nav.jsp"%>

	<div class="container">


			<img src="${ sighting.pictureUrl}" alt="Picture of UFO!" width="500" height="350"><br> 
		<ul>
			<li><div class="grow">Sighting Title: ${sighting.title}</div></li>
			<li><div class="grow">Sighting Date: ${sighting.sightingDate}</div></li>
			<li><div class="grow">Description: ${sighting.description}</div></li>
			<li><div class="grow">Location: ${sighting.location.city} </div></li>
			<li><div class="grow">Rating: ${sighting.sightingRating}</div></li>
			<li><div class="grow">Category: ${sighting.categories}</div></li>
			<li><div class="grow">Comments: ${sighting.comments}</div></li>
		</ul>


	</div>

</body>
</html>