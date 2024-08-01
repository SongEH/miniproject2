<%@page import="vo.BoardVo"%>
<%@page import="java.util.List"%>
<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
pageContext.setAttribute("replaceChar", "\n");
%>


<!DOCTYPE html>
<html>


<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>반려동물종합관리플랫폼</title>
<meta content="" name="description">
<meta content="" name="keywords">
<!-- bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

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
	href="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"
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

/* 블로그 글 CSS */
.blog-post {
	border: 1px solid #ddd;
	padding: 16px;
	margin-bottom: 16px;
	background-color: #fff;
}

.post-title {
	font-size: 1.5em;
	margin-bottom: 8px;
	color: #ff69b4;
}

.post-title-link {
	text-decoration: none;
	color: inherit;
}

.post-description {
	width: 100%;
	font-size: 1em;
	margin-top: 2px;
	color: #555;
	display: inline-block;
	display: -webkit-box;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: normal;
}

.post-images {
	width: 400px;
	display: flex;
	gap: 8px;
	margin-bottom: 16px;
	display: flex;
}

.post-img {
	flex: 1;
	width: 400px;
	height: 200px;
	overflow: hidden;
	object-fit: cover;
}

.post-img img {
	width: 100%;
	height: 100%;
	object-fit: cover; /* Ensure images cover the entire area */
	display: block;
}

.meta-top {
	font-size: 0.875em;
	color: #999;
}

