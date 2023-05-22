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
		<form class="container" action="submitKeyword.do" method="POST">
Lookup Sightings By Keyword
<input type= "text" name= "keyword" />
<button type="submit" name="submit">Submit</button>

</form>
</body>
</html>