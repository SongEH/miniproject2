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
   
<h1>출력</h1>

    <ul>
        <c:forEach var="location" items="${ locations}">
            <li>
                 <div class="panel panel-success">
      <div class="panel-heading"><a href="${location.l_URL }">${location.l_name}</a></div>
      <div class="panel-body">${ location.l_addr }</div>
      </div>
            	<%-- <p>${location.l_sido}</p>
                <p>${location.l_cate}</p>
                <p>${location.l_name}</p>
                <p>${location.l_addr}</p>
                <p>${location.l_opentime}</p>
                <p>${location.l_price}</p> --%>
            </li>
        </c:forEach>
    </ul>

</body>
</html>