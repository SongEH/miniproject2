<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String ctx = request.getContextPath(); //콘텍스트명 얻어오기.
System.out.print(ctx);
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SmartEditor</title>

<!-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인) -->
<script type="text/javascript"
	src="<%=ctx%>/resources/smarteditor2/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<!-- jQuery를 사용하기위해 jQuery라이브러리 추가 -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.0.min.js"></script>

<script type="text/javascript">


var oEditors = [];
$(function(){
      nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors,
          elPlaceHolder: "ir1", //textarea에서 지정한 id와 일치해야 합니다. 
          //SmartEditor2Skin.html 파일이 존재하는 경로
          sSkinURI: "<%=ctx%>/resources/smarteditor2/SmartEditor2Skin.html",
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
						oEditors.getById["ir1"].exec();
					},
					fCreator : "createSEditor2"
				});

		//저장버튼 클릭시 form 전송
		$("#modify").click(function() {
			oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
			$("#frm").submit();
		});

	});
</script>

<style type="text/css">
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

</head>
<body>
	<form id="frm" action="modify.do" method="post"
		enctype="multipart/form-data">
	
		<!-- 전달해야하는 데이터 공간 -->
		<input type="hidden" name="b_idx" value="${vo.b_idx }">
		<!-- 전달해야하는 데이터 공간 -->
		
		<table width="100%">
			<tr>
				<td>제목</td>
				<td><input type="text" id="title" value="${vo.b_title}"
					name="b_title" style="width: 650px" /></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="10" cols="30" id="ir1" name="b_content"
						style="width: 650px; height: 350px;">${vo.b_content }</textarea></td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td><select id="" name="b_cate">
						<option value="free">자유게시판</option>
						<option value="medical">의학상담</option>
						<option value="mate">산책메이트</option>
				</select></td>
			</tr>

			<tr>
				<td>사진</td>
				<td><input name="photo" type="file" multiple="multiple">
				</td>
			</tr>
		</table>

	</form>
	<div style="text-align: center;">
		<input type="submit" id="modify" value="수정" /> <input type="button"
			value="취소" />
	</div>

	<div class="post-images">
		<c:forEach var="image" items="${vo.image_list}">
			<div class="post-img">
				<img src="../resources/images/${image.b_filename}" alt=""
					class="img-thumbnail"
					onclick="location.href='view.do?b_idx=${item.b_idx}'">
			</div>
		</c:forEach>

	</div>




</body>
</html>

