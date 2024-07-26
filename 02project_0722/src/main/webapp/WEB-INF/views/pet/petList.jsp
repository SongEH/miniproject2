<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Pet List</title>
</head>
<body>
    <h1>Pet List</h1>
    <table>
        <thead>
            <tr>
                <th>Index</th>
                <th>Name</th>
                <th>Breed</th>
                <th>Birthday</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="pet" items="${pets}">
                <tr>
                    <td>${pet.p_idx}</td>
                    <td>${pet.p_name}</td>
                    <td>${pet.p_breed}</td>
                    <td>${pet.p_birthday}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
