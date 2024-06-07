<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join Mailing List</title>
</head>
<body>

	<h1>Join Mailing List</h1>
	<form action = "addEmail.jsp" method= "post">
	
		<label for = "first_name">First Name:</label>
		<input type = "text" id = "first_name" name = "first_name" required><br>
		<label for = "last_name">Last Name:</label>
		<input type = "text" id = "last_name" name = "last_name" required><br>
		<label for = "email">Email:</label>
		<input type="email" id = "email" name = "email" required><br>
		<input type = "submit" value = "Join">
	
	</form>

</body>
</html>