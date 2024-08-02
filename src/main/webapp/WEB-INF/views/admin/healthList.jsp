<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="topForAdmin.jsp" %>
<%@ include file="topMenu.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>반려동물 진료 목록</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/alpinejs@2.8.2" defer></script>
</head>
<body class="bg-gray-100">
    <div class="container mx-auto p-6">
        <h1 class="text-3xl font-bold mb-6">반려동물 진료 목록</h1>
        <form method="get" action="${pageContext.request.contextPath}/admin/healthList.do" class="mb-4">
            <div class="flex w-full">
                <input type="text" name="searchKeyword" placeholder="검색어 입력" class="shadow appearance-none border rounded w-1/3 py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded ml-2">검색</button>
            </div>
        </form>
        <div class="bg-white shadow-md rounded-lg overflow-hidden">
            <table class="min-w-full bg-white">
                <thead class="bg-gray-200">
                    <tr>
                        <th class="py-3 px-6 text-left">진료 번호</th>
                        <th class="py-3 px-6 text-left">회원 이름</th>
                        <th class="py-3 px-6 text-left">반려동물 이름</th>
                        <th class="py-3 px-6 text-left">진료 타입</th>
                        <th class="py-3 px-6 text-left">진료 내용</th>
                        <th class="py-3 px-6 text-center">상세정보</th>
                        <th class="py-3 px-6 text-center">삭제</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="health" items="${healthRecords}">
                        <tr class="border-b">
                            <td class="py-3 px-6">${health.h_idx}</td>
                            <td class="py-3 px-6">${health.m_name}</td>
                            <td class="py-3 px-6">${health.pet_name}</td>
                            <td class="py-3 px-6">${health.h_type}</td>
                            <td class="py-3 px-6">${health.h_content}</td>
                            <td class="py-2 text-center">
                                <a href="${pageContext.request.contextPath}/admin/healthDetail.do?h_idx=${health.h_idx}" class="text-blue-500 hover:underline">상세정보</a>
                            </td>
                            <td class="py-2 text-center">
                                <a href="${pageContext.request.contextPath}/admin/healthDelete.do?h_idx=${health.h_idx}" class="text-red-500 hover:underline" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div class="flex justify-center mt-6">
                <nav class="inline-flex rounded-md shadow">
                    <c:if test="${currentPage > 1}">
                        <a href="${pageContext.request.contextPath}/admin/healthList.do?page=${currentPage - 1}" class="py-2 px-3 leading-tight bg-white border border-gray-300 text-gray-500 hover:bg-gray-100">이전</a>
                    </c:if>
                    <c:forEach var="i" begin="1" end="${totalPages}">
                        <a href="${pageContext.request.contextPath}/admin/healthList.do?page=${i}" class="py-2 px-3 leading-tight border ${i == currentPage ? 'bg-blue-500 text-white' : 'bg-white border-gray-300 text-gray-500 hover:bg-gray-100'}">${i}</a>
                    </c:forEach>
                    <c:if test="${currentPage < totalPages}">
                        <a href="${pageContext.request.contextPath}/admin/healthList.do?page=${currentPage + 1}" class="py-2 px-3 leading-tight bg-white border border-gray-300 text-gray-500 hover:bg-gray-100">다음</a>
                    </c:if>
                </nav>
            </div>
        </div>
	<div class="flex justify-center mt-6">
		<a href="${pageContext.request.contextPath}/admin/menu" class="bg-blue-500 text-white py-2 px-4 rounded-full shadow-lg hover:bg-blue-600 transition duration-300">메뉴로 돌아가기</a>
	</div>
    </div>
<jsp:include page="../footer.jsp" />
</body>
</html>
