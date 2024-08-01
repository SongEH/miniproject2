<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="topForAdmin.jsp" %>
<%@ include file="topMenu.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 리스트</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/alpinejs@2.8.2" defer></script>
</head>
<body class="bg-gray-100">
    <div class="container mx-auto p-6">
        <h1 class="text-3xl font-bold mb-6">게시글 리스트</h1>
        <form method="get" action="${pageContext.request.contextPath}/admin/boardList.do" class="mb-6">
            <div class="flex justify-end space-x-4 items-end">
                <div>
                    <input type="text" name="searchKeyword" placeholder="검색어 입력" value="${searchKeyword}" class="border px-4 py-2 rounded w-64 focus:outline-none focus:ring-2 focus:ring-blue-500">
                </div>
                <div>
                    <select name="b_cate" class="border px-4 py-2 rounded w-32 focus:outline-none focus:ring-2 focus:ring-blue-500">
                        <option value="">전체 카테고리</option>
                        <option value="free" ${b_cate == 'free' ? 'selected' : ''}>자유</option>
                        <option value="medical" ${b_cate == 'medical' ? 'selected' : ''}>의료</option>
                        <option value="mate" ${b_cate == 'mate' ? 'selected' : ''}>반려</option>
                    </select>
                </div>
                <div>
                    <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 transition duration-300">검색</button>
                </div>
            </div>
        </form>
        <div class="bg-white shadow-md rounded-lg overflow-hidden">
            <table class="min-w-full bg-white">
                <thead class="bg-gray-200">
                    <tr>
                        <th class="py-3 px-6 text-left">Index</th>
                        <th class="py-3 px-6 text-left">제목</th>
                        <th class="py-3 px-6 text-left">작성자</th>
                        <th class="py-3 px-6 text-left">작성일</th>
                        <th class="py-3 px-6 text-center">상세정보</th>
                        <th class="py-3 px-6 text-center">삭제</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="board" items="${boards}">
                        <tr class="border-b">
                            <td class="py-3 px-6">${board.b_idx}</td>
                            <td class="py-3 px-6">${board.b_title}</td>
                            <td class="py-3 px-6">${board.m_name}</td>
                            <td class="py-3 px-6">${board.b_rdate}</td>
                            <td class="py-2 text-center">
                                <a href="${pageContext.request.contextPath}/board/view.do?b_idx=${board.b_idx}" class="text-blue-500 hover:underline">상세정보</a>
                            </td>
                            <td class="py-2 text-center">
                                <a href="${pageContext.request.contextPath}/board/delete.do?b_idx=${board.b_idx}" class="text-red-500 hover:underline" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div class="flex justify-center mt-6">
                <nav class="inline-flex rounded-md shadow">
                    <c:if test="${currentPage > 1}">
                        <a href="${pageContext.request.contextPath}/admin/boardList.do?page=${currentPage - 1}" class="py-2 px-3 leading-tight bg-white border border-gray-300 text-gray-500 hover:bg-gray-100">이전</a>
                    </c:if>
                    <c:forEach var="i" begin="1" end="${totalPages}">
                        <a href="${pageContext.request.contextPath}/admin/boardList.do?page=${i}" class="py-2 px-3 leading-tight border ${i == currentPage ? 'bg-blue-500 text-white' : 'bg-white border-gray-300 text-gray-500 hover:bg-gray-100'}">${i}</a>
                    </c:forEach>
                    <c:if test="${currentPage < totalPages}">
                        <a href="${pageContext.request.contextPath}/admin/boardList.do?page=${currentPage + 1}" class="py-2 px-3 leading-tight bg-white border border-gray-300 text-gray-500 hover:bg-gray-100">다음</a>
                    </c:if>
                </nav>
            </div>
        </div>
		<div class="flex justify-center mt-6">
		<a href="${pageContext.request.contextPath}/admin/menu" class="bg-blue-500 text-white py-2 px-4 rounded-full shadow-lg hover:bg-blue-600 transition duration-300">메뉴로 돌아가기</a>
		</div>
        <jsp:include page="../footer.jsp" />
    </div>
</body>
</html>
