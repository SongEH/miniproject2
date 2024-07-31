<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
    
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!--  Bootstrap  3.x  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<<<<<<< HEAD

=======
<style type="text/css">
  #box{
     width: 800px;
     margin: auto;
     margin-top: 100px;
  
  }
  
  th{
     vertical-align: middle !important;
     text-align: right; 
     font-size: 18px;
  }
  
  #id_msg{
     display: inline-block;
     width: 300px;
     height: 20px;
     margin-left: 10px;
    /*  border : 1px solid red; */
  }

</style>
>>>>>>> main

<!-- 주소검색 API  -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">

  
   
   function find_addr(){
	   
	   var themeObj = {
			   bgColor: "#B51D1D" //바탕 배경색
	   };
	   
	   new daum.Postcode({
		    theme: themeObj,
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
<<<<<<< HEAD
	            $("#m_zipcode").val(data.zonecode); //우편번호 넣기
	            $("#m_addr").val(data.address);     //주소넣기
=======
	            $("#mem_zipcode").val(data.zonecode); //우편번호 넣기
	            $("#mem_addr").val(data.address);     //주소넣기
>>>>>>> main
	            
	        }
	    }).open();

   }//end:find_addr()
   
   
   function send(f){
	   
<<<<<<< HEAD

	   let m_nickname = f.m_nickname.value.trim();
	   let m_pwd  	= f.m_pwd.value.trim();
	   let m_zipcode 	= f.m_zipcode.value.trim();
	   let m_addr 	= f.m_addr.value.trim();
	   
	   if(m_nickname==''){
		   alert("닉네임을 입력하시오");
		   f.m_nickname.value="";
		   f.m_nickname.focus();
		   return;
	   }
	   
	   if(m_pwd==''){
		   alert("비밀번호를 입력하시오");
		   f.m_pwd.value="";
		   f.m_pwd.focus();
		   return;
	   }
	   
	   if(m_zipcode==''){
		   alert("우편번호를 입력하시오");
		   f.m_zipcode.value="";
		   f.m_zipcode.focus();
		   return;
	   }
	   
	   if(m_addr==''){
		   alert("주소를 입력하시오");
		   f.m_addr.value="";
		   f.m_addr.focus();
=======
	   let mem_name 	= f.mem_name.value.trim();
	   let mem_pwd  	= f.mem_pwd.value.trim();
	   let mem_zipcode 	= f.mem_zipcode.value.trim();
	   let mem_addr 	= f.mem_addr.value.trim();
	   
	   if(mem_name==''){
		   alert("이름을 입력하세요");
		   f.mem_name.value="";
		   f.mem_name.focus();
		   return;
	   }
	   
	   if(mem_pwd==''){
		   alert("비밀번호를 입력하세요");
		   f.mem_pwd.value="";
		   f.mem_pwd.focus();
		   return;
	   }
	   
	   if(mem_zipcode==''){
		   alert("우편번호를 입력하세요");
		   f.mem_zipcode.value="";
		   f.mem_zipcode.focus();
		   return;
	   }
	   
	   if(mem_addr==''){
		   alert("주소를 입력하세요");
		   f.mem_addr.value="";
		   f.mem_addr.focus();
>>>>>>> main
		   return;
	   }
	   
	   
	   f.action = "modify.do";  //MemberModifyAction
	   f.submit(); //전송
	   
	   
	   
	   
   }//end:send()
</script>


<script type="text/javascript">
  
  $(document).ready(function(){
	  // element + attribute selector
<<<<<<< HEAD
	  $("select[name='m_grade']").val("${ vo.m_grade }");
=======
	  $("select[name='mem_grade']").val("${ vo.mem_grade }");
>>>>>>> main
	  
  });

</script>


</head>
<body>

<form class="form-inline">
<<<<<<< HEAD
   <input type="hidden"  name="m_idx"  value="${ vo.m_idx }">
=======
   <input type="hidden"  name="mem_idx"  value="${ vo.mem_idx }">
>>>>>>> main
   <div id="box">
		<div class="panel panel-primary">
			<div class="panel-heading"><h4>::::회원수정::::</h4></div>
			<div class="panel-body">
			   <table class="table">
			      <tr>
			         <th>이름</th>
<<<<<<< HEAD
			         <td><input style="width:50%;" class="form-control" name="m_name"  value="${ vo.m_name }" readonly="readonly"></td>
			      </tr>
			      
			      <tr>
			         <th>닉네임</th>
			         <td>
			             <input style="width:50%;"  class="form-control" name="m_nickname"  
			                    value="${ vo.m_nickname }">
			         </td>
			      </tr>
			      
			      <tr>
			         <th>이메일</th>
			         <td>
			             <input style="width:50%;"  class="form-control" name="m_email"  
			                    value="${ vo.m_email }" readonly="readonly">
=======
			         <td><input style="width:50%;" class="form-control" name="mem_name"  value="${ vo.mem_name }"></td>
			      </tr>
			      
			      <tr>
			         <th>아이디</th>
			         <td>
			             <input style="width:50%;"  class="form-control" name="mem_id"  
			                    value="${ vo.mem_id }"  readonly="readonly">
>>>>>>> main
			         </td>
			      </tr>
			      
			      <tr>
			         <th>비밀번호</th>
<<<<<<< HEAD
			         <td><input style="width:50%;" class="form-control"  type="password" name="m_pwd" value="${ vo.m_pwd }"></td>
=======
			         <td><input style="width:50%;" class="form-control"  type="password" name="mem_pwd" value="${ vo.mem_pwd }"></td>
>>>>>>> main
			      </tr>
			      
			      <tr>
			         <th>우편번호</th>
			         <td>
<<<<<<< HEAD
			            <input style="width:50%;" class="form-control" name="m_zipcode" id="m_zipcode"
			                   value="${ vo.m_zipcode }">
=======
			            <input style="width:50%;" class="form-control" name="mem_zipcode" id="mem_zipcode"
			                   value="${ vo.mem_zipcode }">
>>>>>>> main
			            <input class="btn  btn-info"  type="button"  value="주소검색"  onclick="find_addr();">
			         </td>
			      </tr>
			      
			      <tr>
			         <th>주소</th>
<<<<<<< HEAD
			         <td><input style="width:100%;"  class="form-control" name="m_addr" id="_addr" value="${ vo.m_addr }"></td>
=======
			         <td><input style="width:100%;"  class="form-control" name="mem_addr" id="mem_addr" value="${ vo.mem_addr }"></td>
>>>>>>> main
			      </tr>
			      
			      
			      <tr>
			         <th>회원등급</th>
			         <td>
			             <!-- 로그인유저가 관리자면 회원등급 수정 가능 -->
<<<<<<< HEAD
			             <c:if test="${ user.m_grade eq '관리자' }">
				             <select style="width:50%;" name="m_grade" class="form-control">
=======
			             <c:if test="${ user.mem_grade eq '관리자' }">
				             <select style="width:50%;" name="mem_grade" class="form-control">
>>>>>>> main
				                <option value="일반">일반</option>
				                <option value="관리자">관리자</option>
				             </select>     
			             </c:if> 
			             
			             <!-- 로그인유저가 일반이면 회원등급 수정 불가 -->
<<<<<<< HEAD
			             <c:if test="${ user.m_grade eq '일반' }">
			                  <input style="width:50%;"  class="form-control" name="m_grade"  
			                    value="${ vo.m_grade }"  readonly="readonly">
=======
			             <c:if test="${ user.mem_grade eq '일반' }">
			                  <input style="width:50%;"  class="form-control" name="mem_grade"  
			                    value="${ vo.mem_grade }"  readonly="readonly">
>>>>>>> main
			             </c:if> 
			                    
			         </td>
			      </tr>
			      
			      
			      <tr>
			         <td colspan="2" align="center">
<<<<<<< HEAD
			              <input class="btn btn-success" type="button"  value="돌아가기"
			                     onclick="location.href=''" >	<!-- 마이페이지로 이동할 경로 설정 -->
=======
			              <input class="btn btn-success" type="button"  value="목록보기"
			                     onclick="location.href='list.do'" >
>>>>>>> main
			              <input class="btn btn-primary" type="button"  value="수정하기" 
			                     onclick="send(this.form);" >
			         </td>
			      </tr>
			      
			   </table>   
			</div>
		</div>
	</div>
</form>   
   
</body>
</html>