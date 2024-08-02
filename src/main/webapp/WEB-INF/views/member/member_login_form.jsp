<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 수정</title>
<link
	href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css"
	rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/alpinejs@2.8.2" defer></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	//javascript 초기화
	//window.onload = function(){};

	//jQuery 초기화
	$(document).ready(function() {

		//showMessage();
		setTimeout(showMessage, 100);//0.1초후에 메시지 띄워라

	});

	function showMessage() {
		// /member/login_form.do?reason=fail_id => "true"
		if ("${ param.reason == 'fail_email'}" == "true") {
			alert("이메일을 다시 입력해주십시오");
		}

		// /member/login_form.do?reason=fail_pwd => "true"
		if ("${ param.reason == 'fail_pwd'}" == "true") {
			alert("비밀번호를 다시 입력해주십시오");
		}

		// /member/login_form.do?reason=session_timeout
		if ("${ param.reason == 'session_timeout'}" == "true") {
			alert("로그아웃되었습니다\n로그인후 게시글을 등록하세요!!");
		}

	}

	function send(f) {

		let m_email = f.m_email.value.trim();
		let m_pwd = f.m_pwd.value.trim();

		if (m_email == '') {
			alert("이메일을 입력하시오");
			f.m_email.value = "";
			f.m_email.focus();
			return;
		}

		if (m_pwd == '') {
			alert("비밀번호를 입력하시오");
			f.m_pwd.value = "";
			f.m_pwd.focus();
			return;
		}

		f.action = "login.do";
		f.submit();

	}//end:send()
</script>

<style>
.diary-btn-yellow {
	background-color: #FADA5A;
	position: relative;
	padding: 15px;
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
	padding: 15px;
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
	padding: 15px;
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


</head>
<body class="bg-gray-100">
	<div class="container mx-auto p-6">
		<h1 class="text-3xl font-bold mb-6" style="margin-top: 150px;">로&nbsp;그&nbsp;인</h1>
		<div class="bg-white shadow-md rounded-lg p-6">
			<form
				action="${pageContext.request.contextPath}/member/login_form.do"
				method="post">
				<input type="hidden" name="url" value="${param.url}">

				<div class="mb-4">
					<label for="m_email" class="block text-gray-700 font-bold mb-2">이메일</label>
					<input type="email" id="m_email" name="m_email"
						value="${member.m_email}"
						class="w-full p-2 border border-gray-300 rounded">
				</div>

				<div class="mb-4">
					<label for="m_pwd" class="block text-gray-700 font-bold mb-2">비밀번호</label>
					<input type="password" id="m_pwd" name="m_pwd"
						value="${member.m_pwd}"
						class="w-full p-2 border border-gray-300 rounded">
				</div>


				<div class="flex justify-end">
					<input type="button" value="회원가입"
						class="diary-btn-yellow-outline bg-blue-500 hover:bg-yellow-100 font-bold py-2 px-4 rounded"
						onclick="location.href='insert_form.do'">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="button"
						value="로그인"
						class="diary-btn-gray-outline bg-blue-500 hover:bg-yellow-100 font-bold py-2 px-4 rounded"
						onclick="send(this.form);">
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>