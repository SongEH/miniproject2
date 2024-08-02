<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="topForAdmin.jsp" %>
<%@ include file="topMenu.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>반려동물 진료 기록 상세</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/alpinejs@2.8.2" defer></script>
</head>
<body class="bg-gray-100">
    <div class="container mx-auto p-6">
        <h1 class="text-3xl font-bold mb-6">반려동물 진료 기록 상세</h1>
        <div class="bg-white shadow-md rounded-lg p-6">
            <table class="min-w-full bg-white">
                <tbody>
                    <tr class="border-b">
                        <th class="py-3 px-6 bg-gray-50 text-left">진료 번호</th>
                        <td class="py-3 px-6">${health.h_idx}</td>
                    </tr>
                    <tr class="border-b">
                        <th class="py-3 px-6 bg-gray-50 text-left">회원 이름</th>
                        <td class="py-3 px-6">${health.m_name}</td>
                    </tr>
                    <tr class="border-b">
                        <th class="py-3 px-6 bg-gray-50 text-left">반려동물 이름</th>
                        <td class="py-3 px-6">${health.pet_name}</td>
                    </tr>
                    <tr class="border-b">
                        <th class="py-3 px-6 bg-gray-50 text-left">진료 유형</th>
                        <td class="py-3 px-6">${health.h_type}</td>
                    </tr>
                    <tr class="border-b">
                        <th class="py-3 px-6 bg-gray-50 text-left">진료 날짜</th>
                        <td class="py-3 px-6">${formattedHdate.substring(0,10)}</td>
                    </tr>
                    <tr class="border-b">
                        <th class="py-3 px-6 bg-gray-50 text-left">진료 시간</th>
                        <td class="py-3 px-6">${health.h_time}</td>
                    </tr>
                    <tr class="border-b">
                        <th class="py-3 px-6 bg-gray-50 text-left">비용</th>
                        <td class="py-3 px-6">${health.h_cost}&nbsp만원</td>
                    </tr>
                    <tr class="border-b">
                        <th class="py-3 px-6 bg-gray-50 text-left">내용</th>
                        <td class="py-3 px-6">${health.h_content}</td>
                    </tr>
                    <tr class="border-b">
                        <th class="py-3 px-6 bg-gray-50 text-left">병원 이름</th>
                        <td class="py-3 px-6">${health.h_hname}</td>
                    </tr>
                    <tr>
                        <th class="py-3 px-6 bg-gray-50 text-left">다음 예약 날짜</th>
                        <td class="py-3 px-6">${formattedHndate.substring(0,10)}</td>
                    </tr>
                </tbody>
            </table>
            <div class="flex justify-between mt-4">
                <a href="${pageContext.request.contextPath}/admin/healthList.do" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">목록으로</a>
                <div class="flex space-x-2">
                    <a href="${pageContext.request.contextPath}/admin/healthDelete.do?h_idx=${health.h_idx}" class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../footer.jsp" />
<script>
    $(document).ready(function() {
        const formattedHdate = "${formattedHdate}";
        if (formattedHdate) {
            $("#h_rdate").val(formattedHdate.substring(0, 10)); // 날짜만 표시 (yyyy-mm-dd)
        }
    });
    $(document).ready(function() {
        const formattedHndate = "${formattedHndate}";
        if (formattedHndate) {
            $("#h_ndate").val(formattedHndate.substring(0, 10)); // 날짜만 표시 (yyyy-mm-dd)
        }
    });
</script>
</body>
</html>
