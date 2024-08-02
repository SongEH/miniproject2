<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String ctx = request.getContextPath(); //콘텍스트명 얻어오기.

%>


<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="description">
<meta content="" name="keywords">
<title>반려동물종합관리플랫폼</title>


<!-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인) -->
<%-- <script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/smarteditor2/js/HuskyEZCreator.js"
	charset="utf-8"></script> --%>


<!-- bootstrap -->
<!-- <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> 

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
#re_content, #reply_display {
	width: 100%;
}

/* 답변 공간 CSS */
.answer {
	margin-top: 30px;
}
</style>


<!-- 메인 버튼 스타일 Design by_JH -->
<style type="text/css">
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

/*  diary-btn-yellow-outline */ 
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
	text-align: center;
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


.diary-btn-gray-outline-re {
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

.diary-btn-gray-outline-re:hover {
	transform: scale(1);
	cursor: pointer;
}

.diary-btn-gray-outline-re:active {
	transform: scale(0.8);
}


/*  diary-btn-yellow-outline */ 
.diary-btn-yellow-outline-btn {
	background-color: white;
	border: 3px solid #FADA5A;
	position: relative;
	padding: 5px 10px;
	border-radius: 15px;
	text-decoration: none;
	font-weight: 600;
	transition: 0.25s;
	letter-spacing: 2px;
	width: 100%;
	height: 100%;
	text-align: center;
}

.diary-btn-yellow-outline-btn:hover {
	transform: scale(1.0);
	cursor: pointer;
}

.diary-btn-yellow-outline-btn:active {
	transform: scale(0.8);
}



</style>







<!-- ------------------------삭제버튼 클릭 시 동작-------------------------  -->
<script type="text/javascript">
	function del() {

		if (confirm("정말 삭제하시겠습니까?") == false)
			return;

		location.href = "delete.do?b_idx=${ vo.b_idx}";

	}
</script>
<!-- ------------------------삭제버튼 클릭 시 동작-------------------------  -->




<!-- ------------------------댓글 작성 ------------------------------------  -->
<script type="text/javascript">
	/* ------------------------ANSWER_INSERT----------------------------------- */
	function save_answer() {
	
		if ("${ empty user }" == "true") {

			if (confirm("의학전문가 아이디로 로그인후 댓글쓰기가 가능합니다\n로그인 하시겠습니까?") == false)
				return;

			location.href = "../member/login_form.do?url="
					+ encodeURIComponent(location.href);

			return;
		}

		let a_content = $("#a_content").val();
		

		if (a_content == "") {
			alert("댓글내용을 입력하세요!!");
			$("#a_content").val("");
			$("#a_content").focus();
			return;
		}

		$.ajax({
			url : "../answer/insert.do",
			data : {
				"a_content" : a_content,
				"b_idx" : "${ vo.b_idx }",
				"m_idx" : "${user.m_idx}",
				"m_name" : "${user.m_name}"
			},
			dataType : "json",
			success : function(res_data) {
				// res_data = {"result": true }

				//작성했던 댓글 입력창에서 지우기
				$("#a_content").val("");

				if (res_data.result == false) {
					alert("답변 등록 실패!!");
					return;
				}
				alert("답병 등록 성공")
				answer_list();

			},
			error : function(err) {
				alert(err.responseText);
			}
		});

	} // save_answer
	/* ------------------------ANSWER_INSERT----------------------------------- */

	/* ------------------------ANSWER_LIST----------------------------------- */

	//댓글목록 요청
	function answer_list() {

		$.ajax({

			url : "../answer/list.do",
			data : {
				"b_idx" : "${ vo.b_idx}"
			},
			success : function(res_data) {

				$("#answer_display").html(res_data);

			},
			error : function(err) {
				alert(err.responseText);
			}

		});

	}//end:reply_list()	
	/* ------------------------ANSWER_LIST----------------------------------- */

	/* ------------------------REPLY_INSERT----------------------------------- */
	function reply_insert() {

		if ("${ empty user }" == "true") {

			if (confirm("로그인후 댓글쓰기가 가능합니다\n로그인 하시겠습니까?") == false)
				return;

			location.href = "../member/login_form.do?url="
					+ encodeURIComponent(location.href);

			return;
		}

		let re_content = $("#re_content").val().trim();

		if (re_content == '') {
			alert("댓글내용을 입력하세요!!");

			$("#re_content").val("");
			$("#re_content").focus();
			return;
		}

		//Ajax통해서 댓글 등록
		$.ajax({
			url : "../reply/insert.do",
			data : {
				"re_content" : re_content,
				"b_idx" : "${ vo.b_idx }",
				"m_idx" : "${user.m_idx}",
				"m_name" : "${user.m_name}"
			},
			dataType : "json",
			success : function(res_data) {
				// res_data = {"result": true }

				//작성했던 댓글 입력창에서 지우기
				$("#re_content").val("");

				if (res_data.result == false) {
					alert("댓글등록 실패!!");
					return;
				}

				reply_list(1);

			},
			error : function(err) {
				alert(err.responseText);
			}
		});

	}//end:reply_insert()
	/* ------------------------REPLY_INSERT----------------------------------- */

	/* ------------------------REPLY_LIST----------------------------------- */
	var g_page = 1;
	//댓글목록 요청
	function reply_list(page) {

		g_page = page;

		$.ajax({

			url : "../reply/list.do",
			data : {
				"b_idx" : "${ vo.b_idx}",
				"page" : page
			},
			success : function(res_data) {

				$("#reply_display").html(res_data);

			},
			error : function(err) {
				alert(err.responseText);
			}

		});

	}//end:reply_list()	

	/* ------------------------REPLY_LIST----------------------------------- */
</script>

<script type="text/javascript">

	
	//초기화 : 시작시
	$(document).ready(function() {
		
		//현재 게시물에 달린 댓글목록 출력
		reply_list(1);
		answer_list();
		
		
	});
</script>

 <!-- <script type="text/javascript">
	var oEditors = [];
	$(function() {
		nhn.husky.EZCreator
				.createInIFrame({
					oAppRef : oEditors,
					elPlaceHolder : "a_content", //textarea에서 지정한 id와 일치해야 합니다. 
					//SmartEditor2Skin.html 파일이 존재하는 경로
					sSkinURI : "${pageContext.request.contextPath}/resources/smarteditor2/SmartEditor2Skin.html",
					htParams : {
						// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
						bUseToolbar : true,
						// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
						bUseVerticalResizer : true,
						// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
						bUseModeChanger : true,
						fOnBeforeUnload : function() {

						}
					},
					fOnAppLoad : function() {
						//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
						/* oEditors.getById["ir1"].exec("PASTE_HTML", ["기존 DB에 저장된 내용을 에디터에 적용할 문구"]); */
						oEditors.getById["a_content"].exec();
					},
					fCreator : "createSEditor2"
				});

		/* //저장버튼 클릭시 form 전송
		$("#save").click(function() {
			oEditors.getById["a_content"].exec("UPDATE_CONTENTS_FIELD", []);
			$("#frm").submit();
		});
 */
		/* function save(f){
			
			oEditors.getById["b_content"].exec("UPDATE_CONTENTS_FIELD", []);
			
			f.action = "insert.do";
			f.submit();
		} */

	});
</script>  -->
</head>
<body class="index-page">

	<%@ include file="/WEB-INF/views/top.jsp"%>
	<!-- ---------------------------------------본문내용-------------------------------------------------------  -->
	<main class="main mt-300">
		<form method="post" enctype="multipart/form-data">

			<!-- 데이터 디스플레이는 하지 않고 넘기려는 데이터  -->
			<input type="hidden" name="b_idx" value="${vo.b_idx }"> <input
				type="hidden" name="m_name" value="${vo.m_name }"> <input
				type="hidden" name="b_rdate" value="${vo.b_rdate }">
			<!-- 데이터 디스플레이는 하지 않고 넘기려는 데이터  -->


			<!-- ------------------------------메인 헤더 출력 공간  --------------------------------------------------- -->
			<div class="container">
				<div>
					<h1>${vo.b_title }</h1>
					<p class="author-date">${vo.m_name}|Date:${vo.b_rdate}</p>
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
					<!-- ------------------------------메인 헤더 출력 공간  ---------------------------------------------- -->

					<!-- ------------------------------첨부 파일 이미지 출력 공간  ---------------------------------------- -->
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
					<!-- ------------------------------첨부 파일 이미지 출력 공간  ---------------------------------------- -->


					<!-- ------------------------------메인 내용 출력 공간  ---------------------------------------- -->
					<article>
						<div class="post-description">${vo.b_content }</div>
					</article>
					<!-- ------------------------------메인 내용 출력 공간  ---------------------------------------- -->
				</div>
			</div>

			<!-- ------------------------------답변 공간  ---------------------------------------- -->

		</form>
		<div class="container" style="margin-top: 10px; text-align: center;">
			<div id="answer_display"></div>
		</div>


		<div class="container" style="text-align:center;">

			<%-- <c:if test="${user.grade eq 'medical'}"> --%>
			<button class="diary-btn-yellow" data-bs-toggle="collapse"
				data-bs-target="#answer_togle" style="width:90%; margin-top:20px">답변</button>
			<div id="answer_togle" class="collapse">
				
					<div>
						<textarea rows="10" cols="30" id="a_content" name="a_content" 
							style="width: 90%; heigth:auto; margin-top:10px" placeholder="내용을 입력해주세요"></textarea>
					</div>
					<div>
						<label for="diary-btn-yellow" class="diary-btn-yellow">upload</label>
						<input id="diary-btn-yellow" name="photo" type="file" multiple="multiple" style="display: none;">
					</div>
					<div>
						<input type="button" class="diary-btn-yellow-outline" id="save" value="답변 등록" onclick="save_answer();" /> &nbsp;&nbsp;&nbsp;
						<input type="button" class="diary-btn-gray-outline" value="취소" /></td>
					</div>
			</div>
		</div>
		<%-- </c:if> --%>
		<!-- ----------------답변 공간 -------------------------------------->




		<!-- ----------------댓글 작성 폼 공간-------------------------------------->
		<div class="container" style="margin-top: 20px;">
			
			<div class="row">
				<div class="col-sm-10">
					<textarea rows="3" class="diary-btn-gray-outline-re" id="re_content" name="re_content"
						placeholder="로그인후에 댓글쓰기가 가능합니다"></textarea>
				</div>
				<div class="col-sm-2" style="display:flex;">
					<input class="diary-btn-yellow-outline-btn" style="display: flex; justify-content: center; align-items: center; id="btn_re_register" type="button" value="댓글쓰기"
						onclick="reply_insert();">
				</div>
			</div>
		</div>
		<!-- ----------------댓글 작성 폼 공간-------------------------------------->

		<!-- ----------------댓글 디스플레이 공간-------------------------------------->

		<div class="container">
			<div id="reply_display"></div>
		</div>
		<!-- ----------------댓글 디스플레이 공간-------------------------------------->



		<!-- Pagination menu -->
		<div class="container" style="text-align: center;">
			<div class="pagination">${pageMenu}</div>
		</div>



	</main>

</body>
</html>