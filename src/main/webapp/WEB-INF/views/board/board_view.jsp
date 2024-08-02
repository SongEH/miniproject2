<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>반려동물종합관리플랫폼</title>
<meta content="" name="description">
<meta content="" name="keywords">
<!-- bootstrap -->
<!-- <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- <script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>  -->
<!-- Favicons -->
<link
	href="${pageContext.request.contextPath}/resources/assets/img/favicon.png"
	rel="icon">
<link
	href="${pageContext.request.contextPath}/resources/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Fonts -->
<link href="https://fonts.googleapis.com" rel="preconnect">
<link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link
	href="${pageContext.request.contextPath}resources/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/assets/vendor/aos/aos.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/assets/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">

<!-- Main CSS File -->
<link
	href="${pageContext.request.contextPath}/resources/assets/css/main.css"
	rel="stylesheet">

<!-- =======================================================
  * Template Name: Impact
  * Template URL: https://bootstrapmade.com/impact-bootstrap-business-website-template/
  * Updated: Jun 29 2024 with Bootstrap v5.3.3
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->


<!-- 공통 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/common.css">


<style>
@font-face {
	font-family: 'RixInooAriDuriR';
	src:
		url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2207-01@1.0/RixInooAriDuriR.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'Noto Sans KR';
	font-style: normal;
	font-weight: 500;
	src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff2)
		format('woff2'),
		url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff)
		format('woff'),
		url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.otf)
		format('opentype');
}

body {
	/* font-family: 'RixInooAriDuriR'; */
	font-family: 'Noto Sans KR', sans-serif !important;
}

input {
	font-family: 'Noto Sans KR', sans-serif !important;
}

.icon-box {
	border-radius: 20px !important;
}
</style>

</head>

<!--  부트스트랩 스타일 수정  -->
<style>
.accent-background {
	background-color: white !important;
	color: black;
}

.accent-background p {
	color: black;
}

.topbar {
	background-color: #FADA5A !important;
}

.branding, .branding a, .branding h1 {
	background-color: gray !important;
	color: black;
}

.icon-box {
	background-color: #FADA5A !important;
}

#footer {
	background-color: gray !important;
}

main.main {
	padding-top: 150px;
}

.col {
	display: flex;
}

/* 메인 내용 부분 CSS */
body {
	font-family: Arial, sans-serif;
	line-height: 1.6;
	margin: 0;
	padding: 0;
	background-color: #f4f4f4;
}

.container {
	width: 80%;
	margin: auto;
	overflow: hidden;
}

.author-date {
	font-size: 1rem;
	margin: 0.5rem 0;
}

article {
	padding: 1rem;
	background: #fff;
	margin-top: 1rem;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

article p {
	margin-bottom: 1rem;
}

/* 이미지 영역 CSS */
.post-images {
	display: flex;
	flex-wrap: wrap;
	 justify-content: center;
	gap: 2px; /* 이미지 간의 간격을 조정합니다 */
}
}

.post-img {
	flex: 0 0 calc(25% - 10px); /* 3개 열을 기준으로 각각의 이미지의 너비를 설정합니다. */
	box-sizing: border-box; /* 패딩과 테두리를 포함하여 크기를 계산합니다. */
	display: flex;
    justify-content: center; /* 이미지를 세로 방향으로 가운데 정렬 */
    align-items: center; /* 이미지를 가로 방향으로 가운데 정렬 */
}

.post-img img {
	width: 250px;
	height: 250px;
	display: block;
	object-fit: cover;
	margin: 10px;
	
}


/*  댓글영역 CSS  */
#re_content, #reply_display{

	width: 100%;
}

</style>

<!-- ------------------------삭제버튼 클릭 시 동작-------------------------  -->
<script type="text/javascript">
	function del() {

		if (confirm("정말 삭제하시겠습니까?") == false){
			return;
		}
			

		location.href = "delete.do?b_idx=${vo.b_idx}";
		return;

	}
</script>
<!-- ------------------------삭제버튼 클릭 시 동작-------------------------  -->




