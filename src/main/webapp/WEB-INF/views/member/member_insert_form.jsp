<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/alpinejs@2.8.2" defer></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
	function execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				var addr = '';
				if (data.userSelectedType === 'R') {
					addr = data.roadAddress;
				} else {
					addr = data.jibunAddress;
				}
				document.getElementById('m_zipcode').value = data.zonecode;
				document.getElementById('m_addr').value = addr;
			}
		}).open();
	}

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
		var password = $('#m_pwd').val();
		var passwordConfirm = $('#passwordConfirm').val();
		var confirmMsg = $('#confirmMsg');
		var correctColor = "blue";
		var wrongColor = "red";

		if (password === passwordConfirm) {
			confirmMsg.css('color', correctColor);
			confirmMsg.html("비밀번호 일치");
		} else {
			confirmMsg.css('color', wrongColor);
			confirmMsg.html("비밀번호 불일치");
		}
	}
</script>
</head>
<body class="bg-gray-100">
	<div class="container mx-auto p-6">
		<h1 class="text-3xl font-bold mb-6" style="margin-top:150px;">회&nbsp;원&nbsp;가&nbsp;입</h1>
		<div class="bg-white shadow-md rounded-lg p-6">
			<form
				action="${pageContext.request.contextPath}/member/insert_form.do"
				method="post">
				<input type="hidden" name="m_email" id="m_email">

				<div class="mb-4">
					<label for="m_name" class="block text-gray-700 font-bold mb-2">이름</label>
					<input type="text" id="m_name" name="m_name"
						class="w-full p-2 border border-gray-300 rounded">
				</div>

				<div class="mb-4">
					<label for="m_nickname" class="block text-gray-700 font-bold mb-2">닉네임</label>
					<input type="text" id="m_nickname" name="m_nickname"
						class="w-full p-2 border border-gray-300 rounded"
						onkeyup="check_nickname();"> <span id="nickname_msg"></span>
				</div>

				<div class="mb-4">
					<label for="m_email" class="block text-gray-700 font-bold mb-2">이메일<span
						class="em_red">*</span></label> <input type="text" id="email_id" value=""
						title="이메일 아이디" maxlength="18"
						class="w-full p-2 border border-gray-300 rounded"> @ <input
						type="text" id="email_domain" value="" title="이메일 도메인"
						maxlength="18" class="w-full p-2 border border-gray-300 rounded" />
					<select class="select, form-control" title="이메일 도메인 주소 선택"
						onclick="setEmailDomain(this.value);return false;">
						<option value="직접입력">-선택-</option>
						<option value="naver.com">naver.com</option>
						<option value="google.com">google.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="daum.net">daum.net</option>
						<option value="kakao.com">kakao.com</option>
						<option value="nate.com">nate.com</option>
					</select>
				</div>

				<div class="mb-4">
					<label for="m_pwd" class="block text-gray-700 font-bold mb-2">비밀번호</label>
					<input type="password" id="m_pwd" name="m_pwd"
						class="w-full p-2 border border-gray-300 rounded">
				</div>
				<div class="mb-4">
					<label for="m_pwd" class="block text-gray-700 font-bold mb-2">비밀번호
						확인</label> <input type="password" id="passwordConfirm"
						name="m_pwd_confirm"
						class="w-full p-2 border border-gray-300 rounded"
						onkeyup="passConfirm()"> <span id="confirmMsg"></span>
				</div>

				<div class="mb-4">
					<label for="m_zipcode" class="block text-gray-700 font-bold mb-2">우편번호</label>
					<div class="flex">
						<input type="text" id="m_zipcode" name="m_zipcode"
							class="w-7/8 p-2 border border-gray-300 rounded"> <input
							type="button" value="주소검색"
							class="w-1/8 bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded ml-2"
							onclick="execDaumPostcode()">
					</div>
				</div>

				<div class="mb-4">
					<label for="m_addr" class="block text-gray-700 font-bold mb-2">주소</label>
					<input id="m_addr" name="m_addr"
						class="w-full p-2 border border-gray-300 rounded">
				</div>



				<div class="flex justify-end">
					<input type="button" value="메인화면"
						class="diary-btn-yellow-outline bg-white-500 hover:bg-yellow-100 font-bold py-2 px-4 rounded"
						onclick="location.href='../main.do'">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="button"
						value="가입하기"
						class="diary-btn-gray-outline bg-blue-100 hover:bg-yellow-100 font-bold py-2 px-4 rounded"
						onclick="send(this.form);">
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>