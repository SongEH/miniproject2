<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 페이지 메뉴 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js">
</script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js">
</script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js">
</script>

<style type="text/css">
#page {
	margin: auto;
	text-align: center;
}

article {
	padding: 1rem;
	background: #fff;
	margin-top: 2rem;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	height: 100%;
}

.container {
	width: 80%;
	margin: auto;
	overflow: hidden;
}

.post-description {
	text-align: left;
	width: 100%;
	height: auto;
	padding: 1rem;
	background: #fff;
	margin-top: 2rem;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	font-size: 13px;
}
.post-content{
	
	font-size: 15px;

}

.but {
	display: flex;
	align-items: center; /* 수직 중앙 정렬 */
	justify-content: center; /* 수평 중앙 정렬 (선택 사항) */
	 vertical-align: middle;
	height: auto;
}
</style>

<script type="text/javascript">
    // Define the answer_modify function
    function answer_modify(f) {
    	
	let a_idx = f.a_idx.value;
	let a_content = f.a_content.value;
	
	f.action = "../answer/modify_form.do"
	f.submit();
    	
    }
    
    
 /*  삭제부분  */
    function answer_delete(a_idx) {
        if (confirm("정말 삭제하시겠습니까?") === false)
            return;

        $.ajax({
            url: "../answer/delete.do",
            method: "POST",
            data: {
                "a_idx": a_idx
            },
            dataType: "json",
            success: function(res_data) {
                if (res_data.result === true) {
                    alert("삭제 성공!");
                    $("#answer_" + a_idx).remove();
                } else {
                    alert("삭제 실패!");
                }
            },
            error: function(err) {
                alert(err.responseText);
            }
        });
    }
</script>

</head>
<body>

	<%@ include file="/WEB-INF/views/top.jsp"%>
	<form accept-charset="utf-8">
		<c:forEach var="vo" items="${list}">
			<div class="container" style="margin-top: 5px;" id="answer_${vo.a_idx}">
				<input type="hidden" name="a_idx" value="${vo.a_idx }"> <input
					type="hidden" name="a_content" value="${vo.a_content }"> <input
					type="hidden" name="b_idx" value="${vo.b_idx }"> <input
					type="hidden" name="b_cate" value="${vo.b_cate }">
					<div class="col-md-10 col-lg-10"
						style="text-align: right; overflow: auto;">
						<div class="post-description">
							${vo.m_name} (
							<fmt:parseDate value="${vo.a_rdate}"
								pattern="yyyy-MM-dd HH:mm:ss." var="parsedDate" />
							<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${parsedDate}" />
							)
							<div class="post-content mt-5">
							 ${vo.a_content}
							</div>
							<div id="answer_modify_display_${vo.a_idx}">
								<!-- Editable content will be loaded here -->
							</div>
						</div>
					</div>
					<div class="col-md-2 col-lg-2 but">
						<!-- 자신의 글만 삭제메뉴 활성화 -->
						<c:if test="${user.m_idx eq vo.m_idx}">
							<div>
								<button type="button" class="btn btn-danger"
									onclick="answer_delete(${vo.a_idx});">삭제</button>
								<button type="button" class="btn btn-warning"
									onclick="answer_modify(this.form);">수정</button>
							</div>
						</c:if>
					</div>
			</div>
		</c:forEach>
	</form>
</body>
</html>