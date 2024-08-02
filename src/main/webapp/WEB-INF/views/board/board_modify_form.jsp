<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String ctx = request.getContextPath(); //콘텍스트명 얻어오기.
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SmartEditor</title>

<!-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인) -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/smarteditor2/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<!-- jQuery를 사용하기위해 jQuery라이브러리 추가 -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.0.min.js"></script>

<script type="text/javascript">


var oEditors = [];
$(function(){
      nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors,
          elPlaceHolder: "b_content", //textarea에서 지정한 id와 일치해야 합니다. 
          //SmartEditor2Skin.html 파일이 존재하는 경로
          sSkinURI: "${pageContext.request.contextPath}/resources/smarteditor2/SmartEditor2Skin.html",
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
				oEditors.getById["b_content"].exec();
			},
			fCreator : "createSEditor2"
		});

		//저장버튼 클릭시 form 전송
		$("#modify").click(function() {
			oEditors.getById["b_content"].exec("UPDATE_CONTENTS_FIELD", []);
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

.main {
	padding-top: 200px;
}

select {
	display: inline-block;
	width: 80%
}
</style>

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

document.getElementById('diary-btn-yellow').addEventListener('change', function() {
    var fileList = this.files;
    var fileNames = [];
    for (var i = 0; i < fileList.length; i++) {
        fileNames.push(fileList[i].name);
    }
    document.getElementById('file-names').innerText = fileNames.join(', ');
});

</script>


</head>
<body>
	<%@ include file="/WEB-INF/views/top.jsp"%>
	<div class="container">
		<div class="main">
			<form id="frm" action="modify.do" method="post"
				enctype="multipart/form-data">
				<!-- 전달해야하는 데이터 공간 -->
				<input type="hidden" name="b_idx" value="${vo.b_idx }">
				<!-- 전달해야하는 데이터 공간 -->

				<table class="table" width="100%">
					<tr>
						<td style="width: 10%">제목</td>
						<td><input type="text" id="title" name="b_title" value="${vo.b_title }" 
							style="width: 100%" placeholder="제목을 입력하세요" /></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea rows="10" cols="30" id="b_content"
								name="b_content" style="width: 100%; height: 500px;"
								placeholder="내용을 입력해주세요">${vo.b_content }</textarea></td>
					</tr>
					<tr>
						<td>카테고리</td>
						<td><select id="category" name="b_cate">
								<option value="free">자유게시판</option>
								<option value="medical">의학상담</option>
								<option value="mate">산책메이트</option>
						</select></td>
					</tr>

					<tr>
						<td>사진</td>
						<td><label for="diary-btn-yellow" class="diary-btn-yellow">사진</label>
							<input id="diary-btn-yellow" name="photo" type="file"
							multiple="multiple" style="display: none;">
							<div id="file-names"></div></td>
					</tr>
					<tr style="border-bottom: none;">
						<td></td>
						<td><input type="submit" class="diary-btn-yellow-outline"
							id="modify" value="수정" /> <input type="button"
							class="diary-btn-gray-outline" value="취소" /></td>
					</tr>
				</table>


			</form>
			</main>
			<!-- <div style="text-align: center;">
				<input type="submit" id="modify" value="수정" /> <input type="button"
					value="취소" />
			</div> -->
			
		<%-- 	<div class="post-images">
				<c:forEach var="image" items="${vo.image_list}">
					<div class="post-img">
						<img src="../resources/images/${image.b_filename}" alt=""
							class="img-thumbnail"
							onclick="location.href='view.do?b_idx=${item.b_idx}'">
					</div>
				</c:forEach>

			</div> --%>
		</div>
	</div>



</body>
</html>

