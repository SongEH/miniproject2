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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
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


</style>

<script type="text/javascript">

			<script>
			function moving_view(b_idx) {
			  window.location.href = "view.do?b_idx=${b_idx}";
			}
</script>


<body class="index-page">
	<header id="header" class="header fixed-top">

		<div class="topbar d-flex align-items-center">
			<div
				class="container d-flex justify-content-center justify-content-md-between">
				<div class="contact-info d-flex align-items-center">
					<i class="bi bi-envelope d-flex align-items-center"><a
						href="mailto:contact@example.com">contact@example.com</a></i> <i
						class="bi bi-phone d-flex align-items-center ms-4"><span>+1
							5589 55488 55</span></i>
				</div>
				<div class="social-links d-none d-md-flex align-items-center">
					<a href="#" class="twitter"><i class="bi bi-twitter-x"></i></a> <a
						href="#" class="facebook"><i class="bi bi-facebook"></i></a> <a
						href="#" class="instagram"><i class="bi bi-instagram"></i></a> <a
						href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
				</div>
			</div>
		</div>
		<!-- End Top Bar -->
		
	
		<div class="branding d-flex align-items-cente">

			<div
				class="container position-relative d-flex align-items-center justify-content-between">
				<a href="index.html" class="logo d-flex align-items-center"> <!-- Uncomment the line below if you also wish to use an image logo -->
					<!-- <img src="resources/assets/img/logo.png" alt=""> -->
					<h1 class="sitename">LOGO</h1>
				</a>

				<nav id="navmenu" class="navmenu">
					<ul>
						<li><a href="#" class="active">다이어리<br></a></li>
						<li class="dropdown"><a href="board/list.do"><span>커뮤니티</span>
								<i class="bi bi-chevron-down toggle-dropdown"></i></a>
							<ul>
								<li><a href="#">Dropdown 1</a></li>
								<li><a href="#">Dropdown 2</a></li>
								<li><a href="#">Dropdown 3</a></li>
								<li><a href="#">Dropdown 4</a></li>
							</ul></li>
						<li><a href="#">플레이스</a></li>
						<li><a href="#portfolio">뉴스</a></li>
						<li><a href="#team">쇼핑몰</a></li>

						<li><a href="#">문의</a></li>
					</ul>
					<i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
				</nav>

			</div>

		</div>

	</header>


<!-- ---------------------------------------본문내용-------------------------------------------------------  -->
	<main class="main mt-300">
		<div class="container d-flex justify-content-end">
			<input class="btn btn-success" type="button" value="글쓰기"
				onclick="location.href='insert_form.do'">
		</div>


		<section id="blog-posts-2" class="blog-posts-2 section">
			<div class="container">
				<div class="row gy-5">
					<c:forEach var="item" items="${vo}">
						<div class="col col-lg-4 col-md-6">
							<article>

								<div class="post-img">
									<img src="../resources/images/${item.image_list[0].b_filename}"
										alt="" class="img-fluid" onclick="moving_view(${item.b_idx})">
								</div>

								<div class="meta-top">
									<ul>
										<li class="d-flex align-items-center"><a
											href="view.do?b_idx=${item.b_idx}">${item.m_name }</a>&nbsp;&nbsp;&nbsp;
											
											
											<time style="text-align: right;" datetime="2022-01-01">${item.b_rdate }</time>
											</li>
										
													
									</ul>
								</div>

								<h2 class="title">
									<a href="view.do?b_idx=${item.b_idx}">${item.b_title }</a>
								</h2>

							</article>
						</div>
					</c:forEach>
				</div>
			</div>
		</section>
<!-- ---------------------------------------본문내용-------------------------------------------------------  -->
		



	<!-- Pagination menu -->
	<div class="pagination">${pageMenu}</div>
	
	</main>

</body>
</html>