<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/common.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

 <style type="text/css">


textarea {
	resize: none;
}




.container th {
	/* color:red !important; */
	font-size: 18px;
	text-align:center;
	color:#3C4043 !important;
	padding:20px !important;
	vertical-align: middle;
	margin:0px !important;
}
.container td {
	padding:20px !important;
	
}

.container td, .container th{
	border:none !important;
}

h2 {
	text-align:center;
}

#container-diary {
	/* width: 80%; */
	/* vertical-align: middle !important;
	text-align:center !important;
	background-color:green;
	vertical-align: middle !important; */
}

.box {
	margin-top:150px;
}


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
	margin-left:20px;
	margin-right:20px;
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


<script type="text/javascript">
	function send(f) {

		/* 		let b_subject = f.b_subject.value.trim();
		 let b_content = f.b_content.value.trim();
		
		 if(b_subject==''){
		 alert("제목을 입력하세요!!");
		 f.b_subject.value="";
		 f.b_subject.focus();
		 return;
		 }
		
		 if(b_content==''){
		 alert("내용을 입력하세요!!");
		 f.b_content.value="";
		 f.b_content.focus();
		 return;
		 } */

		// 수정하기
		f.action = "diary_modify_weight.do";
		f.submit();

	}

	function send_f(f) {
		f.action = "diary_modify_feeding.do";
		f.submit();

	}

	function send_s(f) {
		f.action = "diary_modify_stoll.do";
		f.submit();

	}

	function send_h(f) {
		f.action = "diary_modify_health.do";
		f.submit();

	}

	function send_o(f) {
		f.action = "diary_modify_note.do";
		f.submit();

	}
</script>



