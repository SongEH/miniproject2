<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>반려동물종합관리플랫폼</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="../resources/assets/img/favicon.png" rel="icon">
<link href="../resources/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Fonts -->
<link href="https://fonts.googleapis.com" rel="preconnect">
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="../resources/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="../resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="../resources/assets/vendor/aos/aos.css" rel="stylesheet">
<link href="../resources/assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="../resources/assets/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">

<!-- Main CSS File -->
<link href="../resources/assets/css/main.css" rel="stylesheet">

<!-- =======================================================
  * Template Name: Impact
  * Template URL: https://bootstrapmade.com/impact-bootstrap-business-website-template/
  * Updated: Jun 29 2024 with Bootstrap v5.3.3
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->


<!-- 공통 css -->
<link rel="stylesheet" href="../resources/css/common.css">

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

#navmenu a {
	font-family: 'Noto Sans KR', sans-serif !important;
}

.branding, .branding a, .branding h1 {
	background-color: #F2EFE5 !important; /*  C7C8CC */
	color: #3C4043 !important;
}

.branding a:hover, .branding a:focus, .branding a:active {
	color: #3C4043 !important;
}

.icon-box {
	background-color: #FADA5A !important;
}

#footer {
	background-color: gray !important;
}

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

body, header {
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

<script type="text/javascript">
	function login_check() {

		location.href = "${pageContext.request.contextPath}/member/login_form.do?url="
				+ encodeURIComponent(location.href);
		return;

	}
</script>
</head>
<body class="index-page">
	<header id="header" class="header fixed-top">

		<div class="topbar d-flex align-items-center">
			<div
				class="container d-flex justify-content-center justify-content-md-between">
				<div class="contact-info d-flex align-items-center">
					<i class="bi bi-envelope d-flex align-items-center"><a
						href="mailto:contact@example.com">global_it@gmail.com</a></i> <i
						class="bi bi-phone d-flex align-items-center ms-4"><span>02-6020-0055</span></i>
				</div>
				<div class="social-links d-none d-md-flex align-items-center">
					<!-- <div>
						<input type="button" value="로그인" onclick="login_check();">
					</div> -->

					<a href="#" class="twitter"><i class="bi bi-twitter-x"></i></a> <a
						href="#" class="facebook"><i class="bi bi-facebook"></i></a> <a
						href="#" class="instagram"><i class="bi bi-instagram"></i></a> <a
						href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
				</div>
				<div class="text-end">
					<!-- 로그인이 안되어 있는 경우  -->
					<c:if test="${ empty sessionScope.user }">
						<input class="btn btn-default" type="button" value="로그인"
							onclick="location.href='${pageContext.request.contextPath}/member/login_form.do'" style="font-size:15px; color:#333333;">
						<input class="btn btn-default" type="button" value="회원가입"
							onclick="location.href='${pageContext.request.contextPath}/member/insert_form.do'" style="font-size:15px; color:#333333;">
					</c:if>
					<!-- 로그인이 되어 있는 경우  -->
					<c:if test="${ not empty sessionScope.user }">
						<input class="btn btn-default" type="button" value="로그아웃"
							onclick="location.href='${pageContext.request.contextPath}/member/logout.do'">
						<input class="btn btn-default" type="button" value="마이페이지" onclick="location.href='${pageContext.request.contextPath}/member/mypage.do'">
						<!-- 로그인이 되어 있고 관리자인 경우  -->
						<c:if test="${ sessionScope.user.m_grade == '관리자'}">
							<input class="btn btn-info" type="button" value="관리자페이지" onclick="location.href='${pageContext.request.contextPath}/admin/menu'" style="font-size:15px; color:#333333;">
						</c:if>
					</c:if>
				</div>
			</div>
		</div>
		<!-- End Top Bar -->
	</header>
</body>
</html>
