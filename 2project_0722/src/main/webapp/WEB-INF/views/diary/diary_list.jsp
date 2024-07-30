<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- fullCalendar API 관련 JS파일 -->
<script src='../resources/index.global.js'></script>

<link rel="stylesheet" href="../resources/css/common.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>


<script type="text/javascript">

	function del(table_name, idx){
		if(confirm("정말 삭제하시겠습니까?") == false) return;
		location.href = "diary_delete.do?table_name=" + table_name + "&idx=" + idx;
	}

	function formatTime(timeString) {
	    if (!timeString) return '';
	    // ' '로 문자열을 나누고 두 번째 부분(시간)을 가져온 후, ':'로 나누어 시간과 분만 추출
	    return timeString.split(' ')[1].substr(0, 5);
	}

	
	function generate_html(response) {
		   
	    let formHtml = '';

	    // 체중
	    if (response.weight_list.length > 0) {
	        formHtml += '체중<br>';
	        response.weight_list.forEach(function(WeightVo) {
	            formHtml += '<div><form action="diary_modify_form.do" method="post"><table class="table"><tbody>';
	            formHtml += '<tr><th>반려동물</th>';
	            formHtml += '<td><input class="form-control form-control-lg" type="text" name="w_rdate" value="' + (WeightVo.p_idx || '') + '"></td></tr>';
	            formHtml += '<tr><th>체중(kg)</th>';
	            formHtml += '<td><input class="form-control form-control-lg" type="text" name="p_idx" value="' + (WeightVo.w_weight || '') + '"></td></tr>';
	            formHtml += '</tbody></table></form></div>';
	            formHtml += '<a href="diary_view.do?table_name=weight&idx=' + (WeightVo.w_idx || '') + '"><input class="diary-btn-yellow" type="button" value="상세보기" style="margin-right:50px;"></a>';
	            formHtml += '<input class="diary-btn-yellow" type="button" value="삭제" onclick="del(\'weight\',' + (WeightVo.w_idx || '') + ');"><br>';
	        });
	    }

	    // 산책
	    if (response.stoll_list.length > 0) {
	        formHtml += '산책<br>';
	        response.stoll_list.forEach(function(StollVo) {
	        	
	        	 let formattedStartTime = formatTime(StollVo.s_stime);
	             let formattedEndTime = formatTime(StollVo.s_etime);
	             
	             formHtml += '<div><form action="diary_modify_form.do" method="post"><table class="table"><tbody>';
	             formHtml += '<tr><th>반려동물</th>';
	             formHtml += '<td><input class="form-control form-control-lg" type="text" name="p_idx" value="' + (StollVo.p_idx || '') + '"></td></tr>';
	             formHtml += '<tr><th>시작시간</th>';
	             formHtml += '<td><input class="form-control form-control-lg" type="time" name="s_stime" value="' + formattedStartTime + '" readonly /></td></tr>';
	             formHtml += '<tr><th>종료시간</th>';
	             formHtml += '<td><input class="form-control form-control-lg" type="time" name="s_etime" value="' + formattedEndTime + '" readonly /></td></tr>';
	             formHtml += '<tr><th>거리(m)</th>';
	             formHtml += '<td><input class="form-control form-control-lg" type="text" name="s_distance" value="' + (StollVo.s_distance || '') + '"></td></tr>';
	             formHtml += '</tbody></table></form></div>';
	             formHtml += '<a href="diary_view.do?table_name=stoll&idx=' + (StollVo.s_idx || '') + '"><input class="diary-btn-yellow" type="button" value="상세보기" style="margin-right:50px;"></a>';
	             formHtml += '<input class="diary-btn-yellow" type="button" value="삭제" onclick="del(\'stoll\',' + (StollVo.s_idx || '') + ');"><br>';
	        
	        	
	            /* formHtml += '<div><form action="diary_modify_form.do" method="post"><table class="table"><tbody>';
	            formHtml += '<tr><th>반려동물</th>';
	            formHtml += '<td><input class="form-control form-control-lg" type="text" name="p_idx" value="' + (StollVo.p_idx || '') + '"></td></tr>';
	            formHtml += '<tr><th>시작시간</th>';
	            formHtml += '<td><input class="form-control form-control-lg" type="time" name="s_stime" value="' + (StollVo.s_stime || '') + '"></td></tr>';
	          
	            formHtml += '<tr><th>종료시간</th>';
	            formHtml += '<td><input class="form-control form-control-lg" type="time" name="s_etime" value="' + (StollVo.s_etime || '') + '"></td></tr>';
	            formHtml += '<tr><th>거리(m)</th>';
	            formHtml += '<td><input class="form-control form-control-lg" type="text" name="s_distance" value="' + (StollVo.s_distance || '') + '"></td></tr>';
	            formHtml += '</tbody></table></form></div>';
	            formHtml += '<a href="diary_view.do?table_name=stoll&idx=' + (StollVo.s_idx || '') + '"><input class="diary-btn-yellow" type="button" value="상세보기" style="margin-right:50px;"></a>';
	            formHtml += '<input class="diary-btn-yellow" type="button" value="삭제" onclick="del(\'stoll\',' + (StollVo.s_idx || '') + ');"><br>';
	         */});
	    }

	    // 사료/간식/영양제
	    if (response.feeding_list.length > 0) {
	        formHtml += '사료/간식/영양제<br>';
	        response.feeding_list.forEach(function(FeedingVo) {
	        	
	        	let formattedTime = formatTime(FeedingVo.f_time);
	             
	             
	            formHtml += '<div><form action="diary_modify_form.do" method="post"><table class="table"><tbody>';
	            formHtml += '<tr><th>반려동물</th>';
	            formHtml += '<td><input class="form-control form-control-lg" type="text" name="p_idx" value="' + (FeedingVo.p_idx || '') + '"></td></tr>';
	            formHtml += '<tr><th>시간</th>';
	            formHtml += '<td><input class="form-control form-control-lg" type="time" name="f_time" value="' + formattedTime + '"></td></tr>';
	            formHtml += '<tr><th>종류</th>';
	            formHtml += '<td><input class="form-control form-control-lg" type="text" name="f_type" value="' + (FeedingVo.f_type || '') + '"></td></tr>';
	            formHtml += '<tr><th>사료명</th>';
	            formHtml += '<td><input class="form-control form-control-lg" type="text" name="f_pname" value="' + (FeedingVo.f_pname || '') + '"></td></tr>';
	            formHtml += '</tbody></table></form></div>';
	            formHtml += '<a href="diary_view.do?table_name=feeding&idx=' + (FeedingVo.f_idx || '') + '"><input class="diary-btn-yellow" type="button" value="상세보기" style="margin-right:50px;"></a>';
	            formHtml += '<input class="diary-btn-yellow" type="button" value="삭제" onclick="del(\'feeding\',' + (FeedingVo.f_idx || '') + ');"><br>';
	        });
	    }

	    // 건강
	    if (response.health_list.length > 0) {
	        formHtml += '건강<br>';
	        response.health_list.forEach(function(HealthVo) {
	        	let formattedTime = formatTime(HealthVo.h_time);
	        	
	            formHtml += '<div><form action="diary_modify_form.do" method="post"><table class="table"><tbody>';
	            formHtml += '<tr><th>반려동물</th>';
	            formHtml += '<td><input class="form-control form-control-lg" type="text" name="h_p_idx" value="' + (HealthVo.p_idx || '') + '"></td></tr>';
	            formHtml += '<tr><th>시간</th>';
	            formHtml += '<td><input class="form-control form-control-lg" type="time" name="h_time" value="' + formattedTime + '"></td></tr>';
	            formHtml += '<tr><th>종류</th>';
	            formHtml += '<td><input class="form-control form-control-lg" type="text" name="h_type" value="' + (HealthVo.h_type || '') + '"></td></tr>';
	            formHtml += '<tr><th>진단명</th>';
	            formHtml += '<td><input class="form-control form-control-lg" type="text" name="h_hname" value="' + (HealthVo.h_hname || '') + '"></td></tr>';
	            formHtml += '</tbody></table></form></div>';
	            formHtml += '<a href="diary_view.do?table_name=health&idx=' + (HealthVo.h_idx || '') + '"><input class="diary-btn-yellow" type="button" value="상세보기" style="margin-right:50px;"></a>';
	            formHtml += '<input class="diary-btn-yellow" type="button" value="삭제" onclick="del(\'health\',' + (HealthVo.h_idx || '') + ');"><br>';
	        });
	    }

	    // 메모
	    if (response.note_list.length > 0) {
	        formHtml += '메모<br>';
	        response.note_list.forEach(function(NoteVo) {
	        	let formattedTime = formatTime(NoteVo.o_time);
	        	
	            formHtml += '<table class="table">';
	            formHtml += '<tbody>';
	            formHtml += '<tr><th>반려동물</th>';
	            formHtml += '<td><input class="form-control form-control-lg" type="text" name="p_idx" value="' + (NoteVo.p_idx || '') + '"></td></tr>';
	            formHtml += '<tr><th>시간</th>';
	            formHtml += '<td><input class="form-control form-control-lg" type="time" name="o_time" value="' + formattedTime + '"></td></tr>';
	            formHtml += '<tr><th>메모</th>';
	            formHtml += '<td><textarea class="form-control form-control-lg" name="o_content" rows="3" placeholder="내용을 입력해주세요." oninput="this.style.height=\'\' , this.style.height= this.scrollHeight + \'px\'">' + (NoteVo.o_content || '') + '</textarea></td></tr>';
	            formHtml += '</tbody></table>';
	            formHtml += '<a href="diary_view.do?table_name=note&idx=' + (NoteVo.o_idx || '') + '"><input class="diary-btn-yellow" type="button" value="상세보기" style="margin-right:50px;"></a>';
	            formHtml += '<input class="diary-btn-yellow" type="button" value="삭제" onclick="del(\'note\',' + (NoteVo.o_idx || '') + ');"><br>';
	        });
	    }

	    formHtml += '<br><br>';
	    return formHtml;
	}
