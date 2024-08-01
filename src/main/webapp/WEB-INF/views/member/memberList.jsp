<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../admin/topForAdmin.jsp" %>
<%@ include file="../admin/topMenu.jsp" %>
<%
    java.util.Calendar cal = java.util.Calendar.getInstance();
    int currentYear = cal.get(java.util.Calendar.YEAR);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 리스트</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/alpinejs@2.8.2" defer></script>
</head>
<body class="bg-gray-100">
    <div class="container mx-auto p-6">
        <h1 class="text-3xl font-bold mb-6">회원 리스트</h1>
        <form method="get" action="${pageContext.request.contextPath}/member/list.do" class="mb-6">
            <div class="flex justify-end space-x-4 items-end">
                <div>
                    <input type="text" name="searchKeyword" placeholder="검색어 입력" value="${searchKeyword}" class="border px-4 py-2 rounded w-64 focus:outline-none focus:ring-2 focus:ring-blue-500">
                </div>
                <div>
                    <select name="gradeFilter" class="border px-4 py-2 rounded w-32 focus:outline-none focus:ring-2 focus:ring-blue-500">
                        <option value="">전체등급</option>
                        <option value="관리자" ${gradeFilter == '관리자' ? 'selected' : ''}>관리자</option>
                        <option value="일반" ${gradeFilter == '일반' ? 'selected' : ''}>일반</option>
                    </select>
                </div>
                <div>
                    <select name="yearFilter" class="border px-4 py-2 rounded w-32 focus:outline-none focus:ring-2 focus:ring-blue-500">
                        <option value="">전체가입년도</option>
                        <c:forEach var="year" begin="2020" end="<%= currentYear %>">
                            <option value="${year}" ${yearFilter == year ? 'selected' : ''}>${year}</option>
                        </c:forEach>
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
                        <th class="py-3 px-6 text-left">이름</th>
                        <th class="py-3 px-6 text-left">닉네임</th>
                        <th class="py-3 px-6 text-left">이메일</th>
                        <th class="py-3 px-6 text-center">상세정보</th>
                        <th class="py-3 px-6 text-center">수정</th>
                        <th class="py-3 px-6 text-center">삭제</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="member" items="${members}">
                        <tr class="border-b">
                            <td class="py-3 px-6">${member.m_idx}</td>
                            <td class="py-3 px-6">${member.m_name}</td>
                            <td class="py-3 px-6">${member.m_nickname}</td>
                            <td class="py-3 px-6">${member.m_email}</td>
                            <td class="py-2 text-center">
                                <a href="${pageContext.request.contextPath}/member/detail.do?m_idx=${member.m_idx}" class="text-blue-500 hover:underline">상세정보</a>
                            </td>
                            <td class="py-2 text-center">
                                <a href="${pageContext.request.contextPath}/member/modify.do?m_idx=${member.m_idx}" class="text-blue-500 hover:underline">수정</a>
                            </td>
                            <td class="py-2 text-center" onclick="return confirm('정말 삭제하시겠습니까?');">
                                <a href="${pageContext.request.contextPath}/member/delete.do?m_idx=${member.m_idx}" class="text-red-500 hover:underline">삭제</a>
                            </td>                    
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div class="flex justify-center mt-6">
                <nav class="inline-flex rounded-md shadow">
                    <c:if test="${currentPage > 1}">
                        <a href="${pageContext.request.contextPath}/member/list.do?page=${currentPage - 1}" class="py-2 px-3 leading-tight bg-white border border-gray-300 text-gray-500 hover:bg-gray-100">이전</a>
                    </c:if>
                    <c:forEach var="i" begin="${startPage}" end="${endPage}">
                        <a href="${pageContext.request.contextPath}/member/list.do?page=${i}" class="py-2 px-3 leading-tight border ${i == currentPage ? 'bg-blue-500 text-white' : 'bg-white border-gray-300 text-gray-500 hover:bg-gray-100'}">${i}</a>
                    </c:forEach>
                    <c:if test="${currentPage < totalPages}">
                        <a href="${pageContext.request.contextPath}/member/list.do?page=${currentPage + 1}" class="py-2 px-3 leading-tight bg-white border border-gray-300 text-gray-500 hover:bg-gray-100">다음</a>
                    </c:if>
                </nav>
            </div>
            <div class="flex justify-center mt-6">
                <a href="${pageContext.request.contextPath}/admin/menu" class="bg-blue-500 text-white py-2 px-4 rounded-full shadow-lg hover:bg-blue-600 transition duration-300">메뉴로 돌아가기</a>
            </div>
        </div>
        <jsp:include page="../footer.jsp" />
    </div>
</body>
</html>
