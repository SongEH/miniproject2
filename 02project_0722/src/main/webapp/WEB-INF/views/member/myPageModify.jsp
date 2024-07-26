<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 정보 수정</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/alpinejs@2.8.2" defer></script>
</head>
<body>
    <div class="container mx-auto p-6">
        <h1 class="text-3xl font-bold mb-6">회원 정보 수정</h1>
        <form action="${pageContext.request.contextPath}/member/mypage/modify.do" method="post">
            <input type="hidden" name="m_idx" value="${member.m_idx}">
            <div class="mb-4">
                <label for="m_name" class="block text-gray-700 text-sm font-bold mb-2">이름</label>
                <input type="text" id="m_name" name="m_name" value="${member.m_name}" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
            </div>
            <div class="mb-4">
                <label for="m_nickname" class="block text-gray-700 text-sm font-bold mb-2">닉네임</label>
                <input type="text" id="m_nickname" name="m_nickname" value="${member.m_nickname}" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
            </div>
            <div class="mb-4">
                <label for="m_email" class="block text-gray-700 text-sm font-bold mb-2">이메일</label>
                <input type="email" id="m_email" name="m_email" value="${member.m_email}" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
            </div>
            <div class="mb-4">
                <label for="m_zipcode" class="block text-gray-700 text-sm font-bold mb-2">우편번호</label>
                <input type="text" id="m_zipcode" name="m_zipcode" value="${member.m_zipcode}" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
            </div>
            <div class="mb-4">
                <label for="m_addr" class="block text-gray-700 text-sm font-bold mb-2">주소</label>
                <input type="text" id="m_addr" name="m_addr" value="${member.m_addr}" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
            </div>
            <div class="flex justify-end">
                <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">저장</button>
            </div>
        </form>
    </div>
<jsp:include page="../footer.jsp" />
</body>
</html>
