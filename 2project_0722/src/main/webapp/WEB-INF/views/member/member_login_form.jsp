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

<style type="text/css">
  #box{
     width: 500px;
     margin: auto;
     margin-top: 200px;
  }
  
  input[type='button']{
     width: 100px;
     /* background: pink; */
  }
</style>


<script type="text/javascript">
   
   function send(f){
	   
	   let m_id   = f.m_id.value.trim();
	   let m_pwd  = f.m_pwd.value.trim();
	   
	   if(m_id==''){
		   alert("아이디를 입력하세요!!");
		   f.m_id.value="";
		   f.m_id.focus();
		   return;
	   }
	   
	   if(m_pwd==''){
		   alert("비밀번호를 입력하세요!!");
		   f.m_pwd.value="";
		   f.m_pwd.focus();
		   return;
	   }
	   	   
	   
	   f.action="login.do";   // MemberLoginAction
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
	  if("${ param.reason == 'fail_id'}" == "true"){
		  alert("아이디가 틀립니다!!");
	  }		
	  
	  // /member/login_form.do?reason=fail_pwd => "true"
	  if("${ param.reason == 'fail_pwd'}" == "true"){
		  alert("비밀번호가 틀립니다!!");
	  }	
	  
	  // /member/login_form.do?reason=session_timeout
	  if("${ param.reason == 'session_timeout'}" == "true"){
		  alert("로그아웃되었습니다\n로그인 후 이용하세요!!");
	  }	
	  
  }

</script>




</head>
<body>
<form>  
   <div id="box">
		<div class="panel panel-primary">
			<div class="panel-heading"><h3>로그인</h3></div>
			<div class="panel-body">
			    <table class="table">
			    <input type="hidden" name="url" value="${param.url }">


		        <tr>
			            <th>아이디</th>
			            <td><input class="form-control"  name="m_id"  value="${ param.m_id }"></td>
			        </tr>
			        
			        <tr>
			            <th>비밀번호</th>
			            <td><input class="form-control" type="password" name="m_pwd"></td>
			        </tr>
			        
			        <tr>
			            <td colspan="2" align="center">
			               <input class="btn btn-success"  type="button"  value="메인화면"
			                      onclick="location.href='../board/list.do'" >
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