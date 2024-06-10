<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Email</title>
</head>
<body>
	<form action = "updatedEmail.jsp" method = "post">
		<input type = "hidden" name = "id" value = "<%= request.getParameter("id") %>">
		
		<label for = "first_name">First Name:</label>
		<input type = "text" id = "first_name" name = "first_name" value = "<%= request.getParameter("first_name") %>"><br>
		<label for = "last_name">Last Name:</label>
		<input type = "text" id = "last_name" name = "last_name" value = "<%= request.getParameter("last_name") %>"><br>
		<label for = "email">Email:</label>
		<input type = "text" id = "email" name = "email" value = "<%= request.getParameter("email") %>"><br>
		<input type = "submit" value = "Update">
	</form>
</body>
</html>