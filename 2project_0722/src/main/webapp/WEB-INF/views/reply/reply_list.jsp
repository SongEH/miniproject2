<<<<<<< HEAD
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

</head>
<body>





	<div class="container">

		<!-- for(CommentVo vo : list) -->


		<div class="row">


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
			

				<div class="col-sm-2">
					<!-- 자신의 글만 삭제메뉴 활성화 -->
					<c:if test="${ user.m_idx eq vo.m_idx }">
						<div class=" style="text-align:right;">
							<input type="button" value="x"
								onclick="reply_delete('${ vo.re_idx}');">
						</div>
					</c:if>
				</div>
				<hr>
			</c:forEach>

		</div>
	</div>


	<!-- Page Menu -->


	<c:if test="${ not empty list }">
		<div class="container" style="text-align: center;">
			<div id="page" class="pagination">${ pageMenu_reply }</div>
		</div>
	</c:if>
</body>
=======
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

</head>
<body>





	<div class="container">

		<!-- for(CommentVo vo : list) -->


		<div class="row">


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
			

				<div class="col-sm-2">
					<!-- 자신의 글만 삭제메뉴 활성화 -->
					<c:if test="${ user.m_idx eq vo.m_idx }">
						<div class=" style="text-align:right;">
							<input type="button" value="x"
								onclick="reply_delete('${ vo.re_idx}');">
						</div>
					</c:if>
				</div>
				<hr>
			</c:forEach>

		</div>
	</div>


	<!-- Page Menu -->


	<c:if test="${ not empty list }">
		<div class="container" style="text-align: center;">
			<div id="page" class="pagination">${ pageMenu_reply }</div>
		</div>
	</c:if>
</body>
>>>>>>> refs/remotes/origin/CheonTk's-Branch
</html>