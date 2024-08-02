<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>


<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>반려동물종합관리플랫폼</title>
<meta content="" name="description">
<meta content="" name="keywords">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- bootstrap -->
<!-- <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->

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
	font-size: 1em;
	margin-bottom: 16px;
	color: #555;
	display: -webkit-box;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: pre-line; /* Preserve white spaces and line breaks */
}

.post-images {
	display: flex;
	gap: 8px;
	margin-bottom: 16px;
}

.post-img {
	flex: 1;
	width: 150px; /* Fixed width for the square */
	height: 150px; /* Fixed height for the square */
	overflow: hidden;
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

.meta-top ul {
	list-style: none;
	padding: 0;
}

.meta-top li {
	display: flex;
	justify-content: space-between;
}

.img-thumbnail {
	cursor: pointer; /* Changes cursor to a hand (click) shape */
}

.carousel-item {
	width: 245px !important;
	height: 300px !important;
}

img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

/* 페이지 메뉴 CSS  */
.pagination {
	text-align: center !important;
	margin: auto;
}

/* 카드 CSS */
.equal-card {
	width: 300px;
	display: flex;
	flex-direction: column;
	height: 400px !important;
}

.card-text {
	line-height: 1.5em;
	max-height: 7.5em;
	overlfow: hidden;
	text-overflow: ellipsis;
}

.card-body {
	/* width: 300px; */
	flex: 1;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	background-color: #FADA5A;
	position: relative;
	padding: 15px 30px;
	border-radius: 3px;
	border: none;
	text-decoration: none;
	font-weight: 600;
	transition: 0.25s;
	letter-spacing: 2px;
}

.equal-reply-content {
	display: none;
	margin-top: 10px;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
	background-color: #f9f9f9;
	height: 150px;
	overflow-y: auto;
}

/* Adjusting button style */
.close-btn {
	float: right;
	margin-bottom: 10px;
}

/* .col-sm-4 {
	margin: 10px;
	width: 400px;
} */

/*  갤러리 형식의 이미지 */
.gallery {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
	gap: 10px;
	padding: 10px;
}

.gallery-item {
	/* border: 1px solid #ddd; */
	border-radius: 4px;
}

.gallery-image {
	width: 200px;
	height: 200px;
	display: block;
	object-fit: cover;
	margin: auto;
}

#search {
	float: none;
	background-color: white;
	border: 3px solid #FADA5A;
	position: relative;
	/* padding: 15px 30px; */
	border-radius: 15px;
	text-decoration: none;
	font-weight: 600;
	font-size: 15px;
	transition: 0.25s;
	letter-spacing: 2px;
	width: 100px;
	margin-left: 800px;
	display: inline-block;
	transition: 0.25s;
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
	display: inline-block;
}

#search_text:hover {
	transform: scale(1.1);
	cursor: pointer;
}

#search_text:active {
	transform: scale(0.9);
}

.form-inline {
	display: flex;
	justify-content: flex-end; /* 요소들을 오른쪽 정렬 */
	align-items: center; /* 요소들을 세로 중앙 정렬 */
}

.form-label, .form-control, .diary-btn-yellow {
	margin-left: 10px; /* 각 요소 사이의 간격 조정 */
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

.card-title {
	text-align: center;
	width: 100%;
	font-size: 1em;
	/* margin-top: 2px; */
	color: #555;
	display: inline-block;
	display: -webkit-box;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: normal;
}

/*  마우스 오버시 모양 바꿈  */
.card-title a {
	cursor: pointer; /* This will change the cursor to a hand icon */
	font-size: 16px;
}
</style>


<script>
	function toggleReply(idx) {
		// Hide all reply contents
		document.querySelectorAll('.reply-content').forEach(function(element) {
			element.style.display = 'none';
		});

		// Toggle the visibility of the specific reply content
		var replyContent = document.getElementById('replyContent_' + idx);
		if (replyContent) {
			if (replyContent.style.display === 'none') {
				replyContent.style.display = 'block';
			} else {
				replyContent.style.display = 'none';
			}
		}
	}

	function closeReply(idx) {
		var replyContent = document.getElementById('replyContent_' + idx);
		if (replyContent) {
			replyContent.style.display = 'none';
		}
	}
</script>


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
	function send_view(f) {

		let b_title = f.b_title.val().trim()
		alert(b_title)

		f.action = "board/view.do";
		f.submit();
	}
</script>



<body class="index-page">

	<%@ include file="/WEB-INF/views/top.jsp"%>

	<main class="main">

		<div class="container">
			<div style="text-align: right; margin-bottom: 5px;">
				<input class="diary-btn-yellow" type="button" value="글쓰기"
					onclick="insert_form();">
			</div>
			<div style="text-align: right; margin-bottom: 5px;">
				<form class="form-inline">
					<label for="search" class="form-label"></label> <select id="search"
						class="form-control form-control-lg" value="#FADA5A">
						<option value="all">전체보기</option>
						<option value="title">제목</option>
						<option value="content">내용</option>
						<option value="title_content">제목+내용</option>
					</select> <label for="search_text" class="form-label"> </label> <input
						id="search_text" class="form-control form-control-color finder"
						value="${ param.search_text }"> <input type="button"
						class="diary-btn-yellow" value="검색" onclick="find();">
				</form>
			</div>
		</div>




		<form method="post" enctype="multipart/form-data">
			<div class="container" style="margin-top: 50px;">
				<div class="row">
					<c:forEach var="item" items="${list}">
						<input type="hidden" id="b_cate" name="b_cate"
							value="${item.b_cate}">
						<div class="col-sm-4 d-flex justify-content-center mb-3">
							<div class="card equal-card">
								<div class="card-body">
									<div class="gallery">
										<div id="carousel_${item.b_idx}" class="carousel slide">
											<div class="carousel-inner">
												<c:forEach var="image" items="${item.image_list}"
													varStatus="status">
													<div class="carousel-item ${status.first ? 'active' : ''}">
														<img
															src="${pageContext.request.contextPath}/resources/images/${image.b_filename}"
															class="d-block w-100" alt="..."
															onclick="location.href='view.do?b_idx=${item.b_idx}&b_cate=${item.b_cate}'"
															style="cursor: pointer;">
													</div>
												</c:forEach>
											</div>
											<button class="carousel-control-prev" type="button"
												data-bs-target="#carousel_${item.b_idx}"
												data-bs-slide="prev">
												<span class="carousel-control-prev-icon" aria-hidden="true"></span>
												<span class="visually-hidden">Previous</span>
											</button>
											<button class="carousel-control-next" type="button"
												data-bs-target="#carousel_${item.b_idx}"
												data-bs-slide="next">
												<span class="carousel-control-next-icon" aria-hidden="true"></span>
												<span class="visually-hidden">Next</span>
											</button>
										</div>
									</div>
									<div class="card-title">
										<a
											onclick="location.href='view.do?b_idx=${item.b_idx}&b_cate=${item.b_cate}'">${item.b_title}</a>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</form>

	</main>
	<div>
		<div class="pagination" style="margin-top: 10px;">${pageMenu}</div>
	</div>

</body>
</html>
