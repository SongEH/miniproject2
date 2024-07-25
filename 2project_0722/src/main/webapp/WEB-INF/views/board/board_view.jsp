<<<<<<< HEAD
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
	gap: 8px;
	margin-bottom: 16px;
}

.post-img {
	flex: 1;
	width: 100px; /* Fixed width for the square */
	height: 100px; /* Fixed height for the square */
	overflow: hidden;
}

.post-img img {
	width: 100%;
	height: 100%;
	object-fit: cover; /* Ensure images cover the entire area */
	display: block;
}

</style>

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
		
		<div class="container">
		
			<div>
				<h1>${vo.b_title }</h1>
				<p class="author-date">${vo.m_name} | Date: ${vo.b_rdate  }</p>
			</div>
			<div>
				<div class="post-images">
				 <c:forEach var="image" items="${image_list }">
					<div class="post-img">
							<img src="../resources/images/${image.b_filename}" 
								class="img-thumbnail" >
								
					</div>
				</c:forEach>
				</div>
			</div>
			
			
			<article>
				<div class="post-description">
					${vo.b_content }
				</div>	
			</article>
		</div>
		
	</main>

</body>
=======
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

main {
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




	<main class="main mt-300">
		<div class="container">
			<div class="row">

				<div class="col-lg-8">

					<!-- Blog Details Section -->
					<section id="blog-details" class="blog-details section">
						<div class="container">

							<article class="article">

								<div class="post-img">
									<img src="assets/img/blog/blog-1.jpg" alt="" class="img-fluid">
								</div>

								<h2 class="title">Dolorum optio tempore voluptas
									dignissimos cumque fuga qui quibusdam quia</h2>

								<div class="meta-top">
									<ul>
										<li class="d-flex align-items-center"><i
											class="bi bi-person"></i> <a href="blog-details.html">John
												Doe</a></li>
										<li class="d-flex align-items-center"><i
											class="bi bi-clock"></i> <a href="blog-details.html"><time
													datetime="2020-01-01">Jan 1, 2022</time></a></li>
										<li class="d-flex align-items-center"><i
											class="bi bi-chat-dots"></i> <a href="blog-details.html">12
												Comments</a></li>
									</ul>
								</div>
								<!-- End meta top -->

								<div class="content">
									<p>Similique neque nam consequuntur ad non maxime aliquam
										quas. Quibusdam animi praesentium. Aliquam et laboriosam eius
										aut nostrum quidem aliquid dicta. Et eveniet enim. Qui velit
										est ea dolorem doloremque deleniti aperiam unde soluta. Est
										cum et quod quos aut ut et sit sunt. Voluptate porro
										consequatur assumenda perferendis dolore.</p>

									<p>Sit repellat hic cupiditate hic ut nemo. Quis nihil sunt
										non reiciendis. Sequi in accusamus harum vel aspernatur.
										Excepturi numquam nihil cumque odio. Et voluptate cupiditate.</p>

									<blockquote>
										<p>Et vero doloremque tempore voluptatem ratione vel aut.
											Deleniti sunt animi aut. Aut eos aliquam doloribus minus
											autem quos.</p>
									</blockquote>

									<p>Sed quo laboriosam qui architecto. Occaecati repellendus
										omnis dicta inventore tempore provident voluptas mollitia
										aliquid. Id repellendus quia. Asperiores nihil magni dicta est
										suscipit perspiciatis. Voluptate ex rerum assumenda dolores
										nihil quaerat. Dolor porro tempora et quibusdam voluptas.
										Beatae aut at ad qui tempore corrupti velit quisquam rerum.
										Omnis dolorum exercitationem harum qui qui blanditiis neque.
										Iusto autem itaque. Repudiandae hic quae aspernatur ea neque
										qui. Architecto voluptatem magni. Vel magnam quod et tempora
										deleniti error rerum nihil tempora.</p>

									<h3>Et quae iure vel ut odit alias.</h3>
									<p>Officiis animi maxime nulla quo et harum eum quis a. Sit
										hic in qui quos fugit ut rerum atque. Optio provident dolores
										atque voluptatem rem excepturi molestiae qui. Voluptatem
										laborum omnis ullam quibusdam perspiciatis nulla nostrum.
										Voluptatum est libero eum nesciunt aliquid qui. Quia et
										suscipit non sequi. Maxime sed odit. Beatae nesciunt nesciunt
										accusamus quia aut ratione aspernatur dolor. Sint harum
										eveniet dicta exercitationem minima. Exercitationem omnis
										asperiores natus aperiam dolor consequatur id ex sed.
										Quibusdam rerum dolores sint consequatur quidem ea. Beatae
										minima sunt libero soluta sapiente in rem assumenda. Et qui
										odit voluptatem. Cum quibusdam voluptatem voluptatem accusamus
										mollitia aut atque aut.</p>
									<img src="assets/img/blog/blog-inside-post.jpg"
										class="img-fluid" alt="">

									<h3>Ut repellat blanditiis est dolore sunt dolorum quae.</h3>
									<p>Rerum ea est assumenda pariatur quasi et quam. Facilis
										nam porro amet nostrum. In assumenda quia quae a id
										praesentium. Quos deleniti libero sed occaecati aut porro
										autem. Consectetur sed excepturi sint non placeat quia
										repellat incidunt labore. Autem facilis hic dolorum dolores
										vel. Consectetur quasi id et optio praesentium aut asperiores
										eaque aut. Explicabo omnis quibusdam esse. Ex libero illum
										iusto totam et ut aut blanditiis. Veritatis numquam ut illum
										ut a quam vitae.</p>
									<p>Alias quia non aliquid. Eos et ea velit. Voluptatem
										maxime enim omnis ipsa voluptas incidunt. Nulla sit eaque
										mollitia nisi asperiores est veniam.</p>

								</div>
								<!-- End post content -->

								<div class="meta-bottom">
									<i class="bi bi-folder"></i>
									<ul class="cats">
										<li><a href="#">Business</a></li>
									</ul>

									<i class="bi bi-tags"></i>
									<ul class="tags">
										<li><a href="#">Creative</a></li>
										<li><a href="#">Tips</a></li>
										<li><a href="#">Marketing</a></li>
									</ul>
								</div>
								<!-- End meta bottom -->

							</article>

						</div>
					</section>
					<!-- /Blog Details Section -->

					<!-- Blog Comments Section -->
					<section id="blog-comments" class="blog-comments section">

						<div class="container">

							<h4 class="comments-count">8 Comments</h4>

							<div id="comment-1" class="comment">
								<div class="d-flex">
									<div class="comment-img">
										<img src="assets/img/blog/comments-1.jpg" alt="">
									</div>
									<div>
										<h5>
											<a href="">Georgia Reader</a> <a href="#" class="reply"><i
												class="bi bi-reply-fill"></i> Reply</a>
										</h5>
										<time datetime="2020-01-01">01 Jan,2022</time>
										<p>Et rerum totam nisi. Molestiae vel quam dolorum vel
											voluptatem et et. Est ad aut sapiente quis molestiae est qui
											cum soluta. Vero aut rerum vel. Rerum quos laboriosam placeat
											ex qui. Sint qui facilis et.</p>
									</div>
								</div>
							</div>
							<!-- End comment #1 -->

							<!-- Comment Form Section -->
							<section id="comment-form" class="comment-form section">
								<div class="container">

									<form action="">

										<h4>Post Comment</h4>
										<p>Your email address will not be published. Required
											fields are marked *</p>
										<div class="row">
											<div class="col-md-6 form-group">
												<input name="name" type="text" class="form-control"
													placeholder="Your Name*">
											</div>
											<div class="col-md-6 form-group">
												<input name="email" type="text" class="form-control"
													placeholder="Your Email*">
											</div>
										</div>
										<div class="row">
											<div class="col form-group">
												<input name="website" type="text" class="form-control"
													placeholder="Your Website">
											</div>
										</div>
										<div class="row">
											<div class="col form-group">
												<textarea name="comment" class="form-control"
													placeholder="Your Comment*"></textarea>
											</div>
										</div>

										<div class="text-center">
											<button type="submit" class="btn btn-primary">Post
												Comment</button>
										</div>

									</form>

								</div>
							</section>
							<!-- /Comment Form Section -->
						</div>

						<div class="col-lg-4 sidebar">

							<div class="widgets-container">

								<!-- Blog Author Widget -->
								<div class="blog-author-widget widget-item">

									<div class="d-flex flex-column align-items-center">
										<img src="assets/img/blog/blog-author.jpg"
											class="rounded-circle flex-shrink-0" alt="">
										<h4>Jane Smith</h4>
										<div class="social-links">
											<a href="https://x.com/#"><i class="bi bi-twitter-x"></i></a>
											<a href="https://facebook.com/#"><i
												class="bi bi-facebook"></i></a> <a
												href="https://instagram.com/#"><i
												class="biu bi-instagram"></i></a> <a
												href="https://instagram.com/#"><i
												class="biu bi-linkedin"></i></a>
										</div>

										<p>Itaque quidem optio quia voluptatibus dolorem dolor.
											Modi eum sed possimus accusantium. Quas repellat voluptatem
											officia numquam sint aspernatur voluptas. Esse et accusantium
											ut unde voluptas.</p>

									</div>
								</div>
								<!--/Blog Author Widget -->

								<!-- Search Widget -->
								<div class="search-widget widget-item">

									<h3 class="widget-title">Search</h3>
									<form action="">
										<input type="text">
										<button type="submit" title="Search">
											<i class="bi bi-search"></i>
										</button>
									</form>

								</div>
								<!--/Search Widget -->

								<!-- Recent Posts Widget -->
								<div class="recent-posts-widget widget-item">

									<h3 class="widget-title">Recent Posts</h3>

									<div class="post-item">
										<h4>
											<a href="blog-details.html">Nihil blanditiis at in nihil
												autem</a>
										</h4>
										<time datetime="2020-01-01">Jan 1, 2020</time>
									</div>
									<!-- End recent post item-->

									<div class="post-item">
										<h4>
											<a href="blog-details.html">Quidem autem et impedit</a>
										</h4>
										<time datetime="2020-01-01">Jan 1, 2020</time>
									</div>
									<!-- End recent post item-->

									<div class="post-item">
										<h4>
											<a href="blog-details.html">Id quia et et ut maxime
												similique occaecati ut</a>
										</h4>
										<time datetime="2020-01-01">Jan 1, 2020</time>
									</div>
									<!-- End recent post item-->

									<div class="post-item">
										<h4>
											<a href="blog-details.html">Laborum corporis quo dara net
												para</a>
										</h4>
										<time datetime="2020-01-01">Jan 1, 2020</time>
									</div>
									<!-- End recent post item-->

									<div class="post-item">
										<h4>
											<a href="blog-details.html">Et dolores corrupti quae illo
												quod dolor</a>
										</h4>
										<time datetime="2020-01-01">Jan 1, 2020</time>
									</div>
									<!-- End recent post item-->

								</div>
								<!--/Recent Posts Widget -->
							</div>

						</div>
				</div>
			</div>
		</div>
	</main>
</body>
>>>>>>> refs/remotes/origin/CheonTk's-Branch
</html>