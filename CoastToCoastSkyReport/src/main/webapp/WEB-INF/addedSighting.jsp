<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

</body>
</html>