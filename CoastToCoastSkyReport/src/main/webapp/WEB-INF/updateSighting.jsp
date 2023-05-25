<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="main.css">
<title>Update Sighting</title>
</head>
<body>
	<%@ include file="nav.jsp"%>
	<div style="min-height: 100vh" class="background-image">

		<div class="container">
			<br>





			<c:choose>
				<c:when test="${loggedInUser.id == 1 }">

					<div var="adminSighting" items="${adminSighting}">


						<h1>Update a Sighting</h1>
						<form class="container" action="updatedSighting.do" method="POST">
							<fieldset class="items add">
								<label id="one"> Sighting Title: </label> <input type="text"
									class="form-control" placeholder="${sighting.title}"
									name="title" required> <br> <label id="three">
									Description: </label> <input type="text" class="form-control"
									placeholder="${sighting.description}" name="description"
									required /> <br> <label id="four">Image of
									Sighting: </label> <input type="text" class="form-control"
									placeholder="${sighting.pictureUrl}" name="pictureUrl" /> <br>
								<label id="five">Sighting Address: </label> <input type="text"
									class="form-control" placeholder="${sighting.location.address}"
									name="address" /> <br> <label id="six">Sighting
									City: </label> <input type="text" class="form-control"
									placeholder="${sighting.location.city}" name="city" /> <br>
								<label id="seven">Sighting ZipCode: </label> <input type="text"
									class="form-control" placeholder="${sighting.location.zipcode}"
									name="zipcode" /> <br> <label id="eight">Sighting
									State: </label> <input type="text" class="form-control"
									placeholder="${sighting.location.state}" name="state" /> <br>
								<label id="nine">Sighting Country: </label> <input type="text"
									class="form-control" placeholder="${sighting.location.country}"
									name="country" /> <br> <input type="submit" value="Update" />
							</fieldset>
						</form>
					</div>
				</c:when>
				<c:when
					test="${not empty sessionScope.loggedInUser && sessionScope.loggedInUser.id ne 1}">
					<h2>Update a Sighting</h2>
					<div class="textbox">
						<form class="container" action="updatedSighting.do" method="POST">
							<fieldset class="items add">
								<input type="hidden" name="id" value="${sighting.id }"><br>
								<label id="one"> Sighting Title: </label> <input type="text"
									class="form-control" value="${sighting.title }" name="title"
									required /> <br> <label id="two"> Sighting Date:
								</label> <input type="date" class="form-control"
									value="${sighting.sightingDate}" name="sightingDate" /> <br>
								<label id="three"> Description: </label> <input type="text"
									class="form-control" value="${sighting.description }"
									name="description" required /> <br> <label id="four">Image
									of Sighting: </label> <input type="text" class="form-control"
									value="${sighting.pictureUrl }" name="pictureUrl" /> <br>



                                 KnownObject:
								<select name="knownObject.id" id="knownObject">
									
									<option value="0">UFO</option>
									<option value="2">Comet</option>
									<option value="1">Weather Balloon</option>
									<option value="3">Aurora Borealis</option>
								</select><br>







								<%-- 	ADD Known object	
					
			<label id="four">Known Object: </label> 
			<input type="text" value="${sighting.knownObject.id }" name="sighting.knownObject.id" /> 			
			<br> --%>

								<label id="five">Sighting Address: </label> <input type="text"
									class="form-control" value="${sighting.location.address }"
									name="address" /> <br> <label id="five">Sighting
									City: </label> <input type="text" class="form-control"
									value="${sighting.location.city }" name="city" /> <br> <label
									id="five">Sighting ZipCode: </label> <input type="number"
									class="form-control" value="${sighting.location.zipcode }"
									name="zipcode" /> <br> <label id="five">Sighting
									State: </label> <input type="text" class="form-control"
									value="${sighting.location.state }" name="state" /> <br>
								<label id="five">Sighting Country: </label> <input type="text"
									class="form-control" value="${sighting.location.country }"
									name="country" /> <br> <input type="submit"
									value="Update Sighting" />
							</fieldset>
						</form>
					</div>
				</c:when>

			</c:choose>



























			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
				crossorigin="anonymous"></script>
</body>
</html>