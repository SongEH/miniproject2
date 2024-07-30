<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Board Detail</title>
</head>
<body>
    <h1>Board Detail</h1>
    <table>
        <tr>
            <th>Index</th>
            <td>${board.b_idx}</td>
        </tr>
        <tr>
            <th>Title</th>
            <td>${board.b_title}</td>
        </tr>
        <tr>
            <th>Content</th>
            <td>${board.b_content}</td>
        </tr>
        <tr>
            <th>Date</th>
            <td>${board.b_date}</td>
        </tr>
    </table>
</body>
</html>
