<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="container">

<c:choose>
		<c:when test="${! empty sighting}">
			
				
		
				<ul>
					<li><div class="grow">Coin ID: ${sighting.title}</div></li>
					<li><div class="grow">Type: ${sighting.sightingDate}</div></li>
					<li><div class="grow">Mint: ${sighting.description}</div></li>
				</ul>
			
				
			
		</c:when>
		
		<c:otherwise>
			<p>Empty<p>
		</c:otherwise>
	</c:choose>
</div>

</body>
</html>