<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="topForAdmin.jsp" %>
<%@ include file="topMenu.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>반려동물 진료 기록 수정</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/alpinejs@2.8.2" defer></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ui-timepicker-addon/1.6.3/jquery-ui-timepicker-addon.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-ui-timepicker-addon/1.6.3/jquery-ui-timepicker-addon.min.css">
    <style>
        input[readonly] {
            background-color: #f9f9f9;
            cursor: not-allowed;
        }
    </style>
    
    <script>
        $(function() {
            $("#h_rdate").datepicker({
                dateFormat: "yy-mm-dd"
            });
            $("#h_time").timepicker({
                timeFormat: "HH:mm"
            });
            $("#h_ndate").datepicker({
                dateFormat: "yy-mm-dd"
            });
        });

        function send(f){
            var timeField = $("#h_time").val();
            if (timeField.length == 5) {
                $("#h_time").val(timeField + ":00");
            }
            f.submit();
        }
    </script>   
</head>
<body class="bg-gray-100">
    <div class="container mx-auto p-6">
        <h1 class="text-3xl font-bold mb-6">반려동물 진료 기록 수정</h1>
        <div class="bg-white shadow-md rounded-lg p-6">
            <form action="${pageContext.request.contextPath}/admin/healthModify.do" method="post">
                <input type="hidden" name="h_idx" value="${health.h_idx}">
                <div class="mb-4">
                    <label for="m_name" class="block text-gray-700 font-bold mb-2">회원 이름</label>
                    <input type="text" id="m_name" name="m_name" value="${health.m_name}" class="w-full p-2 border border-gray-300 rounded" readonly>
                </div>
                <div class="mb-4">
                    <label for="pet_name" class="block text-gray-700 font-bold mb-2">반려동물 이름</label>
                    <input type="text" id="pet_name" name="pet_name" value="${health.pet_name}" class="w-full p-2 border border-gray-300 rounded" readonly>
                </div>
                <div class="mb-4">
	                <label for="h_type" class="block text-gray-700 text-sm font-bold mb-2">진료 유형</label>
	                <select id="h_type" name="h_type" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
	                    <option value="진료" ${health.h_type == '진료' ? 'selected' : ''}>진료</option>
	                    <option value="검진" ${health.h_type == '검진' ? 'selected' : ''}>검진</option>
	                    <option value="치료" ${health.h_type == '치료' ? 'selected' : ''}>치료</option>
	                    <option value="수술" ${health.h_type == '수술' ? 'selected' : ''}>수술</option>
	                    <option value="상담" ${health.h_type == '상담' ? 'selected' : ''}>검진</option>
	                </select>
	            </div>
                <div class="mb-4">
                    <label for="h_rdate" class="block text-gray-700 font-bold mb-2">진료 날짜</label>
                    <input type="text" id="h_rdate" name="h_rdate" value="${formattedHdate}" class="w-full p-2 border border-gray-300 rounded">
                </div>
                <div class="mb-4">
                    <label for="h_time" class="block text-gray-700 font-bold mb-2">진료 시간 (HH:mm)</label>
                    <input type="text" id="h_time" name="h_time" value="${health.h_time != null ? fn:substring(health.h_time, 0, 5) : ''}" class="w-full p-2 border border-gray-300 rounded" placeholder="HH:mm">
                </div>
                <div class="mb-4">
                    <label for="h_cost" class="block text-gray-700 font-bold mb-2">비용(만원)</label>
                    <input type="text" id="h_cost" name="h_cost" value="${health.h_cost}" class="w-full p-2 border border-gray-300 rounded">
                </div>
                <div class="mb-4">
                    <label for="h_content" class="block text-gray-700 font-bold mb-2">내용</label>
                    <input type="text" id="h_content" name="h_content" value="${health.h_content}" class="w-full p-2 border border-gray-300 rounded">
                </div>
                <div class="mb-4">
                    <label for="h_hname" class="block text-gray-700 font-bold mb-2">병원 이름</label>
                    <input type="text" id="h_hname" name="h_hname" value="${health.h_hname}" class="w-full p-2 border border-gray-300 rounded">
                </div>
                <div class="mb-4">
                    <label for="h_ndate" class="block text-gray-700 font-bold mb-2">다음 예약 날짜</label>
                    <input type="text" id="h_ndate" name="h_ndate" value="${formattedHndate}" class="w-full p-2 border border-gray-300 rounded">
                </div>
                <div class="flex justify-end">
                    <input type="button" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded" value="저장" onclick="send(this.form);">
                </div>
            </form>
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
