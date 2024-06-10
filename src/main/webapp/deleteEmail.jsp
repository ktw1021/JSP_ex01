<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "himedia.EmaillistDao" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Email Deleted</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		if (id != null) {
			EmaillistDao dao = new EmaillistDao();
			dao.deleteEmail(id);
	%>
	<h1>Email Deleted Successfully</h1>
	<% } else { %>
	<h1>Error: Email ID not provided</h1>
	<% }  %>
	
	<br>
	<br>
	<a href = "<%= request.getContextPath()  %>">Mailing List</a>
</body>
</html>