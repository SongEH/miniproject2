<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="topForAdmin.jsp" %>
<%@ include file="topMenu.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 메뉴</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/alpinejs@2.8.2" defer></script>
    <style>
        .menu-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 15px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body class="bg-gray-100">

    <!-- Main Content -->
    <div class="container mx-auto p-6">
        <h1 class="text-4xl font-bold text-center text-gray-800 mb-8">관리자 메뉴</h1>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            <div x-data="{ showContent: false }" class="menu-card bg-white p-4 rounded-lg shadow-lg text-center cursor-pointer transition transform duration-200" @click="showContent = !showContent">
                <p class="text-gray-700 mb-4">회원 관리메뉴</p>
                <template x-if="!showContent">
                    <img src="${pageContext.request.contextPath}/resources/images/member_img.jpg" alt="회원 관리메뉴" class="mx-auto mb-4">
                </template>
                <template x-if="showContent">
                    <div>
                        <a href="${pageContext.request.contextPath}/member/list.do" class="block py-2 text-gray-600 hover:bg-gray-100">회원 목록</a>
                        <a href="${pageContext.request.contextPath}/admin/register.do" class="block py-2 text-gray-600 hover:bg-gray-100">회원 등록</a>
                    </div>
                </template>
            </div>
            <div x-data="{ showContent: false }" class="menu-card bg-white p-4 rounded-lg shadow-lg text-center cursor-pointer transition transform duration-200" @click="showContent = !showContent">
                <p class="text-gray-700 mb-4">게시판 관리메뉴</p>
                <template x-if="!showContent">
                    <img src="${pageContext.request.contextPath}/resources/images/board_img.jpg" alt="게시판 관리메뉴" class="mx-auto mb-4">
                </template>
                <template x-if="showContent">
                    <div>
                        <a href="${pageContext.request.contextPath}/admin/boardList.do" class="block py-2 text-gray-600 hover:bg-gray-100">게시글 목록</a>
                    </div>
                </template>
            </div>
            <div x-data="{ showContent: false }" class="menu-card bg-white p-4 rounded-lg shadow-lg text-center cursor-pointer transition transform duration-200" @click="showContent = !showContent">
                <p class="text-gray-700 mb-4">댓글 관리메뉴</p>
                <template x-if="!showContent">
                    <img src="${pageContext.request.contextPath}/resources/images/comment_img.jpg" alt="댓글 관리메뉴" class="mx-auto mb-4">
                </template>
                <template x-if="showContent">
                    <div>
                        <a href="${pageContext.request.contextPath}/admin/replyList.do" class="block py-2 text-gray-600 hover:bg-gray-100">댓글 목록</a>
                    </div>
                </template>
            </div>
            <div x-data="{ showContent: false }" class="menu-card bg-white p-4 rounded-lg shadow-lg text-center cursor-pointer transition transform duration-200" @click="showContent = !showContent">
                <p class="text-gray-700 mb-4">반려동물 정보 관리</p>
                <template x-if="!showContent">
                    <img src="${pageContext.request.contextPath}/resources/images/pet_img.jpg" alt="반려동물 정보 관리" class="mx-auto mb-4">
                </template>
                <template x-if="showContent">
                    <div>
                        <a href="${pageContext.request.contextPath}/admin/petList.do" class="block py-2 text-gray-600 hover:bg-gray-100">반려동물 목록</a>
                        <a href="${pageContext.request.contextPath}/admin/memberListForPets.do" class="block py-2 text-gray-600 hover:bg-gray-100"> 회원 별 반려동물 목록</a>
                        <a href="${pageContext.request.contextPath}/admin/healthList.do" class="block py-2 text-gray-600 hover:bg-gray-100"> 진료기록 목록</a>
                    </div>
                </template>
            </div>
            <div x-data="{ showContent: false }" class="menu-card bg-white p-4 rounded-lg shadow-lg text-center cursor-pointer transition transform duration-200" @click="showContent = !showContent">
                <p class="text-gray-700 mb-4">통계</p>
                <template x-if="!showContent">
                    <img src="${pageContext.request.contextPath}/resources/images/statistics_img.jpg" alt="통계" class="mx-auto mb-4">
                </template>
                <template x-if="showContent">
                    <div>
                        <a href="${pageContext.request.contextPath}/statistics/view.do#totalMembers" class="block py-2 text-gray-600 hover:bg-gray-100">전체 회원 수</a>
                        <a href="${pageContext.request.contextPath}/statistics/view.do#membersByRegion" class="block py-2 text-gray-600 hover:bg-gray-100">지역별 회원 수</a>
                        <a href="${pageContext.request.contextPath}/statistics/view.do#totalPets" class="block py-2 text-gray-600 hover:bg-gray-100">전체 반려동물 수</a>
                        <a href="${pageContext.request.contextPath}/statistics/view.do#averagePetsPerMember" class="block py-2 text-gray-600 hover:bg-gray-100">회원 당 평균 반려동물 수</a>
                        <a href="${pageContext.request.contextPath}/statistics/view.do#petsByBreed" class="block py-2 text-gray-600 hover:bg-gray-100">품종별 반려동물 수</a>
                        <a href="${pageContext.request.contextPath}/statistics/view.do#pValueStatistics" class="block py-2 text-gray-600 hover:bg-gray-100">반려동물 종류</a>
                    </div>
                </template>
            </div>
        </div>
    </div>
	<div class="flex justify-center mt-6">
	<a href="${pageContext.request.contextPath}/main.do" class="bg-blue-500 text-white py-2 px-4 rounded-full shadow-lg hover:bg-blue-600 transition duration-300">홈페이지로 돌아가기</a>
	</div>
    <jsp:include page="../footer.jsp" />
</body>
</html>
