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

<script type="text/javascript">

	
	//초기화 이벤트
	$(document).ready(function(){
		
	
	});
	   
	   function search(){
			 let query = $("#query").val().trim();
			 let title    = $("#title").val();
			 let description	 = $("#description").val();
			 
			 
			 if(query==''){
				 alert("검색어를 입력하세요");
				 $("#query").val("");
				 $("#query").focus();
				 return;
			 }
			 
			 //aJax요청
			 $.ajax({
				 url		:		"${pageContext.request.contextPath}/searchnews.do", //KakaoSearchAction
				 data		:		{
					 				"query":query
					 				},
				 				
				 success	:		function(res_data){
					 $("#disp").html(res_data);
				 },
				 
				 error		:		function(err){
					 alert(err.responseText);
				 }
				 
			 });
			 
			 
		 }
		 
		</script>
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

body {
	/* font-family: 'RixInooAriDuriR'; */
	font-family: 'Noto Sans KR', sans-serif !important;
}

</style>
</head>
<body>
	<!-- top 옵션-->
	<%@include file="../top.jsp"%>
	<!-- navbar 옵션  -->
	<%@include file="../navbar.jsp"%>
	
	<form>
        <div class="input-group mb-3">
            <input  type="text" id="query" class="form-control" placeholder="검색어를 입력하세요"  style="max-width: 300px; margin-left:40%; ">
            <button class="diary-btn-yellow" type="button" onclick="search();">검색</button>
        </div>
    </form>
 
	<hr>
	<div id="disp"></div>

</body>
</html>