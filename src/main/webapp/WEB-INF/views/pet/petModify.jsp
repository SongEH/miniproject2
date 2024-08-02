<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>반려동물 수정</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/alpinejs@2.8.2" defer></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $(function() {
            $("#p_birthday").datepicker({
                dateFormat: "yy-mm-dd"
            });
        });
        
        let petPhoto = pet.p_photo ? '${pageContext.request.contextPath}/resources/images/pets/' + pet.p_photo : '${pageContext.request.contextPath}/resources/images/pets/default.png';
    </script>
    <style>
        .custom-margin-top {
            margin-top: 100px; /* 원하는 위의 공간 크기 (px 단위) */
        }
    </style>
</head>
<body>
    <div class="container mx-auto p-6 custom-margin-top">
        <h1 class="text-3xl font-bold mb-6">반려동물 수정</h1>
        <form action="${pageContext.request.contextPath}/pet/modify.do" method="post" enctype="multipart/form-data">
            <input type="hidden" name="p_idx" value="${pet.p_idx}">
            <input type="hidden" name="m_idx" value="${pet.m_idx}">
            <input type="hidden" name="p_photo" value="${pet.p_photo}">
            <div class="mb-4">
                <label for="p_name" class="block text-gray-700 text-sm font-bold mb-2">이름</label>
                <input type="text" id="p_name" name="p_name" value="${pet.p_name}" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
            </div>
            <div class="mb-4">
                <label for="p_value" class="block text-gray-700 text-sm font-bold mb-2">종류</label>
                <input type="text" id="p_value" name="p_value" value="${pet.p_value}" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
            </div>
            <div class="mb-4">
                <label for="p_breed" class="block text-gray-700 text-sm font-bold mb-2">품종</label>
                <input type="text" id="p_breed" name="p_breed" value="${pet.p_breed}" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
            </div>
            <div class="mb-4">
                <label for="p_birthday" class="block text-gray-700 text-sm font-bold mb-2">생일</label>
                <input type="text" id="p_birthday" name="p_birthday" value="${formattedBirthday}" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
            </div>
            <div class="mb-4">
                <label for="p_gender" class="block text-gray-700 text-sm font-bold mb-2">성별</label>
                <select id="p_gender" name="p_gender" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                    <option value="수컷" ${pet.p_gender == '수컷' ? 'selected' : ''}>수컷</option>
                    <option value="암컷" ${pet.p_gender == '암컷' ? 'selected' : ''}>암컷</option>
                </select>
            </div>
            <div class="mb-4">
                <label for="p_serialNum" class="block text-gray-700 text-sm font-bold mb-2">등록 번호</label>
                <input type="text" id="p_serialNum" name="p_serialNum" value="${pet.p_serialNum}" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
            </div>
            <div class="mb-4">
                <label for="file" class="block text-gray-700">사진</label>
                <input type="file" name="file" id="file" class="w-full px-3 py-2 border rounded">
                <c:if test="${not empty pet.p_photo}">
                    <img src="${pageContext.request.contextPath}/resources/images/pets/${pet.p_photo}" alt="펫 사진" class="w-24 h-24 rounded-full mt-4">
                </c:if>
            </div>
            <div class="flex justify-end">
                <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">수정</button>
            </div>
        </form>
    </div>
<jsp:include page="../footer.jsp" />
<script>
    $(document).ready(function() {
        const formattedBirthday = "${formattedBirthday}";
        if (formattedBirthday) {
            $("#p_birthday").val(formattedBirthday.substring(0, 10)); // 날짜만 표시 (yyyy-mm-dd)
        }
    });
</script>
</body>
</html>
