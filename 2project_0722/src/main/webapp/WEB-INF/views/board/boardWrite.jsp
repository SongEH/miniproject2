<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Write Board</title>
</head>
<body>
    <h1>Write Board</h1>
    <form action="write" method="post">
        <input type="hidden" name="m_idx" value="1">
        <label for="title">Title:</label>
        <input type="text" id="title" name="b_title"><br>
        <label for="content">Content:</label>
        <textarea id="content" name="b_content"></textarea><br>
        <button type="submit">Submit</button>
    </form>
</body>
</html>