<!-- ------------------------댓글 작성 ------------------------------------  -->
<script type="text/javascript">

		function reply_insert(){
			
			if("${ empty user }" == "true"){
				   
				   if(confirm("로그인후 댓글쓰기가 가능합니다\n로그인 하시겠습니까?")==false) return;
				   
				   location.href="../member/login_form.do?url=" + encodeURIComponent(location.href) ;
				   
				   return;
			   }
			
			let re_content = $("#re_content").val().trim();
			
			 
			if(re_content==''){
			   alert("댓글내용을 입력하세요!!");
			   
			   $("#re_content").val("");
			   $("#re_content").focus();
			   return;
			   }
			   
			   //Ajax통해서 댓글 등록
			   $.ajax({
				   url		:	"../reply/insert.do",
				   data		:	{
					              "re_content": re_content,
					              "b_idx":"${ vo.b_idx }",
					              "m_idx":"${user.m_idx}",
					              "m_name":"${user.m_name}"
					            },
				   dataType	:	"json",
				   success	:	function(res_data){
					   // res_data = {"result": true }
					   
					   //작성했던 댓글 입력창에서 지우기
					   $("#re_content").val("");
					   
					   
					   if(res_data.result==false){
						   alert("댓글등록 실패!!");
						   return;
					   }
					   
					   reply_list(1);
					   
				   },
				   error	:	function(err){
					   alert(err.responseText);
				   }
			   });
			   
		   }//end:reply_insert()
		   
		   
		   
		   
		var g_page=1;
   //댓글목록 요청
   function reply_list(page){
	 
	   g_page = page;
	   
	   $.ajax({
		   
		   url		:	"../reply/list.do",
		   data		:	{"b_idx":"${ vo.b_idx}", "page": page },
		   success	:	function(res_data){
			   
			   $("#reply_display").html(res_data);
			   
		   },
		   error	:	function(err){
			   alert(err.responseText);
		   }

	   });
	   
   }//end:reply_list()	
   
   
   //초기화 : 시작시
   

   $(document).ready(function(){
       
	   //현재 게시물에 달린 댓글목록 출력
	   reply_list(1);
   });
    

<!-- ------------------------댓글 작성 ------------------------------------  -->


</script>



<body class="index-page">

	<%@ include file="/WEB-INF/views/top.jsp"%>
<!-- ---------------------------------------본문내용-------------------------------------------------------  -->
	<main class="main mt-300">
		<form method="post" enctype="multipart/form-data">

			<!-- 데이터 디스플레이는 하지 않고 넘기려는 데이터  -->
			<input type="hidden" name="b_idx" value="${vo.b_idx }"> <input
				type="hidden" name="b_cate" value="${vo.b_cate }">
			<!-- 데이터 디스플레이는 하지 않고 넘기려는 데이터  -->


			<!-- -----------------메인 헤더 출력 공간  ---------------------------- -->
			<div class="container">
				<div>
					<h1>${vo.b_title }</h1>
					<p class="author-date">${vo.m_name}|Date:${vo.b_rdate  }</p>
				</div>

				<div>
					<!-- 유저 본인만 삭제 및 수정 가능  -->

					<div>
						<c:if test="${ user.m_idx eq vo.m_idx }">
							<input class="btn btn-info" type="button" value="수정"
								onclick="location.href='modify_form.do?b_idx=${vo.b_idx}'">
							<input class="btn btn-danger" type="button" value="삭제"
								onclick="del();">
						</c:if>
						<input class="btn btn-success" type="button" value="목록으로"
							onclick="location.href='list.do?b_cate=${vo.b_cate }'">
					</div>
					<!-- -----------------메인 헤더 출력 공간 ---------------------------- -->

					<!-- -----------------첨부 파일 이미지 출력 공간 ---------------------------- -->
					<div>
						<div class="post-images">
							<c:forEach var="image" items="${image_list }">
								<div class="post-img">
									<img src="../resources/images/${image.b_filename}"
										class="img-thumbnail">
								</div>
							</c:forEach>
						</div>
					</div>
					<!-- -----------------첨부 파일 이미지 출력 공간 ---------------------------- -->


					<!-- -----------------메인 내용 출력 공간 ---------------------------- -->
					<article>
						<div class="post-description">${vo.b_content }</div>
					</article>
					<!-- -----------------메인 내용 출력 공간 ---------------------------- -->
				</div>
			</div>
		</form>

		<!-- ----------------댓글 공간-------------------------------------->


		<div class="container">
			<hr>
			<div class="row">
				<div class="col-sm-10">
					<textarea rows="3" id="re_content" name="re_content"
						placeholder="로그인후에 댓글쓰기가 가능합니다"></textarea>
				</div>
				<div class="col-sm-2">
					<input id="btn_re_register" type="button" value="댓글쓰기"
						onclick="reply_insert();">
				</div>
			</div>
		</div>
		<hr>

		
		<div>
				<div id="reply_display"></div>
			
		</div>



		<!-- Pagination menu -->
		<div class="container" style="text-align: center;">
			<div class="pagination">${pageMenu}</div>
		</div>



	</main>

</body>
</html>