</head>
<body>

	<!-- top 옵션-->
	<%@include file="../top.jsp"%>
	<h4>수정하기</h4><br>
	
  	<div class="box">	
  	<div id="container-diary" class="container">
  	<h2 style="font-family: 'Noto Sans KR', sans-serif;" >수정하기</h2><br>
	<c:choose>
		<c:when test="${table_name == 'weight'}">
			<form method="post">
				<input type="hidden" name="w_idx" value="${ map.W_IDX }">
				<div id="box">
						<table class="table">
							<tr>
								<th>날짜</th>
								<td><fmt:formatDate value="${map.W_RDATE}"
										pattern="yyyy-MM-dd" var="formattedDate" /> <input
									class="form-control form-control-lg" type="date" name="w_rdate"
									value="${formattedDate}" /></td>
							</tr>
							<tr>
								<th>반려동물</th>
								<td><select class="form-control form-control-lg" name="p_idx">
							        <c:forEach var="pet" items="${pets}">
							            <option value="${pet.p_idx}" ${pet.p_idx == map.P_IDX ? 'selected' : ''}>${pet.p_name}</option>
							        </c:forEach>
							    </select></td>
							</tr>
							<tr>
								<th>체중(kg)</th>
								<td><input class="form-control form-control-lg"
									type="number" name="w_weight" step="0.01"
									value="${map.W_WEIGHT}"></td>
							</tr>
						</table>


						<div style="margin-top: 10px; text-align:center; ">
							<input class="diary-btn-yellow-outline"  type="button" value="목록보기"
								onclick="location.href='diary_list.do'"> <input
								class="diary-btn-yellow" type="button" value="수정하기"
								onclick="send(this.form);">
						</div>


					</div>
			</form>
		</c:when>


		<c:when test="${table_name == 'stoll'}">
			<form method="post">
				<input type="hidden" name="s_idx" value="${ map.S_IDX }">
				
				<table class="table">
					<tr>
						<th>날짜</th>
						<td><fmt:formatDate value="${map.S_RDATE}"
								pattern="yyyy-MM-dd" var="formattedDate" /> <input
							class="form-control form-control-lg" type="date" name="s_rdate"
							value="${formattedDate}" /></td>
					</tr>
					<tr>						
						<th>반려동물</th>
						<td><select class="form-control form-control-lg" name="p_idx">
					        <c:forEach var="pet" items="${pets}">
					            <option value="${pet.p_idx}" ${pet.p_idx == map.P_IDX ? 'selected' : ''}>${pet.p_name}</option>
					        </c:forEach>
					    </select></td>
					</tr>
					<tr>
						<th>시작 시간</th>
						<td><fmt:formatDate value="${map.S_STIME}" pattern="HH:mm"
								var="formattedTime" /> <input
							class="form-control form-control-lg" type="time" name="s_stime"
							value="${formattedTime}" /></td>
					</tr>
					<tr>
						<th>종료 시간</th>
						<td><fmt:formatDate value="${map.S_ETIME}" pattern="HH:mm"
								var="formattedTime" /> <input
							class="form-control form-control-lg" type="time" name="s_etime"
							value="${formattedTime}" /></td>
					</tr>
					<tr>
						<th>거리 (m)</th>
						<td><input class="form-control form-control-lg" type="number"
							name="s_distance" value="${map.S_DISTANCE}" /></td>
					</tr>
					<tr>
						<th>메모</th>
						<td><textarea class="form-control form-control-lg"
								name="s_memo" rows="3">${map.S_MEMO}</textarea></td>
					</tr>
				</table>
				<div style="margin-top: 10px; text-align:center; ">
				<input class="diary-btn-yellow-outline"  type="button" value="목록보기"
					onclick="location.href='diary_list.do'"> <input
					class="diary-btn-yellow" type="button" value="수정하기"
					onclick="send_s(this.form);">
			</div>
			</form>
			
		</c:when>

		<c:when test="${table_name == 'feeding'}">
			<form method="post">
				<input type="hidden" name="f_idx" value="${ map.F_IDX }">
				<table class="table">
					<tr>
						<th>날짜</th>
						<td><fmt:formatDate value="${map.F_RDATE}"
								pattern="yyyy-MM-dd" var="formattedDate" /> <input
							class="form-control form-control-lg" type="date" name="f_rdate"
							value="${formattedDate}" /></td>
					</tr>
					<tr>
						<th>반려동물</th>
						<td><select class="form-control form-control-lg" name="p_idx">
					        <c:forEach var="pet" items="${pets}">
					            <option value="${pet.p_idx}" ${pet.p_idx == map.P_IDX ? 'selected' : ''}>${pet.p_name}</option>
					        </c:forEach>
					    </select></td>
					</tr>
					<tr>
						<th>시간</th>
						<td><fmt:formatDate value="${map.F_TIME}" pattern="HH:mm"
								var="formattedTime" /> <input
							class="form-control form-control-lg" type="time" name="f_time"
							value="${formattedTime}" /></td>
					</tr>
					<tr>
						<th>종류</th>
							<td><select class="form-control form-control-lg" id="f_type"
								name="f_type">
									<option value="">카테고리 선택</option>
									<option value="사료" ${map.F_TYPE == '사료' ? 'selected' : ''}>사료</option>
									<option value="간식" ${map.F_TYPE == '간식' ? 'selected' : ''}>간식</option>
									<option value="영양제" ${map.F_TYPE == '영양제' ? 'selected' : ''}>영양제</option>
							</select></td>

						</tr>
					<tr>
						<th>사료명</th>
						<td><input class="form-control form-control-lg" type="text"
							name="f_pname" value="${map.F_PNAME}" /></td>
					</tr>
				</table>

				<div style="margin-top: 10px; text-align:center; ">
					<input class="diary-btn-yellow-outline"  type="button" value="목록보기"
						onclick="location.href='diary_list.do'"> <input
						class="diary-btn-yellow" type="button" value="수정하기"
						onclick="send_f(this.form);">
				</div>
			</form>

		</c:when>


		<c:when test="${table_name == 'health'}">
			<form method="post">
				<input type="hidden" name="h_idx" value="${ map.H_IDX }">
				<table class="table">
					<tr>
						<th>날짜</th>
						<td><fmt:formatDate value="${map.H_RDATE}"
								pattern="yyyy-MM-dd" var="formattedDate" /> <input
							class="form-control form-control-lg" type="date" name="h_rdate"
							value="${formattedDate}" /></td>
					</tr>
					<tr>
						<th>반려동물</th>
						<td><select class="form-control form-control-lg" name="p_idx">
					        <c:forEach var="pet" items="${pets}">
					            <option value="${pet.p_idx}" ${pet.p_idx == map.P_IDX ? 'selected' : ''}>${pet.p_name}</option>
					        </c:forEach>
					    </select></td>
					</tr>
					<tr>
						<th>시간</th>
						<td><fmt:formatDate value="${map.H_TIME}" pattern="HH:mm"
								var="formattedTime" /> <input
							class="form-control form-control-lg" type="time" name="h_time"
							value="${formattedTime}" /></td>
					</tr>
					<tr>
						<th>비용</th>
						<td><input class="form-control form-control-lg" type="number"
							name="h_cost" step="0.01" value="${map.H_COST}" /></td>
					</tr>
					<tr>
						<th>종류</th>
							<td><select class="form-control form-control-lg" id="h_type"
								name="h_type" required="">
									<option value="">종류 선택</option>
									<option value="진료"
										<c:if test="${map.H_TYPE == '진료'}">selected</c:if>>진료</option>
									<option value="접종"
										<c:if test="${map.H_TYPE == '접종'}">selected</c:if>>접종</option>
							</select></td>
						</tr>
					<tr>
						<th>내용</th>
						<td><textarea class="form-control form-control-lg"
								name="h_content" rows="3">${map.H_CONTENT}</textarea></td>
					</tr>
					<tr>
						<th>진단명</th>
						<td><input class="form-control form-control-lg" type="text"
							name="h_hname" value="${map.H_HNAME}" /></td>
					</tr>
					<tr>
						<th>다음 진료일</th>
						<td><fmt:formatDate value="${map.H_NDATE}"
								pattern="yyyy-MM-dd" var="formattedDate" /> <input
							class="form-control form-control-lg" type="date" name="h_ndate"
							value="${formattedDate}" /></td>
					</tr>
				</table>
				<div style="margin-top: 10px; text-align:center; ">
				<input class="diary-btn-yellow-outline"  type="button" value="목록보기"
					onclick="location.href='diary_list.do'"> <input
					class="diary-btn-yellow" type="button" value="수정하기"
					onclick="send_h(this.form);">
				</div>
			</form>


		</c:when>


		<c:when test="${table_name == 'note'}">
			<form method="post">
				<input type="hidden" name="o_idx" value="${ map.O_IDX }">
				<table class="table">
					<tr>
						<th>날짜</th>
						<td><fmt:formatDate value="${map.O_RDATE}"
								pattern="yyyy-MM-dd" var="formattedDate" /> <input
							class="form-control form-control-lg" type="date" name="o_rdate"
							value="${formattedDate}" /></td>
					</tr>
					<tr>
						<th>반려동물</th>
						<td><select class="form-control form-control-lg" name="p_idx">
					        <c:forEach var="pet" items="${pets}">
					            <option value="${pet.p_idx}" ${pet.p_idx == map.P_IDX ? 'selected' : ''}>${pet.p_name}</option>
					        </c:forEach>
					    </select></td>
					</tr>
					<tr>
						<th>시간</th>
						<td><fmt:formatDate value="${map.O_TIME}" pattern="HH:mm"
								var="formattedTime" /> <input
							class="form-control form-control-lg" type="time" name="o_time"
							value="${formattedTime}" /></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea class="form-control form-control-lg"
								name="o_content" rows="3">${map.O_CONTENT}</textarea></td>
					</tr>
				</table>
				<div style="margin-top: 10px; text-align:center; ">
				<input class="diary-btn-yellow-outline"  type="button" value="목록보기"
					onclick="location.href='diary_list.do'"> <input
					class="diary-btn-yellow" type="button" value="수정하기"
					onclick="send_o(this.form);">
				</div>
			</form>

		</c:when>
	</c:choose>
	</div>
	</div>
</body>
</html>