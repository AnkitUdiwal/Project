<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8"%>
<html>
<head>
    <title>Show Data</title>
</head>
<body>

<%
    // Get the tableName parameter from the URL
    String tableName = request.getParameter("tableName");

    // JDBC connection parameters
    String jdbcUrl = "jdbc:mysql://localhost:3306/springmvc";
    String jdbcUsername = "root";
    String jdbcPassword = "vishwas";

    try {
        // Load the JDBC driver and establish a connection
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection(jdbcUrl, jdbcUsername, jdbcPassword);

        // Create and execute the SQL query
        String query = "SELECT * FROM " + tableName;
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(query);

        // Display data in a table
        out.println("<table border='1'>");

        // Display table header
        ResultSetMetaData metaData = resultSet.getMetaData();
        int columnCount = metaData.getColumnCount();
        out.println("<tr>");
        for (int i = 1; i <= columnCount; i++) {
            out.println("<th>" + metaData.getColumnName(i) + "</th>");
        }
        out.println("</tr>");

        // Display table data
        while (resultSet.next()) {
            out.println("<tr>");
            for (int i = 1; i <= columnCount; i++) {
                out.println("<td>" + resultSet.getString(i) + "</td>");
            }
            out.println("</tr>");
        }

        out.println("</table>");

        // Close resources
        resultSet.close();
        statement.close();
        connection.close();

    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
    }
%>

</body>
</html>
