<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>    
    
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
		     <div class="panel-heading"><h4><b>${ vo.m_idx }</b>님의 글</h4></div>
		     <div class="panel-body">
		        <div class="common subject">${ vo.w_weight }</div>
		       
		        
		        <div>
		        
		           <input class="btn btn-primary" type="button"  value="목록보기"
		                  onclick="location.href='diary_list.do'" >
		           
			       <a href="diary_modify_form_weight.do?w_idx=${vo.w_idx}">
			       <input class="btn btn-info"    type="button"  value="수정하기"></a>
			           		  
		           <input class="btn btn-danger"  type="button"  value="삭제하기"
			           		  onclick="del();">

		           
		        </div>
		     </div>
		</div>

  </div>
</body>
</html>