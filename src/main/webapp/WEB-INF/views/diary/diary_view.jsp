<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link rel="stylesheet" href="../resources/css/common.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	
<style type="text/css">

   
   .common{
      border: 1px solid #cccccc;
      padding: 5px;
      margin-bottom: 5px;
      box-shadow: 1px 1px 1px #333333;
   }
   
   .content{
      min-height: 150px;
   }
   
   #cmt_content{
      width: 100%;
      height: 80px;
      resize: none;
      
   }
   
   #btn_cmt_register{
      width: 100%;
      height: 80px;
   }
   
   
.box {
margin-top:150px;
	/* width: 800px;
	height: 600px;
	margin: auto;
	display: flex;
	justify-content: center;
	align-items: center;
	overflow: hidden; */
}

.container {
	width: 80%;
}

/* .th_h{
	margin-top:15px !important;
} */
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
</style>

<script type="text/javascript">

	function del(table_name, idx){
		if(confirm("정말 삭제하시겠습니까?") == false) return;
		location.href = "diary_delete.do?table_name=" + table_name + "&idx=" + idx;
	}

</script>


</head>
<body>

	<!-- top 옵션-->
	<%@include file="../top.jsp"%>
  	
  	<div class="box">
  	상세보기<br>

			<c:choose>
				<c:when test="${table_name == 'weight'}">
				<table class="table">
					<tr>
						<th>날짜</th>
						<td>
							<fmt:formatDate value="${map.W_RDATE}" pattern="yyyy-MM-dd" var="formattedDate" />
    						<input class="form-control form-control-lg" type="text" name="w_rdate" value="${formattedDate}" readonly /></td>
					</tr>
					<tr>
						<th>반려동물</th>
						<td><input class="form-control form-control-lg"
							type="text" name="p_name" value="${map.P_NAME}" readonly></td>
					</tr>
					<tr>
						<th>체중(kg)</th>
						<td><input class="form-control form-control-lg"
							type="number" name="w_weight" step="0.01" value="${map.W_WEIGHT}" readonly></td>
					</tr>
				</table><br>
				<div>
					<input class="btn btn-primary" type="button" value="목록보기"
						onclick="location.href='diary_list.do'"> <a
						href="diary_modify_form.do?table_name=weight&idx=${map.W_IDX}"> <input
						class="btn btn-info" type="button" value="수정하기">
					</a> <input class="btn btn-danger" type="button" value="삭제하기"
						onclick="del('${table_name}', ${map.W_IDX});">
				</div>
				</c:when>
				
				<c:when test="${table_name == 'stoll'}">
			    <table class="table">
			        <tr>
			            <th>날짜</th>
			            <td>
			                <fmt:formatDate value="${map.S_RDATE}" pattern="yyyy-MM-dd" var="formattedDate" />
			                <input class="form-control form-control-lg" type="text" name="s_rdate" value="${formattedDate}" readonly />
			            </td>
			        </tr>
			        <tr>
						<th>반려동물</th>
						<td><input class="form-control form-control-lg"
							type="text" name="p_name" value="${map.P_NAME}" readonly></td>
					</tr>
			        <tr>
			            <th>시작 시간</th>
			            <td>
			                <fmt:formatDate value="${map.S_STIME}" pattern="HH:mm" var="formattedTime" />
							<input class="form-control form-control-lg" type="time" name="s_time" value="${formattedTime}" readonly />
			            </td>
			        </tr>
			        <tr>
			            <th>종료 시간</th>
			            <td>
			                <fmt:formatDate value="${map.S_ETIME}" pattern="HH:mm" var="formattedTime" />
							<input class="form-control form-control-lg" type="time" name="e_time" value="${formattedTime}" readonly/>
			            </td>
			        </tr>
			        <tr>
			            <th>거리 (m)</th>
			            <td>
			                <input class="form-control form-control-lg" type="number" name="s_distance" value="${map.S_DISTANCE}" readonly/>
			            </td>
			        </tr>
			        <tr>
			            <th>메모</th>
			            <td>
			                <textarea class="form-control form-control-lg" name="s_memo" rows="3" readonly>${map.S_MEMO}</textarea>
			            </td>
			        </tr>
			    </table>
			    <div>
			        <input class="btn btn-primary" type="button" value="목록보기" onclick="location.href='diary_list.do'" />
			        <a href="diary_modify_form.do?table_name=stoll&idx=${map.S_IDX}">
			            <input class="btn btn-info" type="button" value="수정하기" />
			        </a>
			        <input class="btn btn-danger" type="button" value="삭제하기" onclick="del('stoll', ${map.S_IDX});" />
			    </div>
			</c:when>
			
			<c:when test="${table_name == 'feeding'}">
			    <table class="table">
			        <tr>
			            <th>날짜</th>
			            <td>
			                <fmt:formatDate value="${map.F_RDATE}" pattern="yyyy-MM-dd" var="formattedDate" />
			                <input class="form-control form-control-lg" type="text" name="f_rdate" value="${formattedDate}" readonly/>
			            </td>
			        </tr>
			        <tr>
						<th>반려동물</th>
						<td><input class="form-control form-control-lg"
							type="text" name="p_name" value="${map.P_NAME}" readonly></td>
					</tr>
			        <tr>
			            <th>시간</th>
			            <td>
			                <fmt:formatDate value="${map.F_TIME}" pattern="HH:mm" var="formattedTime" />
							<input class="form-control form-control-lg" type="time" name="f_time" value="${formattedTime}" readonly/>
			            </td>
			        </tr>
			        <tr>
			            <th>종류</th>
			            <td>
			                <input class="form-control form-control-lg" type="text" name="f_type" value="${map.F_TYPE}" readonly/>
			            </td>
			        </tr>
			        <tr>
			            <th>사료명</th>
			            <td>
			                <input class="form-control form-control-lg" type="text" name="f_pname" value="${map.F_PNAME}" readonly/>
			            </td>
			        </tr>
			    </table>
			    <div>
			        <input class="btn btn-primary" type="button" value="목록보기" onclick="location.href='diary_list.do'" />
			        <a href="diary_modify_form.do?table_name=feeding&idx=${map.F_IDX}">
			            <input class="btn btn-info" type="button" value="수정하기" />
			        </a>
			        <input class="btn btn-danger" type="button" value="삭제하기" onclick="del('feeding', ${map.F_IDX});" />
			    </div>
			</c:when>
						
			
			<c:when test="${table_name == 'health'}">
			    <table class="table">
			        <tr>
			            <th>날짜</th>
			            <td>
			                <fmt:formatDate value="${map.H_RDATE}" pattern="yyyy-MM-dd" var="formattedDate" />
			                <input class="form-control form-control-lg" type="text" name="h_rdate" value="${formattedDate}" readonly/>
			            </td>
			        </tr>
			        <tr>
						<th>반려동물</th>
						<td><input class="form-control form-control-lg"
							type="text" name="p_name" value="${map.P_NAME}" readonly></td>
					</tr>
			        <tr>
			            <th>시간</th>
			            <td>
			                <fmt:formatDate value="${map.H_TIME}" pattern="HH:mm" var="formattedTime" />
							<input class="form-control form-control-lg" type="time" name="h_time" value="${formattedTime}" readonly/>
			            </td>
			        </tr>
			        <tr>
			            <th>비용</th>
			            <td>
			                <input class="form-control form-control-lg" type="number" name="h_cost" step="0.01" value="${map.H_COST}" readonly/>
			            </td>
			        </tr>
			        <tr>
			            <th>종류</th>
			            <td>
			                <input class="form-control form-control-lg" type="text" name="h_type" value="${map.H_TYPE}" readonly/>
			            </td>
			        </tr>
			        <tr>
			            <th>내용</th>
			            <td>
			                <textarea class="form-control form-control-lg" name="h_content" rows="3" readonly>${map.H_CONTENT}</textarea>
			            </td>
			        </tr>
			        <tr>
			            <th>진단명</th>
			            <td>
			                <input class="form-control form-control-lg" type="text" name="h_hname" value="${map.H_HNAME}" readonly/>
			            </td>
			        </tr>
			        <tr>
			            <th>다음 진료일</th>
			            <td>
			                <fmt:formatDate value="${map.H_NDATE}" pattern="yyyy-MM-dd" var="formattedDate" />
			                <input class="form-control form-control-lg" type="text" name="h_ndate" value="${formattedDate}" readonly/>
			            </td>
			        </tr>
			    </table>
			    <div>
			        <input class="btn btn-primary" type="button" value="목록보기" onclick="location.href='diary_list.do'" />
			        <a href="diary_modify_form.do?table_name=health&idx=${map.H_IDX}">
			            <input class="btn btn-info" type="button" value="수정하기" />
			        </a>
			        <input class="btn btn-danger" type="button" value="삭제하기" onclick="del('health', ${map.H_IDX});" />
			    </div>
			</c:when>
			
			
			<c:when test="${table_name == 'note'}">
			    <table class="table">
			        <tr>
			            <th>날짜</th>
			            <td>
			                <fmt:formatDate value="${map.O_RDATE}" pattern="yyyy-MM-dd" var="formattedDate" />
			                <input class="form-control form-control-lg" type="text" name="o_rdate" value="${formattedDate}" readonly/>
			            </td>
			        </tr>
			        <tr>
						<th>반려동물</th>
						<td><input class="form-control form-control-lg"
							type="text" name="p_name" value="${map.P_NAME}" readonly></td>
					</tr>
			        <tr>
			            <th>시간</th>
			            <td>
			                <fmt:formatDate value="${map.O_TIME}" pattern="HH:mm" var="formattedTime" />
							<input class="form-control form-control-lg" type="time" name="o_time" value="${formattedTime}" readonly/>
			            </td>
			        </tr>
			        <tr>
			            <th>내용</th>
			            <td>
			                <textarea class="form-control form-control-lg" name="o_content" rows="3" readonly>${map.O_CONTENT}</textarea>
			            </td>
			        </tr>
			    </table>
			    <div>
			        <input class="btn btn-primary" type="button" value="목록보기" onclick="location.href='diary_list.do'" />
			        <a href="diary_modify_form.do?table_name=note&idx=${map.O_IDX}">
			            <input class="btn btn-info" type="button" value="수정하기" />
			        </a>
			        <input class="btn btn-danger" type="button" value="삭제하기" onclick="del('note', ${map.O_IDX});" />
			    </div>
			</c:when>
			
			
			
			</c:choose>


	</div>
		</div>

  </div>
</body>
</html>