</script>


<script type="text/javascript">

$(document).ready(function(){
    
    let today = new Date();   

    let year = today.getFullYear(); // 년도
    let month = ('0' + (today.getMonth() + 1)).slice(-2);
    let day = ('0' + today.getDate()).slice(-2);

    let today_full = (year + '-' + month + '-' + day);
    
    $.ajax({
        url: 'diary_select_date.do',
        type: 'GET',
        data: { date: today_full },
        success: function(response) {
            // 체중 데이터를 처리하여 HTML 생성
            let test = generate_html(response);
            
            // HTML을 페이지에 삽입
            $('#diary_select_date').html(test);
        },
        error: function(error) {
            console.error('Error fetching data:', error);
        }
    });
});



// 캘린더 표시 
document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');

  var calendar = new FullCalendar.Calendar(calendarEl, {
    headerToolbar: {
      left: 'prevYear,prev,next,nextYear today',
      center: 'title',
      right: 'dayGridMonth,dayGridWeek,dayGridDay'
    },
    initialDate: '2024-07-26',
    dateClick: function(info) { // 날짜 클릭시 이벤트 
	    // alert('Clicked on: ' + info.dateStr);
    
	      // 클릭한 날짜를 보여주는 div 업데이트
	      document.getElementById('selected-date').innerText =  info.dateStr;
	      
	      // 선택한 날짜 select-date 의 value값을 info.dateStr로 설정  
	      document.getElementById('select_date').value = info.dateStr;
	      
	      // 선택한 날짜에 대한 데이터 조회 
	      
	      $.ajax({
	          url: 'diary_select_date.do',
	          type: 'GET',
	          data: { date: info.dateStr },
	          success: function(response) {
	              // 컨트롤러에서 받아온 데이터를 html로 변환
	              let test = generate_html(response);
	              
	              // HTML을 페이지에 삽입
	              $('#diary_select_date').html(test);
	          },
	          error: function(error) {
	              console.error('Error fetching data:', error);
	          }
	      }); 
	    
    },
    navLinks: true, // can click day/week names to navigate views
    editable: true,
    dayMaxEvents: true, // allow "more" link when too many events
    events: [
      {
        title: 'All Day Event',
        start: '2023-01-01'
      },
      {
        title: 'Long Event',
        start: '2023-01-07',
        end: '2023-01-10'
      },
      {
        groupId: 999,
        title: 'Repeating Event',
        start: '2023-01-09T16:00:00'
      },
      {
        groupId: 999,
        title: 'Repeating Event',
        start: '2023-01-16T16:00:00'
      },
      {
        title: 'Conference',
        start: '2023-01-11',
        end: '2023-01-13'
      },
      {
        title: 'Meeting',
        start: '2023-01-12T10:30:00',
        end: '2023-01-12T12:30:00'
      },
      {
        title: 'Lunch',
        start: '2023-01-12T12:00:00'
      },
      {
        title: 'Meeting',
        start: '2023-01-12T14:30:00'
      },
      {
        title: 'Happy Hour',
        start: '2023-01-12T17:30:00'
      },
      {
        title: 'Dinner',
        start: '2023-01-12T20:00:00'
      },
      {
        title: 'Birthday Party',
        start: '2023-01-13T07:00:00'
      },
      {
        title: 'Click for Google',
        url: 'http://google.com/',
        start: '2023-01-28'
      }
    ]
  });

  calendar.render();
});

