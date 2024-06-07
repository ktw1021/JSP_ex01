<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "himedia.EmaillistDao" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.Arrays" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mailing List</title>

<style>

</style>

</head>
<body>

	<h1>Mailing List</h1>
	<table border = "1">
		<tr>
			<th> First Name </th>
			<th> Last Name </th>
			<th> Email </th>
		</tr>
		<%
			EmaillistDao dao = new EmaillistDao();
			List<String[]> emailList = dao.getEmailList();
			for (String [] entry: emailList) {
			
		%>
		<tr>
			<td><%= entry[0] %></td>
			<td><%= entry[1] %></td>
			<td><%= entry[2] %></td>
		</tr>
		<%
			}
		%>
		
	</table>
	<br>
	
	<form action = "form.jsp">
	<input type = "submit" value = "등록 페이지로 이동">
	</form>
	
</body>
</html>