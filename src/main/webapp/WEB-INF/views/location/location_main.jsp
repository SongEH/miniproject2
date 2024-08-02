<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
.diary-btn-yellow {
	background-color: #FADA5A;
	position: relative;
	padding: 15px 30px;
	border-radius: 15px;
	border: none;
	text-decoration: none;
	font-weight: 600;
	transition: 0.25s;
	letter-spacing: 2px;
	width: 100px;
}

.diary-btn-yellow:hover {
	transform: scale(1.1);
	cursor: pointer;
}

.diary-btn-yellow:active {
	transform: scale(0.9);
}

</style>	
	
	
<script type="text/javascript">
	//초기화 이벤트
	 $(document).ready(function(){
		  
		 
		  
	  });
	
	
	    function find() {
	        let sido = $("#sido").val();
	        let cate = $("#cate").val();
	     	

	        // AJAX request
	        $.ajax({
	            url: "${pageContext.request.contextPath}/searchlocation.do/",     
	            data: {
	                "sido": sido,
	                "cate": cate
	                
	            },
	            success: function(res_data) {
	            	 $("#disp").html(res_data);
	            },
	            error: function(err) {
	            	alert(err.responseText);
	            }
	        });
	    } 

</script>

</head>
<body>
	<%@include file="../top.jsp"%>
	<%@include file="../navbar.jsp"%>



    <!-- <!-- 검색메뉴 -->
    
        <form class="form-inline">
         <div class="input-group mb-3">
            <select id="sido" class="form-control" style="max-width: 300px; margin-left:30%;text-align: center;">
                <option value="all">전체보기</option>
                <option value="서울특별시">서울</option>
                <option value="경기도">경기</option>
                <option value="인천광역시">인천</option>
                <option value="충청북도">충북</option>
                <option value="충청남도">충남</option>
                <option value="세종특별자치시">세종</option>
                <option value="부산광역시">부산</option>
                <option value="경상남도">경남</option>
                <option value="경상북도">강원</option>
                <option value="전라북도">경기</option>
                <option value="전라남도">인천</option>
                <option value="세종특별자치시">세종</option>
                <option value="부산광역시">부산</option>
                <option value="대구광역시">대구</option>
                <option value="제주특별자치도">제주</option>
            </select>

            <select id="cate" class="form-control" style="max-width: 300px;  text-align: center;">
                <option value="all">전체보기</option>
                <option value="카페">카페</option>
                <option value="동물병원">병원</option>
                <option value="펜션">펜션</option>
                <option value="반려동물용품">반려동물용품점</option>
            </select>
			
              <button class="diary-btn-yellow" type="button" onclick="find();">검색</button>
              </div>
        </form>
    

    <hr>
    <div id="disp"></div>
</body>
</html>