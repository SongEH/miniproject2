<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../top.jsp" %>
<%@ include file="../admin/topMenu.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>통계</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/alpinejs@2.8.2" defer></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        .chart-container {
            width: 50%;
            max-width: 500px;
            margin-left: auto;
        }
        .return-button-container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body class="bg-gray-100">
    <div class="container mx-auto p-6">
        <h1 class="text-3xl font-bold mb-6">통계</h1>
        
        <div id="totalMembers" class="bg-white shadow-md rounded-lg p-6 mb-6">
            <h2 class="text-2xl font-bold mb-4">전체 회원 수</h2>
            <p class="text-xl">${totalMembers}</p>
        </div>
        
        <div id="membersByRegion" class="bg-white shadow-md rounded-lg p-6 mb-6">
            <h2 class="text-2xl font-bold mb-4">지역별 회원 수</h2>
            <div class="flex">
                <ul class="flex-1">
                    <c:forEach var="region" items="${membersByRegion}">
                        <li>${region.REGION}: ${region.COUNT}명</li>
                    </c:forEach>
                </ul>
                <div class="chart-container">
                    <canvas id="regionChart"></canvas>
                </div>
            </div>
        </div>
        
        <div id="totalPets" class="bg-white shadow-md rounded-lg p-6 mb-6">
            <h2 class="text-2xl font-bold mb-4">전체 반려동물 수</h2>
            <p class="text-xl">${totalPets}</p>
        </div>
        
        <div id="averagePetsPerMember" class="bg-white shadow-md rounded-lg p-6 mb-6">
            <h2 class="text-2xl font-bold mb-4">회원 당 평균 반려동물 수</h2>
            <p class="text-xl">${averagePetsPerMember}</p>
        </div>
        
        <div id="petsByBreed" class="bg-white shadow-md rounded-lg p-6 mb-6">
            <h2 class="text-2xl font-bold mb-4">품종별 반려동물 수</h2>
            <div class="flex">
                <ul class="flex-1">
                    <c:forEach var="breed" items="${petsByBreed}">
                        <li>${breed.BREED}: ${breed.COUNT}마리</li>
                    </c:forEach>
                </ul>
                <div class="chart-container">
                    <canvas id="breedChart"></canvas>
                </div>
            </div>
        </div>

        <div id="pValueStatistics" class="bg-white shadow-md rounded-lg p-6 mb-6">
            <h2 class="text-2xl font-bold mb-4">반려동물 종류</h2>
            <div class="flex">
                <ul class="flex-1">
                    <c:forEach var="pValue" items="${pValueStatistics}">
                        <li>${pValue.P_VALUE}: ${pValue.COUNT}마리</li>
                    </c:forEach>
                </ul>
                <div class="chart-container">
                    <canvas id="pValueChart"></canvas>
                </div>
            </div>
        </div>

        <div class="return-button-container">
            <a href="${pageContext.request.contextPath}/admin/menu" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
                메뉴로 돌아가기
            </a>
        </div>
    </div>
    <jsp:include page="../footer.jsp" />
    <script>
        // 데이터 생성
        const regionData = {
            labels: [<c:forEach var="region" items="${membersByRegion}">'${region.REGION}',</c:forEach>],
            datasets: [{
                data: [<c:forEach var="region" items="${membersByRegion}">${region.COUNT},</c:forEach>],
                backgroundColor: ['#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0', '#9966FF', '#FF9F40']
            }]
        };

        const breedData = {
            labels: [<c:forEach var="breed" items="${petsByBreed}">'${breed.BREED}',</c:forEach>],
            datasets: [{
                data: [<c:forEach var="breed" items="${petsByBreed}">${breed.COUNT},</c:forEach>],
                backgroundColor: ['#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0', '#9966FF', '#FF9F40']
            }]
        };

        const pValueData = {
            labels: [<c:forEach var="pValue" items="${pValueStatistics}">'${pValue.P_VALUE}',</c:forEach>],
            datasets: [{
                data: [<c:forEach var="pValue" items="${pValueStatistics}">${pValue.COUNT},</c:forEach>],
                backgroundColor: ['#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0', '#9966FF', '#FF9F40']
            }]
        };

        // 차트 생성
        const ctxRegion = document.getElementById('regionChart').getContext('2d');
        new Chart(ctxRegion, {
            type: 'pie',
            data: regionData,
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'top',
                    },
                }
            }
        });

        const ctxBreed = document.getElementById('breedChart').getContext('2d');
        new Chart(ctxBreed, {
            type: 'pie',
            data: breedData,
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'top',
                    },
                }
            }
        });

        const ctxPValue = document.getElementById('pValueChart').getContext('2d');
        new Chart(ctxPValue, {
            type: 'pie',
            data: pValueData,
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'top',
                    },
                }
            }
        });
    </script>
</body>
</html>

