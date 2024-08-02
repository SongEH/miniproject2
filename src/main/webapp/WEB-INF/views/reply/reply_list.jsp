<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--  페이지 메뉴 부트스트랩 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">
#page {
	margin: auto;
	text-align: center;
}
</style>

<script type="text/javascript">
	function reply_delete(re_idx) {

		if (confirm("정말 삭제하시겠습니까?") == false)
			return;

		$.ajax({
			url : "../reply/delete.do",
			data : {
				"re_idx" : re_idx
			},
			dataType : "json",
			success : function(res_data) {

				//res_data = {"result" : true } or {"result" : false }
				if (res_data.result == false) {
					alert("삭제 실패!!");
					return;
				}
				reply_list(g_page);

			},
			error : function(err) {
				alert(err.responseText);
			}
		});
	}
</script>

<script type="text/javascript">
	function reply_modify(re_idx) {

		if ("${ empty user }" == "true") {

			if (confirm("로그인후 댓글쓰기가 가능합니다\n로그인 하시겠습니까?") == false)
				return;

			location.href = "../member/login_form.do?url="
					+ encodeURIComponent(location.href);

			return;
		}

		$.ajax({
			url : "../reply/modify_form.do",
			data : {
				"re_idx" : re_idx
			},
			dataType : "json",
			success : function(res_data) {

				//res_data = {"result" : true } or {"result" : false }
				if (res_data.result == false) {
					alert("삭제 실패!!");
					return;
				}

				$('#recontent').val(res_data.re_content);
				$('#modify_re_idx').val(re_idx);
				$('#m_name').text(res_data.m_name);
				$('#re_rdate').text(res_data.re_rdate);
				$('#reply_modify_form').show();
				$('#reply_buttons').hide();

			},
			error : function(err) {
				alert(err.responseText);
			}
		});
	}
</script>


<script type="text/javascript">
	var g_page = 1;
	function save_reply_modify() {
		let re_idx = $('#modify_re_idx').val();
		let re_content = $('#recontent').val();

		$.ajax({
			url : "../reply/modify.do",
			method : "POST",
			data : {
				"re_idx" : re_idx,
				"re_content" : re_content
			},
			dataType : "json",
			success : function(res_data) {
				if (res_data.result == false) {
					alert("수정 실패!!");
					return;
				}
				alert("수정 성공");
				$('#reply_modify_form').hide();
				$('#reply_buttons').show();

				reply_list(g_page); // Refresh the list

			},
			error : function(err) {
				alert(err.responseText);
			}
		});
	}
</script>


</head>
<body>





	<div class="container">

		<!-- for(CommentVo vo : list) -->


		<div class="row" id="reply_buttons">


			<c:forEach var="vo" items="${ list }">
				<div class="col-sm-10">
					<div>${ vo.m_name }
						(
						<fmt:parseDate value="${vo.re_rdate}"
							pattern="yyyy-MM-dd HH:mm:ss." var="parsedDate" />
						<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${parsedDate }" />
						)
					</div>
					<div>${ vo.re_content }</div>
				</div>
				<!-- 자신의 글만 삭제메뉴 활성화 -->
				<c:if test="${ user.m_idx eq vo.m_idx }">
					<div id="" style="text-align: right;">
						<input type="button" value="수정"
							onclick="reply_modify('${ vo.re_idx}');"> <input
							type="button" value="삭제" onclick="reply_delete('${ vo.re_idx}');">
					</div>
				</c:if>
			</c:forEach>
		</div>


		<div id="reply_modify_form" style="display: none;">
			<p id="m_name">${m_name }</p>
			<p id="re_rdate">${re_rdate }</p>
			<textarea id="recontent" rows="4" cols="50">${re_content }</textarea>
			<br> <input type="hidden" id="modify_re_idx" />
			<button type="button" onclick="save_reply_modify()">저장</button>
			<button type="button">취소</button>
		</div>
	</div>





	<!-- Page Menu -->


	<c:if test="${ not empty list }">
		<div class="container" style="text-align: center;">
			<div id="page" class="pagination">${ pageMenu_reply }</div>
		</div>
	</c:if>
</body>
</html>