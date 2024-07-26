<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   
<h1>Naver News</h1>
    <ul>
        <c:forEach var="item" items="${newsItems}">
            <li>
                <a href="${item.link}" target="_blank">${item.title}</a>
                <p>${item.description}</p>
            </li>
        </c:forEach>
    </ul>
</body>
</html>