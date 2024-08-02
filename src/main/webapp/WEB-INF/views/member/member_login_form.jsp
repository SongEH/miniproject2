<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!--  Bootstrap  3.x  -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/css/common.css">


<script type="text/javascript">
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


<script type="text/javascript">
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
</script>

<style>
/*  diary-btn-yellow  */
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

.container {
	width: 50%;
	height: 50%;
	top: 50%;
	left: 50%;
}
.container th, .container td {
	border: none !important;
}
</style>


</head>
<body class="bg-gray-100">

<div class="container mx-auto p-6">
	<form class="form-inline" >
		<input type="hidden" name="url" value="${param.url}">
		<div id="box">
			<div>
				<div>
					<h3 style="text-align: center;font-size: 30px;">로&nbsp;그&nbsp;인</h3>
				</div>
				<div class="container">
					<table class="table">
						<tr>
							<th>이메일</th>
							<td><input class="form-control" name="m_email"
								value="${ param.m_email }"></td>
						</tr>

						<tr>
							<th>비밀번호</th>
							<td><input class="form-control" type="password" name="m_pwd"
								value="${param.m_pwd }"></td>
						</tr>

						<tr>
							<td colspan="2" align="center"><input
								class="diary-btn-yellow-outline" type="button" value="회원가입"
								onclick="location.href='insert_form.do'">
								&nbsp;&nbsp;&nbsp;&nbsp;
								<input
								class="diary-btn-gray-outline" type="button" value="로그인"
								onclick="send(this.form);"></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</form>
	</div>
	
	
	
	
</body>
</html>