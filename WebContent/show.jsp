<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Table Names</title>
</head>
<body>
    <h2>Tables in the Database</h2>
    <ul>
        <c:forEach var="tableName" items="${tableNames}">
         <a href="operations.jsp?tableName=${tableName}"><li> ${tableName}.</li></a> click to perform operations
        </c:forEach>
    </ul>
</body>
</html>
