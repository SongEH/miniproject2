<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../admin/topForAdmin.jsp" %>
<%@ include file="../admin/topMenu.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 상세</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/alpinejs@2.8.2" defer></script>
</head>
<body class="bg-gray-100">
    <div class="container mx-auto p-6">
        <h1 class="text-3xl font-bold mb-6">회원 상세정보</h1>
        <div class="bg-white shadow-md rounded-lg overflow-hidden">
            <table class="min-w-full bg-white">
                <tbody>
                    <tr class="border-b">
                        <th class="py-3 px-6 bg-gray-50 text-left">Index</th>
                        <td class="py-3 px-6">${member.m_idx}</td>
                    </tr>
                    <tr class="border-b">
                        <th class="py-3 px-6 bg-gray-50 text-left">이름</th>
                        <td class="py-3 px-6">${member.m_name}</td>
                    </tr>
                    <tr class="border-b">
                        <th class="py-3 px-6 bg-gray-50 text-left">닉네임</th>
                        <td class="py-3 px-6">${member.m_nickname}</td>
                    </tr>
                    <tr class="border-b">
                        <th class="py-3 px-6 bg-gray-50 text-left">이메일</th>
                        <td class="py-3 px-6">${member.m_email}</td>
                    </tr>
                    <tr class="border-b">
                        <th class="py-3 px-6 bg-gray-50 text-left">우편번호</th>
                        <td class="py-3 px-6">${member.m_zipcode}</td>
                    </tr>
                    <tr class="border-b">
                        <th class="py-3 px-6 bg-gray-50 text-left">주소</th>
                        <td class="py-3 px-6">${member.m_addr}</td>
                    </tr>
                    <tr class="border-b">
                        <th class="py-3 px-6 bg-gray-50 text-left">가입일자</th>
                        <td class="py-3 px-6">${member.m_rdate}</td>
                    </tr>
                    <tr class="border-b">
                        <th class="py-3 px-6 bg-gray-50 text-left">등급</th>
                        <td class="py-3 px-6">${member.m_grade}</td>
                    </tr>
                </tbody>
            </table>
            <div class="flex justify-between mt-4 p-4">
                <a href="${pageContext.request.contextPath}/member/list.do?page=1" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">목록으로 가기</a>
                <div class="flex space-x-2">
                    <a href="${pageContext.request.contextPath}/member/modify.do?m_idx=${member.m_idx}" class="bg-yellow-500 hover:bg-yellow-700 text-white font-bold py-2 px-4 rounded">수정</a>
                    <a href="${pageContext.request.contextPath}/member/delete.do?m_idx=${member.m_idx}" class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
                </div> 
            </div>           
        </div>
    </div>
<jsp:include page="../footer.jsp" />
</body>
</html>