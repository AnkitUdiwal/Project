<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Insert title here</title>
</head>
<body>
    <%
        String tableName = request.getParameter("tableName");
    %>
    <h1><%= tableName %></h1>
    <h3><a href="show1.jsp?tableName=<%= tableName %>">Show</a></h3><br>
    <h3><a href="add.jsp">Add</a></h3><br>
    <h3><a href="delete.jsp">Delete</a></h3><br>
    <h3><a href="update.jsp">Update</a></h3><br>
</body>
</html>
