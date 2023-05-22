<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:choose> 
<c:when test="${! empty sightingsList }" >

	<c:forEach var="sighting" items="${sightingsList}">
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
	</c:forEach>
	</c:when>
	<c:otherwise>
	No Results Found
	</c:otherwise>
</c:choose>
</body>
</html>