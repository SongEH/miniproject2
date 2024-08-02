<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>반려동물종합관리플랫폼</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="resources/assets/img/favicon.png" rel="icon">
<link href="resources/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Fonts -->
<link href="https://fonts.googleapis.com" rel="preconnect">
<link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="resources/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="resources/assets/vendor/aos/aos.css" rel="stylesheet">
<link href="resources/assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="resources/assets/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">

<!-- Main CSS File -->
<link href="resources/assets/css/main.css" rel="stylesheet">

<!-- =======================================================
  * Template Name: Impact
  * Template URL: https://bootstrapmade.com/impact-bootstrap-business-website-template/
  * Updated: Jun 29 2024 with Bootstrap v5.3.3
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->

 
<!-- 공통 css -->
<!-- <link rel="stylesheet" href="resources/css/common.css"> -->

	
<style>
@font-face {
    font-family: 'RixInooAriDuriR';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2207-01@1.0/RixInooAriDuriR.woff2') format('woff2');
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
</style>


<body>
<!-- top 옵션-->
<%@include file="top.jsp"%>

<main class="main">

	<!-- Hero Section -->
	<section id="hero" class="hero section accent-background">

		<div class="container position-relative" data-aos="fade-up"
			data-aos-delay="100">
			<div class="row gy-5 justify-content-between">
					<div
						class="col-lg-6 order-2 order-lg-1 d-flex flex-column justify-content-center">
						<h2 style="font-size: 35px !important;">
							<div
								style="font-family: 'Noto Sans KR', sans-serif !important; color: black !important;">
								반려동물의 행복을 위한 종합 솔루션</div>
						</h2><br><br>
						<h3
							style="font-family: 'Noto Sans KR', sans-serif !important; font-size: 20px !important; color: black !important;">일지
							관리와 정보 공유 커뮤니티, 장소 및 뉴스 안내를 통해 <br><br>
							반려동물과의 소중한 순간을 더욱 빛나고 특별하게 만들어 드립니다.</h3>
					</div>
					<div class="col-lg-5 order-1 order-lg-2" style="width: 50%;">

					<div id="carouselExampleIndicators" class="carousel slide"
						data-bs-ride="carousel">
						<div class="carousel-indicators">
							<button type="button" data-bs-target="#carouselExampleIndicators"
								data-bs-slide-to="0" class="active" aria-current="true"
								aria-label="Slide 1"></button>
							<button type="button" data-bs-target="#carouselExampleIndicators"
								data-bs-slide-to="1" aria-label="Slide 2"></button>
							<button type="button" data-bs-target="#carouselExampleIndicators"
								data-bs-slide-to="2" aria-label="Slide 3"></button>
						</div>
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img src="resources/images/main/main_0.png"
									class="d-block w-100" alt="..." style="border-radius: 10px;">
							</div>
							<div class="carousel-item">
								<img src="resources/images/main/main_1.png"
									class="d-block w-100" alt="..." style="border-radius: 10px;">
							</div>
							<div class="carousel-item">
								<img src="resources/images/main/main_2.png"
									class="d-block w-100" alt="..." style="border-radius: 10px;">
							</div>
						</div>
						<button class="carousel-control-prev" type="button"
							data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button"
							data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						</button>
					</div>
				</div>
			</div>
		</div>

		<div class="icon-boxes position-relative" data-aos="fade-up"
			data-aos-delay="200">
			<div class="container position-relative">
				<div class="row gy-4 mt-5">

					<div class="col-xl-3 col-md-6">
						<div class="icon-box">
							<div class="icon">
								<i class="bi bi-easel"></i>
							</div>
							<h4 class="title">
								<a href="${pageContext.request.contextPath}/diary/diary_list.do" class="stretched-link">다이어리</a>
							</h4>
						</div>
					</div>
					<!--End Icon Box -->

					<div class="col-xl-3 col-md-6">
						<div class="icon-box">
							<div class="icon">
								<i class="bi bi-gem"></i>
							</div>
							<h4 class="title">
								<a href="${pageContext.request.contextPath}/board/list.do?b_cate=free" class="stretched-link">커뮤니티</a>
							</h4>
						</div>
					</div>
					<!--End Icon Box -->

					<div class="col-xl-3 col-md-6">
						<div class="icon-box">
							<div class="icon">
								<i class="bi bi-geo-alt"></i>
							</div>
							<h4 class="title">
								<a href="${ pageContext.request.contextPath}/location/location.do" class="stretched-link">플레이스</a>
							</h4>
						</div>
					</div>
					<!--End Icon Box -->

					<div class="col-xl-3 col-md-6">
						<div class="icon-box">
							<div class="icon">
								<i class="bi bi-command"></i>
							</div>
							<h4 class="title">
								<a href="${ pageContext.request.contextPath}/news/news.do" class="stretched-link">뉴스</a>
							</h4>
						</div>
					</div>
					<!--End Icon Box -->

				</div>
			</div>
		</div>

	</section>
	<!-- /Hero Section -->






	


	<!-- Recent Posts Section -->
	<!-- ## 커뮤니티 글 -->
		<section id="recent-posts" class="recent-posts section">

			<!-- Section Title -->
			<div class="container section-title" data-aos="fade-up">
				<h2>커뮤니티 최신글</h2>
				<p>행복은 습관이다,그것을 몸에 지니라</p>
			</div>
			<!-- End Section Title -->


			<div class="container">

				<div class="row gy-4">
					<c:forEach var="vo" items="${list}" varStatus="status">
   					 <c:if test="${status.index < 3}">
						<div class="col-xl-4 col-md-6" data-aos="fade-up"
							data-aos-delay="100">
							<article>
								
								
								<div class="post-img">
										<img
											src="${pageContext.request.contextPath}/resources/images/${vo.image_list[0].b_filename}"
											alt="" class="img-fluid"
											style="width: 100%; height: 100%; object-fit: cover;">>
											
									</div>
								
								<p class="post-category">${vo.b_cate}</p>
								<h2 class="title">
									<a href="blog-details.html">${vo.b_title }</a>
								</h2>
								<div class="d-flex align-items-center">
									<img src="resources/assets/img/blog/blog-author.jpg" alt=""
										class="img-fluid post-author-img flex-shrink-0">
									<div class="post-meta">
										<p class="post-author">${vo.m_name }</p>
										<p class="post-date">
											<time datetime="2022-01-01">${vo.b_rdate }</time>
										</p>
									</div>
								</div>

							</article>
						</div>
						</c:if>
					</c:forEach>
					<!-- End post list item -->

				</div>
				<!-- End recent posts list -->

			</div>

		</section>
	<!-- /Recent Posts Section -->

	<!-- Services Section -->
	<!-- ## 뉴스 -->
	<section id="services" class="services section">

		<!-- Section Title -->
		<div class="container section-title" data-aos="fade-up">
			<h2>소개</h2>
			<p>Furry Friends의 기능을 소개합니다</p>
		</div>
		<!-- End Section Title -->

		<div class="container">

			<div class="row gy-4">

				<div class="col-lg-4 col-md-6" data-aos="fade-up"
					data-aos-delay="100">
					<div class="service-item  position-relative">
						<div class="icon">
							<i class="bi bi-activity"></i>
						</div>
						<h3>다이어리</h3>
						<p>반려동물의 일상을 기록하고 추억을 남겨 보세요. 건강 상태, 다양한 활동 등을 관리할 수 있습니다. 매일매일의 소중한 순간을 기록해보세요</p>
						<!-- <a class="readmore stretched-link">Read
							more <i class="bi bi-arrow-right"></i>
						</a> -->
					</div>
				</div>
				<!-- End Service Item -->

				<div class="col-lg-4 col-md-6" data-aos="fade-up"
					data-aos-delay="200">
					<div class="service-item position-relative">
						<div class="icon">
							<i class="bi bi-broadcast"></i>
						</div>
						<h3>커뮤니티</h3>
						<p>여러 사람과 소통하며 유용한 정보를 공유할 수 있습니다. 정보와 조언을 주고받고, 함께하는 커뮤니티에서 새로운 친구를 만나고 소중한 인연을 만들어보세요.</p>
						<!-- <a href="#" class="readmore stretched-link">Read
							more <i class="bi bi-arrow-right"></i>
						</a> -->
					</div>
				</div>
				<!-- End Service Item -->

				<div class="col-lg-4 col-md-6" data-aos="fade-up"
					data-aos-delay="300">
					<div class="service-item position-relative">
						<div class="icon">
							<i class="bi bi-easel"></i>
						</div>
						<h3>뉴스 및 플레이스</h3>
						<p>최신 반려동물 관련 뉴스를 찾아보세요. 미용실, 카페, 병원 등 유용한 장소를 안내하여 함께 즐길 수 있는 공간에서 더 많은 추억을 쌓아보세요.</p>
						<!-- <a href="#" class="readmore stretched-link">Read
							more <i class="bi bi-arrow-right"></i>
						</a> -->
					</div>
				</div>
				<!-- End Service Item -->

				
			</div>

		</div>

	</section>
	<!-- /Services Section -->





</main>



	<!-- Scroll Top -->
	<a href="#" id="scroll-top"
		class="scroll-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Preloader -->
	<div id="preloader"></div>

<!-- Vendor JS Files -->
	<script
		src="resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="resources/assets/vendor/php-email-form/validate.js"></script>
	<script src="resources/assets/vendor/aos/aos.js"></script>
	<script src="resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script
		src="resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
	<script
		src="resources/assets/vendor/imagesloaded/imagesloaded.pkgd.min.js"></script>
	<script
		src="resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script> 


<!-- Main JS File -->
<script src="resources/assets/js/main.js"></script>

</body>

</html>