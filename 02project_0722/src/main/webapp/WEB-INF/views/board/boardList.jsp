<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Board List</title>
</head>
<body>
    <h1>Board List</h1>
    <table>
        <thead>
            <tr>
                <th>Index</th>
                <th>Title</th>
                <th>Content</th>
                <th>Date</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="board" items="${boards}">
                <tr>
                    <td>${board.b_idx}</td>
                    <td>${board.b_title}</td>
                    <td>${board.b_content}</td>
                    <td>${board.b_date}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
