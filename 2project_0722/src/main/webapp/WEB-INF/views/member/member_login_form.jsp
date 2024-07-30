<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!--  Bootstrap  3.x  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>



<script type="text/javascript">
   
   function send(f){
	   
	   let m_email   = f.m_email.value.trim();
	   let m_pwd  = f.m_pwd.value.trim();
	   
	   if(m_email==''){
		   alert("이메일을 입력하시오");
		   f.m_email.value="";
		   f.m_email.focus();
		   return;
	   }
	   
	   if(m_pwd==''){
		   alert("비밀번호를 입력하시오");
		   f.m_pwd.value="";
		   f.m_pwd.focus();
		   return;
	   }
	   	   
	   
	   f.action="login.do";   
	   f.submit();
	   
   }//end:send()

</script>


<script type="text/javascript">
  //javascript 초기화
  //window.onload = function(){};
  
  //jQuery 초기화
  $(document).ready(function(){
	  
	  //showMessage();
	  setTimeout(showMessage,100);//0.1초후에 메시지 띄워라
	  
  });
  
  function showMessage(){
	  // /member/login_form.do?reason=fail_id => "true"
	  if("${ param.reason == 'fail_email'}" == "true"){
		  alert("이메일을 다시 입력해주십시오");
	  }		 
	  
	  // /member/login_form.do?reason=fail_pwd => "true"
	  if("${ param.reason == 'fail_pwd'}" == "true"){
		  alert("비밀번호를 다시 입력해주십시오");
	  }	
	  
	  // /member/login_form.do?reason=session_timeout
	  if("${ param.reason == 'session_timeout'}" == "true"){
		  alert("로그아웃되었습니다\n로그인후 게시글을 등록하세요!!");
	  }	
	  
  }

</script>




</head>
<body>
<form class="form-inline">  
<input type="hidden" name="url" value="${param.url}">
   <div id="box">
		<div>
			<div><h3 style="text-align:center;">로그인</h3></div>
			<div>
			    <table class="table"  style="position:absolute;">
			        <tr>
			            <th>이메일</th>
			            <td><input class="form-control"  name="m_email"  value="${ param.m_email }"></td>
			        </tr>
			        
			        <tr>
			            <th>비밀번호</th>
			            <td><input class="form-control" type="password" name="m_pwd" value="${param.m_pwd }"></td>
			        </tr>
			        
			        <tr>
			            <td colspan="2" align="center">
			               <input class="btn btn-success"  type="button"  value="회원가입"
			                      onclick="location.href='insert_form.do'" >
			               <input class="btn btn-primary"  type="button"  value="로그인"
			                      onclick="send(this.form);">
			            </td>
			        </tr>
			    </table>
			</div>
		</div>
	</div>
</form>	
</body>
</html>