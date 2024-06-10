<%@page import="himedia.EmaillistDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.Arrays" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mailing List</title>

<style>
.num {
	text-align: center;
}
.delete-btn {
	background-color : red;
	color : white;
	border : none;
	padding : 5px 10px;
	text-align : center;
	text-decoration : none;
	display : inline-block;
	cursor : pointer;
	border-radius : 5px;
}
.update-btn {
	background-color : blue;
	color : white;
	border : none;
	padding : 5px 10px;
	text-align : center;
	text-decoration : none;
	display : inline-block;
	cursor : pointer;
	border-radius : 5px;
}
</style>

<script type = "text/javascript">
	function deleteEmail(id) {
		if (confirm("REALLY DELETE?")) {
			window.location.href = "deleteEmail.jsp?id=" + id;
		}
		
	}
</script>
<script type = "text/javascript">
	function updateEmail(id, firstName, lastName, email) {
		window.location.href = "updateEmail.jsp?id=" + id + "&first_name=" + firstName + "&last_name=" + lastName + "&email="+email;
	}
</script>

</head>
<body>

	<h1>Mailing List</h1>
	<table border = "1">
		<tr>
			<th> No. </th>
			<th> First Name </th>
			<th> Last Name </th>
			<th> Email </th>
			<th> Registration Date </th>
			<th> Last Update </th>
			<th> DELETE </th>
			<th> UPDATE </th>
		</tr>
		<%
			EmaillistDao dao = new EmaillistDao();
			List<String[]> emailList = dao.getEmailList();
			for (String [] entry: emailList) {
			
		%>
		<tr>
			<td class = "num"><%= entry[0] %></td>
			<td><%= entry[1] %></td>
			<td><%= entry[2] %></td>
			<td><%= entry[3] %></td>
			<td><%= entry[4] %></td>
			<td><%= entry[5] %></td>
			<td><button class = "delete-btn" onclick="deleteEmail('<%= entry[0] %>')">Delete</button></td>
			<td><button class = "update-btn" onclick="updateEmail('<%= entry[0] %>','<%= entry[1] %>','<%= entry[2] %>','<%= entry[3] %>')">Update</button></td>
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