<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Coast to Coast Sky Report</title>
</head>
<body>
	<%@ include file="nav.jsp"%>
	<h1>Coast to Coast Sky Report - Home Page</h1>

	${SMOKETEST}



	<h2>Most Recent Sightings</h2>
	<c:forEach var="sighting" items="${sightingList}">
		<c:if test="${empty sightingList }">
			<em>None</em>
		</c:if>
		<img src="${ sighting.pictureUrl}" alt="sightingImage" width="300" height="200"><br> 
		<a href="sighting.do?pid=${sighting.id}">${sighting.title} </a><br>
		<ul>
			<li>${ sighting.sightingDate}   </li>
			<li>${ sighting.description}   </li>
			<li>${ sighting.dateCreated}   </li>
			<li>${ sighting.lastUpdate}   </li>
		</ul>
		<hr>
	</c:forEach>

</body>
</html>