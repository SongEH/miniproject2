<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>반려동물 등록</title>
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
    </script>
    <style>
        .custom-margin-top {
            margin-top: 100px; /* 원하는 위의 공간 크기 (px 단위) */
        }
    </style>
</head>
<body>
    <div class="container mx-auto p-6 custom-margin-top">
        <h1 class="text-3xl font-bold mb-6">반려동물 등록</h1>
        <form action="${pageContext.request.contextPath}/pet/register.do" method="post" enctype="multipart/form-data">
            <input type="hidden" name="m_idx" value="${m_idx}">
            <div class="mb-4">
                <label for="p_name" class="block text-gray-700 text-sm font-bold mb-2">이름</label>
                <input type="text" id="p_name" name="p_name" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
            </div>
            <div class="mb-4">
                <label for="p_value" class="block text-gray-700 text-sm font-bold mb-2">종류</label>
                <input type="text" id="p_value" name="p_value" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
            </div>
            <div class="mb-4">
                <label for="p_breed" class="block text-gray-700 text-sm font-bold mb-2">품종</label>
                <input type="text" id="p_breed" name="p_breed" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
            </div>
            <div class="mb-4">
                <label for="p_birthday" class="block text-gray-700 text-sm font-bold mb-2">생일</label>
                <input type="text" id="p_birthday" name="p_birthday" value="${formattedBirthday}" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
            </div>
            <div class="mb-4">
                <label for="p_gender" class="block text-gray-700 text-sm font-bold mb-2">성별</label>
                <select id="p_gender" name="p_gender" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                    <option value="수컷">수컷</option>
                    <option value="암컷">암컷</option>
                </select>
            </div>
            <div class="mb-4">
                <label for="p_serialNum" class="block text-gray-700 text-sm font-bold mb-2">등록 번호</label>
                <input type="text" id="p_serialNum" name="p_serialNum" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
            </div>
            <div class="mb-4">
                <label for="file" class="block text-gray-700">사진</label>
                <input type="file" name="file" id="file" class="w-full px-3 py-2 border rounded">
            </div>
            <div class="flex justify-end">
                <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">등록</button>
            </div>
        </form>
    </div>
<jsp:include page="../footer.jsp" />
</body>
</html>
