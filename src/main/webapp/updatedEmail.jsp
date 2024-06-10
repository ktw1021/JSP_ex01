<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "himedia.EmaillistDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Updated Email</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String firstName = request.getParameter("first_name");
		String lastName = request.getParameter("last_name");
		String email = request.getParameter("email");
		
		if (id != null && firstName != null && lastName != null && email != null) {
			EmaillistDao dao = new EmaillistDao();
			dao.updateEmail(id, firstName, lastName, email);
		
	%>
	<h1>Email Updated Successfully</h1>
	<p>Last Update Time : <%= new java.util.Date() %></p>
	<br>
	<br>
	
	<a href = "index.jsp">Back to Mailing List</a>
	<% } else { %>
	<h1>ERROR: All fields are required</h1>
	<% } %>
</body>
</html>