`
.meta-top ul {
	list-style: none;
	padding: 0;
}

.meta-top li {
	display: flex;
	justify-content: space-between;
}

.img-thumbnail {
	cursor: pointer;
	width: 300px;
	height: 150px;
}

/* 페이지 메뉴 CSS  */
.pagination {
	text-align: center !important;
	margin: auto;
}

section {
	height: 100%;
	border-bottom: 1px solid #FADA5A;
	border-top: 1px solid #FADA5A;
}

/* 이미지 보여주는 CSS*/
.image-container {
	position: relative;
	width: 300px; /* Adjust size as needed */
	height: 200px; /* Adjust size as needed */
}

.main-image {
	width: 100%;
	height: 100%;
	display: block;
}

.overlay {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: flex;
	flex-wrap: wrap;
	/* align-items: flex-start; */
	justify-content: flex-start; opacity : 0;
	transition: opacity 0.3s ease;
	pointer-events: none;
	opacity: 0;
}

.overlay-image {
	width: 50%;
	height: 50%;
	object-fit: cover;
	display: block;
}

.image-container:hover .overlay {
	opacity: 1;
	pointer-events: auto;
}

#search {
	background-color: white;
	border: 3px solid #FADA5A;
	position: relative;
	/* padding: 15px 30px; */
	border-radius: 15px;
	text-decoration: none;
	/* font-weight: 600;  */
	transition: 0.25s;
	letter-spacing: 2px;
	width: 100px;
}

#search:hover {
	transform: scale(1.1);
	cursor: pointer;
}

#search:active {
	transform: scale(0.9);
}

#search_text {
	background-color: white;
	border: 3px solid #C0C0C0;
	position: relative;
	padding: 15px 30px;
	border-radius: 15px;
	text-decoration: none;
	font-weight: 600;
	transition: 0.25s;
	letter-spacing: 2px;
	width: 100px;
}

#search_text:hover {
	transform: scale(1.1);
	cursor: pointer;
}

#search_text:active {
	transform: scale(0.9);
}
</style>


<!-- 메인 버튼 스타일 Design by_JH -->
<style>
/*  diary-btn-yellow  */
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

/*  diary-btn-yellow-outline  */
.diary-btn-yellow-outline {
	background-color: white;
	border: 3px solid #FADA5A;
	position: relative;
	padding: 15px 30px;
	border-radius: 15px;
	text-decoration: none;
	font-weight: 600;
	transition: 0.25s;
	letter-spacing: 2px;
	width: 100px;
}

.diary-btn-yellow-outline:hover {
	transform: scale(1.1);
	cursor: pointer;
}

.diary-btn-yellow-outline:active {
	transform: scale(0.9);
}

/*  diary-btn-gray-outline  */
.diary-btn-gray-outline {
	background-color: white;
	border: 3px solid #C0C0C0;
	position: relative;
	padding: 15px 30px;
	border-radius: 15px;
	text-decoration: none;
	font-weight: 600;
	transition: 0.25s;
	letter-spacing: 2px;
	width: 100px;
}

.diary-btn-gray-outline:hover {
	transform: scale(1.1);
	cursor: pointer;
}

.diary-btn-gray-outline:active {
	transform: scale(0.9);
}
</style>
<!-- 메인 버튼 스타일 Design by_JH -->


<script type="text/javascript">
	function insert_form() {

		if ("${ empty user}" == "true") {

			if (confirm("글쓰기는 로그인 후 이용가능합니다\n로그인 하시겠습니까?") == false) {
				return;
			} else {
				location.href = "../member/login_form.do?url="
						+ encodeURIComponent(location.href);
				return;
				alert(encodeURIComponent(location.href));
			}
		}
		location.href = "insert_form.do"
	}

	function find() {

		let search = $("#search").val();
		let search_text = $("#search_text").val().trim();
		let b_cate = $("#b_cate").val();

		//전체검색이 아닌데 검색어가 비어있으면
		if (search != "all" && search_text == "") {
			alert("검색어를 입력하세요!!");
			$("#search_text").val(""); //지우기
			$("#search_text").focus(); //포커스
			return;
		}

		//자바스크립트 이용해서 호출
		location.href = "list.do?search=" + search + "&search_text="
				+ encodeURIComponent(search_text, "utf-8") + "&b_cate="
				+ b_cate;

	}
</script>

<script type="text/javascript">
	/* 초기화  */
	/*
	$(document).ready(function() {

		 if ("${ not empty param.search }" == "true") {
			$("#search").val("${ param.search }");
		}

		//전체보기면 입력창 지우기
		if ("${ param.search eq 'all'}" == "true") {
			$("#search_text").val("");
		} 

	}); 
	 */
</script>




<body class="index-page">

	
		<div class="container mb-20" >
			<c:forEach var="item" items="${list}">
				<c:if test="${item.b_cate eq 'free' }">
					<form style="height: 200px;">
						<input type="hidden" id="b_cate" name="b_cate"
							value="${item.b_cate}">
							<c:import url="/main.jsp">
								<c:param name="b_cate" value="${item.b_cate }" />
							</c:import>
						<section id="blog-posts-2" class="blog-posts-2 section"
							style="padding: 5px;">
							<div>${item.m_name}${item.b_rdate}</div>
							<div class="col-md-8" style="margin-top: 30px;">
								<h3 class="post-title mt-2">
									<a href="view.do?b_idx=${item.b_idx}" class="post-title-link">${item.b_title}</a>
									(${item.b_readhit})
								</h3>
								<h5 class="post-description">
									<c:out value="${item.b_content.replaceAll('<[^>]*>', '')}" />
								</h5>
							</div>
							<div class="col-md-4 image-container">
								<div class="post-images">
									<img
										src="${pageContext.request.contextPath}/resources/images/${item.image_list[0].b_filename}"
										alt="Main Image" class="main-image img-thumbnail">
									<div class="overlay">
										<c:forEach var="image" items="${item.image_list}">
											<img
												src="${pageContext.request.contextPath}/resources/images/${image.b_filename}"
												alt="Overlay Image" class="overlay-image img-thumbnail"
												onclick="location.href='view.do?b_idx=${item.b_idx}'">
										</c:forEach>
									</div>
								</div>
							</div>
						</section>
					</form>
				</c:if>
			</c:forEach>
		</div>

	
</body>
</html>



