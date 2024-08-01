<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../top.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이 페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        .custom-margin-top {
            margin-top: 100px; /* 원하는 위의 공간 크기 (px 단위) */
        }
    </style>
</head>
<body class="bg-gray-100">
    <div class="container mx-auto p-6">
        <nav class="flex justify-between items-center bg-white p-4 shadow-md rounded-lg mb-6 custom-margin-top">
            <div>
                <span class="text-4xl font-bold">마이페이지</span>
            </div>
            <div>
                <a href="${pageContext.request.contextPath}/pet/register.do?m_idx=${member.m_idx}" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">반려동물 등록</a>
            </div>
        </nav>

        <div class="bg-white shadow-md rounded-lg overflow-hidden mb-6">
            <div class="p-6">
                <h2 class="text-2xl font-bold mb-4">회원 정보</h2>
                <table class="min-w-full bg-white">
                    <tbody>
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
                    </tbody>
                </table>
                <div class="flex justify-between mt-4 p-4">
                    <a href="${pageContext.request.contextPath}/member/mypage/modify.do?m_idx=${member.m_idx}" class="bg-yellow-500 hover:bg-yellow-700 text-white font-bold py-2 px-4 rounded">수정</a>
                    <form action="${pageContext.request.contextPath}/member/mypage/delete.do" method="post" onsubmit="return confirm('정말 탈퇴하시겠습니까?');">
                        <input type="hidden" name="m_idx" value="${member.m_idx}">
                        <button type="submit" class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded">탈퇴</button>
                    </form>
                </div>
            </div>
        </div>

        <div id="pet-info" class="bg-white shadow-md rounded-lg overflow-hidden" style="display: none;">
            <div class="p-6">
                <h2 class="text-2xl font-bold mb-4">반려동물 정보</h2>
                <div id="pet-list">
                </div>
                <div class="mt-6">
                    <a href="${pageContext.request.contextPath}/pet/register.do?m_idx=${member.m_idx}" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">반려동물 등록하기</a>
                </div>
            </div>
        </div>
    </div>
<jsp:include page="../footer.jsp" />
<script>
    $(document).ready(function() {
        $.ajax({
            url: '${pageContext.request.contextPath}/pet/list.do',
            method: 'GET',
            data: { m_idx: '${member.m_idx}' },
            success: function(response) {
                console.log(response);
                if (response && response.length > 0) {
                    $('#pet-info').show();
                    response.forEach(function(pet) {
                        console.log('펫 정보:', pet);
                        let petPhoto = pet.p_photo ? '${pageContext.request.contextPath}/resources/images/pets/' + pet.p_photo : '${pageContext.request.contextPath}/resources/images/pets/default.png';
                        const formattedBirthday = pet.p_birthday ? new Date(pet.p_birthday).toLocaleDateString() : '생일을 등록하세요.';
                        $('#pet-list').append(`
                            <div class="border-b py-3">
                                <div class="flex items-center mb-4">
                                    <img src="\${petPhoto}" alt="펫 사진" class="w-48 h-48 rounded-full mr-4">
                                    <div>
                                        <p class="text-gray-700 font-bold">이름&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp:&nbsp \${pet.p_name}</p>
                                        <p class="text-gray-700">종류&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp:&nbsp \${pet.p_value}</p>
                                        <p class="text-gray-700">품종&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp:&nbsp \${pet.p_breed}</p>
                                        <p class="text-gray-700">생일&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp:&nbsp \${formattedBirthday}</p>
                                        <p class="text-gray-700">성별&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp:&nbsp \${pet.p_gender}</p>
                                        <p class="text-gray-700">등록 번호&nbsp:&nbsp \${pet.p_serialNum}</p>
                                    </div>
                                </div>
                                <div class="flex justify-between mt-4">
                                    <a href="${pageContext.request.contextPath}/pet/modify.do?p_idx=\${pet.p_idx}" class="bg-yellow-500 hover:bg-yellow-700 text-white font-bold py-2 px-4 rounded">수정</a>
                                    <a href="${pageContext.request.contextPath}/pet/delete.do?p_idx=\${pet.p_idx}&m_idx=\${pet.m_idx}" class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
                                </div>
                            </div>
                        `);
                    });
                }
            },
        });
    });
</script>
</body>
</html>