/*
let calendar = new Calendar(calendarEl, {
	  plugins: [ interactionPlugin ],
	  dateClick: function(info) {
	    alert('Clicked on: ' + info.dateStr);
	    alert('Coordinates: ' + info.jsEvent.pageX + ',' + info.jsEvent.pageY);
	    alert('Current view: ' + info.view.type);
	    // change the day's background color just for fun
	    info.dayEl.style.backgroundColor = 'red';
	  }
	});*/
	
</script>

<style type="text/css">
body {
	margin: 40px 10px;
	padding: 0;
	font-size: 14px;
}
#calendar {
	max-width: 1100px;
	margin: 0 auto;
	margin-top: 150px;
}

#memo-form-container {
	margin-top: 20px;
	text-align: center;
}


.box {
	width: 800px;
	height: 600px;
	margin: auto;
	display: flex;
	justify-content: center;
	align-items: center;
	overflow: hidden;
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
	width: 200px;
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
	width: 200px;
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
	width: 200px;
}

.diary-btn-gray-outline:hover {
	transform: scale(1.1);
	cursor: pointer;
}

.diary-btn-gray-outline:active {
	transform: scale(0.9);
}


#selected-date { 
	font-size:27px;
}
</style>

<script type="text/javascript">
	function diary_insert_form(){
		// 로그인 여부 체크
/* 		if("${ empty user }" == "true"){
					
			if(confirm("글쓰기는 로그인 후 가능합니다.\n로그인 하시겠습니까?") == false) return;
			
			// 로그인 폼으로 이동 
			location.href = "../member/login_form.do";
			
			return;
		} */
		
		var select_date = document.getElementById('select_date').value;
		
		
		// 선택한 날짜 들고 이동하기 
		
		
		
		
		// 새글쓰기 폼 띄우기 
		location.href="diary_insert_form.do?select_date="+select_date;
	}
