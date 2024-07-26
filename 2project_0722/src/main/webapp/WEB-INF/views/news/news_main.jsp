<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

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
				 url		:		"${pageContext.request.contextPath}/search.do", //KakaoSearchAction
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

</head>
<body>
	<!-- top 옵션-->
	<%@include file="../top.jsp"%>
	<!-- navbar 옵션  -->
	<%@include file="../navbar.jsp"%>
	입력창 출력중
	
	<form>
	검색어:<input class="form-control" id="query">
	       <input class="btn btn-primary" type="button"  value="검색" onclick="search();">
	    
           
           
</form>
	       
	<hr>
	<div id="disp"></div>

	
	
	
	
	
	
	
	<%-- 
	<h1>관련기사 검색</h1>
     <form action="${pageContext.request.contextPath}/search/news" method="get">
        <input type="text" name="query" placeholder="Search news..." required>
        <button type="submit">Search</button>
    </form> --%>
    

</body>
</html>