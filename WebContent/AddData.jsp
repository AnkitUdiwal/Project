<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.SQLException" %>

<%
String tname = request.getParameter("tname");
String tcols = request.getParameter("t1");
String cnames[] = request.getParameterValues("cname");
String ctypes[] = request.getParameterValues("ctype");
String message = ""; // Variable to hold the response message
%>

<%
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/mvc", "root", "root");
    Statement statement = con.createStatement();

    // Constructing the CREATE TABLE query
    StringBuilder createTableQuery = new StringBuilder();
    createTableQuery.append("CREATE TABLE ").append(tname).append(" (");

    // Adding columns to the query
    for (int i = 0; i < cnames.length; i++) {
        createTableQuery.append(cnames[i]).append(" ").append(ctypes[i]);
        if (i < cnames.length - 1) {
            createTableQuery.append(", ");
        }
    }

    // Adding closing parenthesis
    createTableQuery.append(");");

    // Executing the CREATE TABLE query
    statement.executeUpdate(createTableQuery.toString());

    // Close resources
    statement.close();
    con.close();

    message = "Table '" + tname + "' created successfully.";
} catch (ClassNotFoundException | SQLException e) {
    e.printStackTrace();
    message = "Error creating table. Check the console for details.";
}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Table Creation Result</title>
</head>
<body>
    <h2>Table Creation Result</h2>
    <p><%= message %></p>
</body>
</html>