</script>
</head>
<body>

	<!-- top 옵션-->
	<%@include file="../top.jsp"%>

	
	<div id='calendar'></div>

	<div id='selected-date' style="text-align: center; margin-top: 20px;"></div>
	


	<div class="container">
		<div class="col-sm-4">
		<form>
			<input type=hidden id="select_date"> 
			<input class="btn btn-info" type="button" value="추가하기"
				onclick="diary_insert_form()">
		</form>
		</div>
		
		<div id='diary_select_date'></div>
		
		
		<!-- 산책 -->
<%-- 	    <c:forEach var="vo" items="${ stoll_list }">
		<form id="memoForm" action="http://localhost:8080/fileupload/diaryAdd.do" method="post">
			<table class="table">
				<tbody><tr>
					<th>날짜</th>
					<td><input class="form-control form-control-lg" type="text" name="s_rdate" value=${ vo.s_rdate }></td>
				</tr>
				<tr>
					<th>반려동물</th>
					<td><input class="form-control form-control-lg" type="text" name="p_idx" value=${ vo.p_idx }></td>
				</tr>
				<tr>
					<th>시작시간</th>
					<td><input class="form-control form-control-lg" type="time" name="s_stime" value=${ vo.s_stime }></td>
				</tr>
				<tr>
					<th>종료시간</th>
					<td><input class="form-control form-control-lg" type="time" name="s_etime" value=${ vo.s_etime }></td>
				</tr>
				<tr>
					<th>거리(m)</th>
					<td><input class="form-control form-control-lg" type="number" name="s_distance" value=${ vo.s_distance }></td>
				</tr>
				<tr>
					<th>메모</th>
					<td>
						<div class="">
							<textarea class="form-control form-control-lg" id="s_memo" name="s_memo" rows="3" placeholder="내용을 입력해주세요." oninput="this.style.height=&quot;&quot;, this.style.height= this.scrollHeight + &quot;px&quot;">Morning walk</textarea>
						</div>
					</td>
				</tr>
				</tbody></table>
				
				<div class="container" style="text-align: center;">
					<input class="diary-btn-yellow" type="button" value="등록" onclick="send(this.form);">
				</div>

		</form>
		</c:forEach> --%>

		<!-- 체중 -->
	    <c:forEach var="vo" items="${ weight_list }">
			<form action="diary_modify_form.do" method="post">
				<table class="table">
					<tbody><tr>
						<th>날짜</th>
						<td><input class="form-control form-control-lg" type="text" name="w_rdate" value=${ vo.w_rdate }></td>
					</tr>
					<tr>
						<th>반려동물</th>
						<td><input class="form-control form-control-lg" type="text" name="p_idx" value=${ vo.p_idx }></td>
					</tr>
					<tr>
						<th>체중(kg)</th>
						<td><input class="form-control form-control-lg" type="number" name="w_weight" value=${ vo.w_weight }></td>
					</tr>
				</tbody></table>

				<div class="container" style="text-align: center;">
					<input class="diary-btn-yellow" type="button" value="수정" onclick="send(this.form);">
				</div>

			</form>
		</c:forEach>
		


		<!-- 사료/간식/영양제 -->
	    <%-- <c:forEach var="vo" items="${ feeding_list }">
			<form id="memoForm" action="http://localhost:8080/fileupload/diaryAdd.do" method="post">
				<table class="table">
					<tbody><tr>
						<th>날짜</th>
						<td><input class="form-control form-control-lg" type="text" name="f_rdate" value="2024-07-25" 00:00:00.0=""></td>
					</tr>
					<tr>
						<th>반려동물</th>
						<td><input class="form-control form-control-lg" type="text" name="p_idx" value="201"></td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td><select class="form-control  form-control-lg" id="f_type" name="f_type" required="">
								<option value="">카테고리 선택</option>
								<option value="사료">사료</option>
								<option value="간식">간식</option>
								<option value="영양제">영양제</option>
						</select></td>
					</tr>
					<tr>
						<th>시간</th>
						<td><input class="form-control form-control-lg" type="time" name="f_time"></td>
					</tr>
					<tr>
						<th>제품명</th>
						<td><input class="form-control form-control-lg" type="text" name="f_pname" value="Max"></td>
					</tr>
				</tbody></table>	
				
				<div class="container" style="text-align: center;">
					<input class="diary-btn-yellow" type="button" value="등록" onclick="send(this.form);">
				</div>
				
			</form>
		</c:forEach>


		<!-- 건강 -->
		<c:forEach var="vo" items="${ health_list }">
			<form id="memoForm" action="http://localhost:8080/fileupload/diaryAdd.do" method="post">
				<table class="table">
					<tbody><tr>
						<th>날짜</th>
						<td><input class="form-control form-control-lg" type="text" name="h_rdate" value="2024-07-25" 00:00:00.0=""></td>
					</tr>
					<tr>
						<th>반려동물</th>
						<td><input class="form-control form-control-lg" type="text" name="p_idx" value="201"></td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td><select class="form-control  form-control-lg" id="h_type" name="h_type" required="">
								<option value="">카테고리 선택</option>
								<option value="진료">진료</option>
								<option value="접종">접종</option>
						</select></td>
					</tr>
					<tr>
						<th>시간</th>
						<td><input class="form-control form-control-lg" type="time" name="h_time"></td>
					</tr>
					<tr>
						<th>비용</th>
						<td><input class="form-control form-control-lg" type="number" name="h_cost" value="120.0"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><input class="form-control form-control-lg" type="text" name="h_content" value="Annual" shots=""></td>
					</tr>
					<tr>
						<th>병원명</th>
						<td><input class="form-control form-control-lg" type="text" name="h_hname" value="Animal" hospital="" a=""></td>
					</tr>
					<tr>
						<th>다음예약일</th>
						<td><input class="form-control form-control-lg" type="text" name="h_ndate" value=""></td>
					</tr>
				</tbody></table>
				
				<div class="container" style="text-align: center;">
					<input class="diary-btn-yellow" type="button" value="등록" onclick="send(this.form);">
				</div>
			</form>
		</c:forEach>


		<!-- 메모 -->
		
		<c:forEach var="vo" items="${ note_list }">
			<form id="memoForm" action="http://localhost:8080/fileupload/diaryAdd.do" method="post">
				<table class="table">
					<tbody><tr>
						<th>날짜</th>
						<td><input class="form-control form-control-lg" type="text" name="o_rdate" value="2024-07-25" 00:00:00.0=""></td>
					</tr>
					<tr>
						<th>반려동물</th>
						<td><input class="form-control form-control-lg" type="text" name="p_idx" value=${vo.p_idx} ></td>
					</tr>
					<tr>
						<th>시간</th>
						<td><input class="form-control form-control-lg" type="time" name="o_time"></td>
					</tr>
					<tr>
						<th>메모</th>
						<td>
							<div class="">
								<textarea class="form-control form-control-lg" id="o_content" name="p_content" rows="3" placeholder="내용을 입력해주세요." oninput="this.style.height=&quot;&quot;, this.style.height= this.scrollHeight + &quot;px&quot;">Active and playful today</textarea>
							</div>
						</td>
					</tr>
				</tbody></table>
				
				<div class="container" style="text-align: center;">
					<input class="diary-btn-yellow" type="button" value="등록" onclick="send(this.form);">
				</div>
			</form>
		</c:forEach>
 --%>

	</div>



	<br>
	<br>
	<br> &nbsp;&nbsp;&nbsp;

	<input class="diary-btn-yellow" type="button" value="등록"
		onclick="send(this.form);"> &nbsp;&nbsp;&nbsp;
	<input class="diary-btn-yellow-outline" type="button" value="등록"
		onclick=""> &nbsp;&nbsp;&nbsp;

	<input class="diary-btn-gray-outline" type="button" value="등록"
		onclick="">

</body>
</html>