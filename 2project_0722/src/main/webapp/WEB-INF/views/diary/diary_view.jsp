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

<!--  Bootstrap  3.x  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">
   #box{
      width: 800px;
      margin: auto;
      margin-top: 20px;
   }
   
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
   
</style>

<script type="text/javascript">
/* 	function del(){
		if(confirm("정말 삭제하시겠습니까?") == false) return;
		location.href = "delete.do?b_idx=${ vo.w_idx }";
		
	} */

</script>


</head>
<body>
  <div id="box">
        <!-- Bootstrap Panel -->
		<div class="panel panel-primary">

			<c:choose>
				<c:when test="${table_name == 'weight'}">
				<table class="table">
					<tr>
						<th>날짜</th>
						<td>
							<fmt:formatDate value="${map.W_RDATE}" pattern="yyyy-MM-dd" var="formattedDate" />
    						<input class="form-control form-control-lg" type="text" name="w_rdate" value="${formattedDate}" /></td>
					</tr>
					<tr>
						<th>회원</th>
						<td><input class="form-control form-control-lg"
							type="number" name="m_idx" value="${map.M_IDX}"></td>
					</tr>
					<tr>
						<th>반려동물</th>
						<td><input class="form-control form-control-lg"
							type="number" name="p_idx" value="${map.P_IDX}"></td>
					</tr>
					<tr>
						<th>체중(kg)</th>
						<td><input class="form-control form-control-lg"
							type="number" name="w_weight" step="0.01" value="${map.W_WEIGHT}"></td>
					</tr>
				</table>
				<div>
					<input class="btn btn-primary" type="button" value="목록보기"
						onclick="location.href='diary_list.do'"> <a
						href="diary_modify_form.do?table_name=weight&idx=${map.W_IDX}"> <input
						class="btn btn-info" type="button" value="수정하기">
					</a> <input class="btn btn-danger" type="button" value="삭제하기"
						onclick="del();">
				</div>
				</c:when>
				
				<c:when test="${table_name == 'stoll'}">
			    <table class="table">
			        <tr>
			            <th>날짜</th>
			            <td>
			                <fmt:formatDate value="${map.S_RDATE}" pattern="yyyy-MM-dd" var="formattedDate" />
			                <input class="form-control form-control-lg" type="text" name="s_rdate" value="${formattedDate}" />
			            </td>
			        </tr>
			        <tr>
			            <th>시작 시간</th>
			            <td>
			                <fmt:formatDate value="${map.S_STIME}" pattern="HH:mm" var="formattedTime" />
							<input class="form-control form-control-lg" type="time" name="s_time" value="${formattedTime}" />
			            </td>
			        </tr>
			        <tr>
			            <th>종료 시간</th>
			            <td>
			                <fmt:formatDate value="${map.S_ETIME}" pattern="HH:mm" var="formattedTime" />
							<input class="form-control form-control-lg" type="time" name="e_time" value="${formattedTime}" />
			            </td>
			        </tr>
			        <tr>
			            <th>거리 (m)</th>
			            <td>
			                <input class="form-control form-control-lg" type="number" name="s_distance" value="${map.S_DISTANCE}" />
			            </td>
			        </tr>
			        <tr>
			            <th>메모</th>
			            <td>
			                <textarea class="form-control form-control-lg" name="s_memo" rows="3">${map.S_MEMO}</textarea>
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
			                <input class="form-control form-control-lg" type="text" name="f_rdate" value="${formattedDate}" />
			            </td>
			        </tr>
			        <tr>
			            <th>시간</th>
			            <td>
			                <fmt:formatDate value="${map.F_TIME}" pattern="HH:mm" var="formattedTime" />
							<input class="form-control form-control-lg" type="time" name="f_time" value="${formattedTime}" />
			            </td>
			        </tr>
			        <tr>
			            <th>종류</th>
			            <td>
			                <input class="form-control form-control-lg" type="text" name="f_type" value="${map.F_TYPE}" />
			            </td>
			        </tr>
			        <tr>
			            <th>사료명</th>
			            <td>
			                <input class="form-control form-control-lg" type="text" name="f_pname" value="${map.F_PNAME}" />
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
			                <input class="form-control form-control-lg" type="text" name="h_rdate" value="${formattedDate}" />
			            </td>
			        </tr>
			        <tr>
			            <th>시간</th>
			            <td>
			                <fmt:formatDate value="${map.H_TIME}" pattern="HH:mm" var="formattedTime" />
							<input class="form-control form-control-lg" type="time" name="h_time" value="${formattedTime}" />
			            </td>
			        </tr>
			        <tr>
			            <th>비용</th>
			            <td>
			                <input class="form-control form-control-lg" type="number" name="h_cost" step="0.01" value="${map.H_COST}" />
			            </td>
			        </tr>
			        <tr>
			            <th>종류</th>
			            <td>
			                <input class="form-control form-control-lg" type="text" name="h_type" value="${map.H_TYPE}" />
			            </td>
			        </tr>
			        <tr>
			            <th>내용</th>
			            <td>
			                <textarea class="form-control form-control-lg" name="h_content" rows="3">${map.H_CONTENT}</textarea>
			            </td>
			        </tr>
			        <tr>
			            <th>진단명</th>
			            <td>
			                <input class="form-control form-control-lg" type="text" name="h_hname" value="${map.H_HNAME}" />
			            </td>
			        </tr>
			        <tr>
			            <th>다음 진료일</th>
			            <td>
			                <fmt:formatDate value="${map.H_NDATE}" pattern="yyyy-MM-dd" var="formattedDate" />
			                <input class="form-control form-control-lg" type="text" name="h_ndate" value="${formattedDate}" />
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
			                <input class="form-control form-control-lg" type="text" name="o_rdate" value="${formattedDate}" />
			            </td>
			        </tr>
			        <tr>
			            <th>시간</th>
			            <td>
			                <fmt:formatDate value="${map.O_TIME}" pattern="HH:mm" var="formattedTime" />
							<input class="form-control form-control-lg" type="time" name="o_time" value="${formattedTime}" />
			            </td>
			        </tr>
			        <tr>
			            <th>내용</th>
			            <td>
			                <textarea class="form-control form-control-lg" name="o_content" rows="3">${map.O_CONTENT}</textarea>
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

  </div>
</body>
</html>