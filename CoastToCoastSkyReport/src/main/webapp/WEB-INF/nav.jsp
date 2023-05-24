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
<title>Navigation Bar</title>
</head>
<body>



	<c:choose>
		<c:when test="${not empty sessionScope.loggedInUser }">
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<div class="container-fluid">
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01"
						aria-controls="navbarTogglerDemo01" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarTogglerDemo01">
						<a class="navbar-brand" href="home.do">Coast-to-Coast
							SkyReport</a>
						<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
							<li class="nav-item"><a class="nav-link" href="account.do">Account</a>
							</li>
							<li class="nav-item"><a class="nav-link" href="logout.do">Logout</a>
							</li>
							<li class="nav-item"><a class="nav-link"
								href="sightingsList.do">All Sightings</a></li>
							<li class="nav-item"><a class="nav-link"
								href="addNewSighting.do">Report Sightings</a></li>
							<li class="nav-item"><a class="nav-link"
								href="deleteSightingRouting.do">Delete Sightings</a></li>
						</ul>
						<form class="d-flex" action=submitKeyword.do method="POST">
							<input class="form-control me-2" type="search" name="keyword"
								placeholder="Search" aria-label="Search">
							<button class="btn btn-outline-success" type="submit"
								name="submit">Search</button>
						</form>
					</div>
				</div>
			</nav>
		</c:when>
		<c:otherwise>
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<div class="container-fluid">
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01"
						aria-controls="navbarTogglerDemo01" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarTogglerDemo01">
						<a class="navbar-brand" href="home.do">Coast-to-Coast
							SkyReport</a>
						<ul class="navbar-nav me-auto mb-2 mb-lg-0">
							<li class="nav-item"><a class="nav-link" href="login.do">Login</a>
							</li>
							<li class="nav-item"><a class="nav-link"
								href="createAccount.do">Create Account</a></li>
							<li class="nav-item"><a class="nav-link"
								href="sightingsList.do">All Sightings</a></li>
						</ul>
						<form class="d-flex" action=submitKeyword.do method="POST">
							<input class="form-control me-2" type="search" name="keyword"
								placeholder="Search" aria-label="Search">
							<button class="btn btn-outline-success" type="submit"
								name="submit">Search</button>
						</form>
					</div>
				</div>
			</nav>
		</c:otherwise>
	</c:choose>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>

</body>
</html>