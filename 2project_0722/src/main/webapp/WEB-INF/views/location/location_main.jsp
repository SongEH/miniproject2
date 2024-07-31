<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

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
    <div style="text-align: right; margin-bottom: 5px;">
        <form class="form-inline">
            <select id="sido" class="form-control">
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
                
            </select>

            <select id="cate" class="form-control">
                <option value="all">전체보기</option>
                <option value="카페">카페</option>
                <option value="동물병원">병원</option>
                <option value="동물약국">약국</option>
            </select>
			
            <input type="button" class="btn btn-primary" value="검색" onclick="find();">
        </form>
    </div>

    <hr>
    <div id="disp"></div>
</body>
</html>