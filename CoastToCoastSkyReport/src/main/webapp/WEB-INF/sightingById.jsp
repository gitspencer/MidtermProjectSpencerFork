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
<title>Sighting by Id</title>
</head>
<body>
	<%@ include file="nav.jsp"%>
	<div style="min-height: 100vh" class="background-image">

		<div class="container">

			<br>

			<h2>${sighting.title}</h2>

			<div class="row">
				<div class="col-lg-1"></div>
				<div class="col-lg-5">

					<img src="${sighting.pictureUrl}" alt="Picture of UFO!" width="500"
						height="350">
				</div>
				<div class="col-lg-5">
					<div class="map-container">
						<iframe
							src="https://www.google.com/maps?q=${sighting.location.zipcode }&z=9&output=embed"
							width="500" height="350" frameborder="0" style="border: 0"
							allowfullscreen> </iframe>
					</div>
				</div>
				<div class="col-lg-1"></div>

				<br>
				<ul class="list-unstyled">
					<li><div class="grow">Sighting Date:
							${sighting.sightingDate}</div></li>
							<br>
					<li><div class="grow">Location:
							${sighting.location.city}</div></li>
							<br>
					<li><div class="grow">Description:
							${sighting.description}</div></li>
							<br>
					
					<c:choose>
						<c:when test="${not empty sighting.knownObject}">

							<li>Category: ${sighting.knownObject.name}</li>
							<li><img src="${sighting.knownObject.pictureUrl}"
								alt="picture of category" width="150" height="90"></li>

							<li>${sighting.knownObject.description}</li>
						</c:when>
						<c:otherwise>
							<li>Category: UFO</li>
						</c:otherwise>

					</c:choose>

				</ul>
				<c:forEach items="${sightingRatings}" var="sightingRating">
					<c:choose>
						<c:when test="${sightingRating.rating == 1}">
							<p>Rating: &#x1F47D</p>
						</c:when>
						<c:when test="${sightingRating.rating == 2}">
							<p>Rating: &#x1F47D &#x1F47D</p>
						</c:when>
						<c:when test="${sightingRating.rating == 3}">
							<p>Rating: &#x1F47D &#x1F47D &#x1F47D</p>
						</c:when>
						<c:when test="${sightingRating.rating == 4}">
							<p>Rating: &#x1F47D &#x1F47D &#x1F47D &#x1F47D</p>
						</c:when>
						<c:when test="${sightingRating.rating == 5}">
							<p>Rating: &#x1F47D &#x1F47D &#x1F47D &#x1F47D &#x1F47D</p>
						</c:when>
					</c:choose>
				</c:forEach>
			</div>

				
				






<c:forEach var="comment" items="${commentList}">

<section>
  <div class="container my-3 py-3">
    <div class="row d-flex justify-content-center">
      <div class="col-md-7 col-lg-10 col-xl-5">
     <div class="row">
				<div class="col-lg-1"></div>
				<div class="col-lg-1">
                  <img src="${comment.user.pictureUrl}" alt="profile picture" width="50" height="50" />
                     ${comment.user.username} 
     
             </div>
				<div class="col-lg-20">       
      
        <div class="card text-white bg-transparent mb-3" style="max-width: 40 rem;">
          <div class="card-body p-3">

            <div class="row">
              <div class="col">
                <div class="d-flex flex-start">
                   
                     </div>
                  <div class="flex-grow-1 flex-shrink-1">
                   
                      <div>
                        
                      </div>
                      <p class="small mb-0">
                      
                       ${comment.content}
                      </p>
                    </div>
                        <a href="#!"><i class="fas fa-reply fa-xs"></i><span class="small"> reply</span></a>
                    
                    
                    </div>
				</div>
				<div class="col-lg-1"></div>

  </div>
                    
                         
                        </div> 
                      </div>
                    </div>
                  </div>
                </div>
              </div>
</section>
          
    
</c:forEach>













			
			<form action="createSightingComment.do">
				<input type="hidden" value="${sighting.id }" name="sightingId">
				<textarea name="content" cols="35" rows="7"></textarea>
				<button type="submit" name="comment">Comment</button>




			</form>

			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
				crossorigin="anonymous"></script>

		</div>
	</div>
</body>
</html>