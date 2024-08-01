<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>

<!--  Bootstrap  3.x  -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

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
	text-align:center;
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
	text-align:center;
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




<!-- 주소검색 API  -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">
	function check_nickname() {

		//회원가입 버튼은 비활성화
		// <input id="btn_register" type="button" ...  disabled="disabled">
		$("#btn_register").prop("disabled", true);

		//           document.getElementById("mem_id").value
		let m_nickname = $("#m_nickname ").val();

		if (m_nickname.length == 0) {

			$("#nickname_msg").html("");
			return;
		}

		if (m_nickname.length < 3) {

			$("#nickname_msg").html("닉네임는 3자리 이상 입력하세요").css("color", "red");
			return;
		}

		$.ajax({
			url : "check_nickname.do",
			data : {
				"m_nickname" : m_nickname
			},
			dataType : "json",
			success : function(res_data) {

				if (res_data.result) {

					$("#nickname_msg").html("사용가능한 닉네임 입니다").css("color",
							"blue");

					$("#btn_register").prop("disabled", false);

				} else {

					$("#nickname_msg").html("이미 사용중인 닉네임 입니다").css("color",
							"red");

				}
			},
			error : function(err) {
				alert(err.responseText);
			}
		});
	}//end:check_nickname() 
	function find_addr() {

		var themeObj = {
			bgColor : "#B51D1D" //바탕 배경색
		};

		new daum.Postcode({
			theme : themeObj,
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
				// 예제를 참고하여 다양한 활용법을 확인해 보세요.
				$("#m_zipcode").val(data.zonecode); //우편번호 넣기
				$("#m_addr").val(data.address); //주소넣기

			}
		}).open();

	}//end:find_addr()	

	function send(f) {

		let m_name = f.m_name.value.trim();
		let m_nickname = f.m_nickname.value.trim();
		//		let m_email = f.m_email.value.trim();
		let m_pwd = f.m_pwd.value.trim();
		let m_zipcode = f.m_zipcode.value.trim();
		let m_addr = f.m_addr.value.trim();

		let email_id = $("#email_id").val();
		let email_domain = $("#email_domain").val();

		if (m_name == '') {
			alert("이름을 입력하시오");
			f.m_name.value = "";
			f.m_name.focus();
			return;
		}

		if (m_nickname == '') {
			alert("이름을 입력하시오");
			f.m_nickname.value = "";
			f.m_nickname.focus();
			return;
		}

		if (m_pwd == '') {
			alert("비밀번호를 입력하시오");
			f.m_pwd.value = "";
			f.m_pwd.focus();
			return;
		}

		if (m_zipcode == '') {
			alert("우편번호를 입력하시오");
			f.m_zipcode.value = "";
			f.m_zipcode.focus();
			return;
		}

		if (m_addr == '') {
			alert("주소를 입력하시오");
			f.m_addr.value = "";
			f.m_addr.focus();
			return;
		}

		let m_email = email_id + "@" + email_domain;

		$("#m_email").val(m_email);

		f.action = "insert.do"; //MemberInsertAction
		f.submit(); //전송

	}//end:send()
</script>

<script type="text/javascript">
	function setEmailDomain(domain) {
		// '직접입력'을 선택한 경우, 도메인 입력 필드를 비웁니다.
		if (domain === '직접입력') {
			document.getElementById('email_domain').value = '';
		} else {
			// 선택된 도메인 값을 도메인 입력 필드에 설정합니다.
			document.getElementById('email_domain').value = domain;
		}
	}
</script>

<script type="text/javascript">
	/* 자바 스크립트 함수 선언(비밀번호 확인) */

	function passConfirm() {
		/* 비밀번호, 비밀번호 확인 입력창에 입력된 값을 비교해서 같다면 비밀번호 일치, 그렇지 않으면 불일치 라는 텍스트 출력.*/
		/* document : 현재 문서를 의미함. 작성되고 있는 문서를 뜻함. */
		/* getElementByID('아이디') : 아이디에 적힌 값을 가진 id의 value를 get을 해서 password 변수 넣기 */
		var password = document.getElementById('password'); //비밀번호 
		var passwordConfirm = document.getElementById('passwordConfirm'); //비밀번호 확인 값
		var confirmMsg = document.getElementById('confirmMsg'); //확인 메세지
		var correctColor = "blue"; //맞았을 때 출력되는 색깔.
		var wrongColor = "red"; //틀렸을 때 출력되는 색깔

		if (password.value == passwordConfirm.value) {//password 변수의 값과 passwordConfirm 변수의 값과 동일하다.
			confirmMsg.style.color = correctColor;/* span 태그의 ID(confirmMsg) 사용  */
			confirmMsg.innerHTML = "비밀번호 일치";/* innerHTML : HTML 내부에 추가적인 내용을 넣을 때 사용하는 것. */
		} else {
			confirmMsg.style.color = wrongColor;
			confirmMsg.innerHTML = "비밀번호 불일치";
		}
	}
</script>

</head>
<body class="bg-gray-100">
	<div class="container mx-auto p-6">
		<form class="form-inline">
			<input type="hidden" id="m_email" name="m_email">
			<div id="box">
				<div>
					<div class="panel-heading">
						<h4 style="text-align: center; font-size: 30px;">
							회&nbsp;원&nbsp;가&nbsp;입</h4>
					</div>
					<div>
						<table class="table">
							<tr>
								<th>이름</th>
								<td><input class="form-control" name="m_name"></td>
							</tr>

							<tr>
								<th>닉네임</th>
								<td><input class="form-control" name="m_nickname"></td>
							</tr>

							<tr>
								<th scope="row">이메일 <span class="em_red">*</span></th>
								<td><input type="text" id="email_id" class="form-control"
									value="" title="이메일 아이디" maxlength="18" /> @ <input
									type="text" id="email_domain" class="form-control" value=""
									title="이메일 도메인" maxlength="18" /> <select
									class="select, form-control" title="이메일 도메인 주소 선택"
									onclick="setEmailDomain(this.value);return false;">
										<option value="직접입력">-선택-</option>
										<option value="naver.com">naver.com</option>
										<option value="google.com">google.com</option>
										<option value="hanmail.net">hanmail.net</option>
										<option value="daum.net">daum.net</option>
										<option value="kakao.com">kakao.com</option>
										<option value="nate.com">nate.com</option>
								</select></td>
							</tr>

							<!-- 비밀번호 확인 -->
							<tr>
								<th>비밀번호</th>
								<td><input class="form-control" type="password"
									name="m_pwd" id="password"></td>
							</tr>
							<tr>
								<th>비밀번호 확인</th>
								<!-- onkeyup="JS function" 입력이 되었을 때, -->
								<td><input class="form-control" type="password"
									name="m_pwd_confirm" id="passwordConfirm"
									onkeyup="passConfirm()"> <span id="confirmMsg"></span></td>
							</tr>

							<tr>
								<th>우편번호</th>
								<td><input class="form-control" name="m_zipcode"
									id="m_zipcode">&nbsp;&nbsp;&nbsp;<input class="diary-btn-yellow"
									type="button" value="주소검색" onclick="find_addr();"></td>
							</tr>

							<tr>
								<th>주소</th>
								<td><input class="form-control" name="m_addr" id="m_addr"></td>
							</tr>

							<tr>
								<td colspan="2" align="center"><input
									class="diary-btn-yellow-outline" type="button" value="메인화면"
									onclick="location.href='../main.do'"> &nbsp;&nbsp;&nbsp;<input
									id="btn_register" class="diary-btn-gray-outline" type="button"
									value="가입하기" onclick="send(this.form);"></td>
							</tr>

						</table>
					</div>
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>