<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
/* 추가된 스타일 */
nav.bg-white.shadow {
    z-index: 10; /* Ensure the nav menu is above other content */
    position: relative; /* Ensure proper stacking context */
}
</style>
<!-- 관리자 권한 체크 -->
<c:if test="${sessionScope.user.m_grade != '관리자'}">
    <script>
        alert("접근 권한이 없습니다.");
        location.href = "${pageContext.request.contextPath}/";
    </script>
</c:if>
<nav class="bg-white shadow mt-12" x-data="{ open: false }">
    <div class="container mx-auto px-6 py-3 flex justify-between items-center">
        <div class="flex items-center space-x-4">
            <button @click="open = !open" class="text-gray-600 hover:text-gray-800 md:hidden">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16m-7 6h7" />
                </svg>
            </button>
            <span class="text-xl font-semibold text-gray-700 md:hidden">메뉴</span>
        </div>
        <div class="hidden md:flex md:space-x-8 justify-center w-full">
            <div x-data="{ open: false }" class="relative">
                <button @click="open = !open" class="text-gray-600 hover:text-gray-800">회원 관리메뉴</button>
                <div x-show="open" @click.away="open = false" class="absolute left-0 mt-2 w-48 bg-white shadow-lg rounded-lg py-2">
                    <a href="${pageContext.request.contextPath}/member/list.do" class="block py-2 text-gray-600 hover:bg-gray-100">회원 목록</a>
                    <a href="${pageContext.request.contextPath}/admin/register.do" class="block py-2 text-gray-600 hover:bg-gray-100">회원 등록</a>
                </div>
            </div>
            <div x-data="{ open: false }" class="relative">
                <button @click="open = !open" class="text-gray-600 hover:text-gray-800">게시판 관리메뉴</button>
                <div x-show="open" @click.away="open = false" class="absolute left-0 mt-2 w-48 bg-white shadow-lg rounded-lg py-2">
                    <a href="${pageContext.request.contextPath}/admin/boardList.do" class="block py-2 text-gray-600 hover:bg-gray-100">게시글 목록</a>
                </div>
            </div>
            <div x-data="{ open: false }" class="relative">
                <button @click="open = !open" class="text-gray-600 hover:text-gray-800">댓글 관리메뉴</button>
                <div x-show="open" @click.away="open = false" class="absolute left-0 mt-2 w-48 bg-white shadow-lg rounded-lg py-2">
                    <a href="${pageContext.request.contextPath}/admin/replyList.do" class="block px-4 py-2 text-gray-600 hover:bg-gray-100">댓글 목록</a>
                </div>
            </div>
            <div x-data="{ open: false }" class="relative">
                <button @click="open = !open" class="text-gray-600 hover:text-gray-800">반려동물 정보 관리</button>
                <div x-show="open" @click.away="open = false" class="absolute left-0 mt-2 w-48 bg-white shadow-lg rounded-lg py-2">
                    <a href="${pageContext.request.contextPath}/admin/petList.do" class="block px-4 py-2 text-gray-600 hover:bg-gray-100">반려동물 목록</a>
                    <a href="${pageContext.request.contextPath}/admin/memberListForPets.do" class="block px-4 py-2 text-gray-600 hover:bg-gray-100">회원별 반려동물</a>
                    <a href="${pageContext.request.contextPath}/admin/healthList.do" class="block px-4 py-2 text-gray-600 hover:bg-gray-100">진료기록 목록</a>
                </div>
            </div>
            <div x-data="{ open: false }" class="relative">
                <button @click="open = !open" class="text-gray-600 hover:text-gray-800">통계</button>
                <div x-show="open" @click.away="open = false" class="absolute left-0 mt-2 w-48 bg-white shadow-lg rounded-lg py-2">
                    <a href="${pageContext.request.contextPath}/statistics/view.do#totalMembers" class="block px-4 py-2 text-gray-600 hover:bg-gray-100">전체 회원 수</a>
                    <a href="${pageContext.request.contextPath}/statistics/view.do#membersByRegion" class="block px-4 py-2 text-gray-600 hover:bg-gray-100">지역별 회원 수</a>
                    <a href="${pageContext.request.contextPath}/statistics/view.do#totalPets" class="block px-4 py-2 text-gray-600 hover:bg-gray-100">전체 반려동물 수</a>
                    <a href="${pageContext.request.contextPath}/statistics/view.do#averagePetsPerMember" class="block px-4 py-2 text-gray-600 hover:bg-gray-100">회원 당 평균 반려동물 수</a>
                    <a href="${pageContext.request.contextPath}/statistics/view.do#petsByBreed" class="block px-4 py-2 text-gray-600 hover:bg-gray-100">품종별 반려동물 수</a>
                    <a href="${pageContext.request.contextPath}/statistics/view.do#pValueStatistics" class="block px-4 py-2 text-gray-600 hover:bg-gray-100">반려동물 종류</a>
                </div>
            </div>
        </div>
    </div>
    <div x-show="open" @click.away="open = false" class="md:hidden mt-2 w-full bg-white shadow-lg rounded-lg py-2 space-y-2">
        <div x-data="{ open: false }" class="relative">
            <button @click="open = !open" class="w-full text-left px-4 py-2 text-gray-600 hover:bg-gray-100">회원 관리메뉴</button>
            <div x-show="open" class="pl-4">
                <a href="${pageContext.request.contextPath}/member/list.do" class="block px-4 py-2 text-gray-600 hover:bg-gray-100">회원 목록</a>
                <a href="${pageContext.request.contextPath}/member/detail.do" class="block px-4 py-2 text-gray-600 hover:bg-gray-100">회원 상세정보</a>
            </div>
        </div>
        <div x-data="{ open: false }" class="relative">
            <button @click="open = !open" class="w-full text-left px-4 py-2 text-gray-600 hover:bg-gray-100">게시판 관리메뉴</button>
            <div x-show="open" class="pl-4">
                <a href="${pageContext.request.contextPath}/board/list.do" class="block px-4 py-2 text-gray-600 hover:bg-gray-100">게시글 목록</a>
                <a href="${pageContext.request.contextPath}/board/detail.do" class="block px-4 py-2 text-gray-600 hover:bg-gray-100">게시글 추가</a>
            </div>
        </div>
        <div x-data="{ open: false }" class="relative">
            <button @click="open = !open" class="w-full text-left px-4 py-2 text-gray-600 hover:bg-gray-100">댓글 관리메뉴</button>
            <div x-show="open" class="pl-4">
                <a href="${pageContext.request.contextPath}/comment/list.do" class="block py-2 text-gray-600 hover:bg-gray-100">댓글 목록</a>
                <a href="${pageContext.request.contextPath}/comment/detail.do" class="block py-2 text-gray-600 hover:bg-gray-100">댓글 추가</a>
            </div>
        </div>
        <div x-data="{ open: false }" class="relative">
            <button @click="open = !open" class="w-full text-left px-4 py-2 text-gray-600 hover:bg-gray-100">반려동물 정보 관리</button>
            <div x-show="open" class="pl-4">
                <a href="${pageContext.request.contextPath}/pet/list.do" class="block py-2 text-gray-600 hover:bg-gray-100">반려동물 목록</a>
                <a href="${pageContext.request.contextPath}/admin/memberListForPets.do" class="block py-2 text-gray-600 hover:bg-gray-100">회원 별 반려동물 목록</a>
                <a href="${pageContext.request.contextPath}/admin/healthList.do" class="block py-2 text-gray-600 hover:bg-gray-100">진료기록 목록</a>
            </div>
        </div>
        <div x-data="{ open: false }" class="relative">
            <button @click="open = !open" class="w-full text-left px-4 py-2 text-gray-600 hover:bg-gray-100">통계</button>
            <div x-show="open" class="pl-4">
                <a href="${pageContext.request.contextPath}/statistics/view.do#totalMembers" class="block py-2 text-gray-600 hover:bg-gray-100">전체 회원 수</a>
                <a href="${pageContext.request.contextPath}/statistics/view.do#membersByRegion" class="block py-2 text-gray-600 hover:bg-gray-100">지역별 회원 수</a>
                <a href="${pageContext.request.contextPath}/statistics/view.do#totalPets" class="block py-2 text-gray-600 hover:bg-gray-100">전체 반려동물 수</a>
                <a href="${pageContext.request.contextPath}/statistics/view.do#averagePetsPerMember" class="block py-2 text-gray-600 hover:bg-gray-100">회원 당 평균 반려동물 수</a>
                <a href="${pageContext.request.contextPath}/statistics/view.do#petsByBreed" class="block py-2 text-gray-600 hover:bg-gray-100">품종별 반려동물 수</a>
                <a href="${pageContext.request.contextPath}/statistics/view.do#pValueStatistics" class="block py-2 text-gray-600 hover:bg-gray-100">반려동물 종류</a>
            </div>
        </div>
    </div>
</nav>
