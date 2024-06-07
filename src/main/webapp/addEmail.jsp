<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "himedia.EmaillistDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Email Added</title>
</head>
<body>

	<%
		String firstName = request.getParameter("first_name");
		String lastName = request.getParameter("last_name");
		String email = request.getParameter("email");
		
		if (firstName != null && lastName != null && email != null) {
			EmaillistDao dao = new EmaillistDao();
			dao.addEmail(firstName, lastName, email);
	%>
	<p>Thank you for Joining our mailing list, <%= firstName %>!</p>
	<a href = "index.jsp">Back to Mailing List</a>
	<% } 
		else { 
	%>
	<p>Error: All fields are required.</p>
	<a href = "form.jsp">Try Again</a>
	<%
		}
	%>	
		

</body>
</html>