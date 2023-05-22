<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Page</title>
</head>
<body>

<%@ include file="nav.jsp"%>


	<h1>Select a Sighting to Delete</h1>
	<c:forEach var="sighting" items="${sightingList}">
		<form class="container" action="deleteSightingPage.do" method="POST">
			<input type="hidden" name="id" value="${sighting.id }"> <img
				src="${ sighting.pictureUrl}" alt="sightingImage" width="300"
				height="200"><br> <a
				href="sightingById.do?id=${sighting.id}">${sighting.title} </a><br>
			<ul>
				<li>${ sighting.sightingDate}</li>
				<li>${ sighting.description}</li>
				<li>${ sighting.dateCreated}</li>
				<li>${ sighting.lastUpdate}</li>
			</ul>
			<button>Delete Sighting</button>
			<a href="updateSighting.do?id=${sighting.id}">Edit Sighting Details</a>

		</form>
	</c:forEach>


</body>
</html>