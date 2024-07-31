<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- fullCalendar API 관련 JS파일 -->
<script src='resources/index.global.js'></script>

<link rel="stylesheet" href="resources/css/common.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>



<script type="text/javascript">

document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');

  var calendar = new FullCalendar.Calendar(calendarEl, {
    headerToolbar: {
      left: 'prevYear,prev,next,nextYear today',
      center: 'title',
      right: 'dayGridMonth,dayGridWeek,dayGridDay'
    },
    initialDate: '2023-01-12',
    dateClick: function(info) { // 날짜 클릭시 이벤트 
	    // alert('Clicked on: ' + info.dateStr);
    
	      // 클릭한 날짜를 보여주는 div 업데이트
	      document.getElementById('selected-date').innerText = 'Selected Date: ' + info.dateStr;
	      
	      // 메모 입력 폼 생성
	      var memoFormHtml = `
	        <form id="memoForm" action="diaryAdd.do" method="post">
	    	  
	    	  <label for="w_id">w_id ID:</label>
	    	  <input type="text" id="w_id" name="w_id"><br>
	    	  
	    	  <label for="p_id">Pet ID:</label>
	    	  <input type="text" id="p_id" name="p_id"><br>
	    	  
	          <input type="submit" value="Save Memo">
	        </form>
	      `;
	      
	      document.getElementById('memo-form-container').innerHTML = memoFormHtml;
	    
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
</style>


</head>
<body>

	<!-- top 옵션-->
	<%@include file="../top.jsp"%>

	<!-- navbar 옵션  -->
	<%@include file="../navbar.jsp"%> 
	
	
	<div id='calendar'></div>

	<div id='selected-date' style="text-align: center; margin-top: 20px;"></div>
	<div id='memo-form-container'></div>



	<div class='container'>
		<form id="memoForm" action="diaryAdd.do" method="post">
			<table class="table">
				<tr>
					<th>날짜</th>
					<td><input class="form-control form-control-lg" type="text"
						name="s_rdate" value="2024-07-21"></td>
				</tr>
				<tr>
					<th>반려동물</th>
					<td><input class="form-control form-control-lg" type="text"
						name="p_idx" value="흰둥이"></td>
				</tr>
				<tr>
					<th>시작시간</th>
					<td><input class="form-control form-control-lg" type="time"
						name="s_stime" value=""></td>
				</tr>
				<tr>
					<th>종료시간</th>
					<td><input class="form-control form-control-lg" type="time"
						name="s_etime"></td>
				</tr>
				<tr>
					<th>거리(m)</th>
					<td><input class="form-control form-control-lg" type="number"
						name="s_distance" value="10"></td>
				</tr>
				<!-- 				<tr>
					<th>카테고리</th>
					<td><select class="form-control  form-control-lg" id="p_cate" name="p_cate" required>
						<option value="">카테고리 선택</option>
						<option value="침대">침대</option>
						<option value="소파">소파</option>
						<option value="식탁">식탁</option>
						<option value="의자">의자</option>
						<option value="수납장">수납장</option>
					</select></td>
				</tr>
				<tr>
					<th>분류</th>
					<td>
						<div class="form-control-lg" >
							<input type="radio" id="p_type_1" name="p_type" value="1" checked>
							<label for="normal">일반</label>&nbsp;&nbsp;&nbsp;
							<input type="radio" id="p_type_2" name="p_type" value="2">
							<label for="notice">공지</label>
						</div>
					</td>
				</tr> -->
				<tr>
					<th>메모</th>
					<td>
						<div class="">
							<textarea class="form-control form-control-lg" id="p_content"
								name="p_content" rows="3" placeholder="내용을 입력해주세요."
								oninput='this.style.height="", this.style.height= this.scrollHeight + "px"'></textarea>
						</div>
					</td>
				</tr>

				
				<tr>
					<th>날짜</th>
					<td><input class="form-control form-control-lg" type="text"
						name="s_rdate" value="2024-07-21"></td>
				</tr>
				<tr>
					<th>반려동물</th>
					<td><input class="form-control form-control-lg" type="text"
						name="p_idx" value="흰둥이"></td>
				</tr>
				<tr>
					<th>체중(kg)</th>
					<td><input class="form-control form-control-lg" type="number"
						name="s_distance" value="2.5"></td>
				</tr>
				
				
				
				<tr>
					<th>날짜</th>
					<td><input class="form-control form-control-lg" type="text"
						name="s_rdate" value="2024-07-21"></td>
				</tr>
				<tr>
					<th>반려동물</th>
					<td><input class="form-control form-control-lg" type="text"
						name="p_idx" value="흰둥이"></td>
				</tr>
				<tr>
					<th>카테고리</th>
					<td><select class="form-control  form-control-lg" id="f_type" name="p_cate" required>
						<option value="">카테고리 선택</option>
						<option value="사료">사료</option>
						<option value="간식">간식</option>
						<option value="영양제">영양제</option>
					</select></td>
				</tr>
				<tr>
					<th>시간</th>
					<td><input class="form-control form-control-lg" type="time"
						name="s_etime"></td>
				</tr>
				<tr>
					<th>제품명</th>
					<td><input class="form-control form-control-lg" type="text"
						name="s_rdate" value="맛있는개껌"></td>
				</tr>
				
				
				
				<tr>
					<th>날짜</th>
					<td><input class="form-control form-control-lg" type="text"
						name="s_rdate" value="2024-07-21"></td>
				</tr>
				<tr>
					<th>반려동물</th>
					<td><input class="form-control form-control-lg" type="text"
						name="p_idx" value="흰둥이"></td>
				</tr>
				<tr>
					<th>카테고리</th>
					<td><select class="form-control  form-control-lg" id="f_type" name="p_cate" required>
						<option value="">카테고리 선택</option>
						<option value="진료">진료</option>
						<option value="접종">접종</option>
					</select></td>
				</tr>
				<tr>
					<th>시간</th>
					<td><input class="form-control form-control-lg" type="time"
						name="s_etime"></td>
				</tr>
				<tr>
					<th>비용</th>
					<td><input class="form-control form-control-lg" type="number"
						name="s_distance" value="2.5"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><input class="form-control form-control-lg" type="text"
						name="s_rdate" value="감기"></td>
				</tr>
				<tr>
					<th>병원명</th>
					<td><input class="form-control form-control-lg" type="text"
						name="s_rdate" value="참좋은동물병원"></td>
				</tr>
				<tr>
					<th>다음예약일</th>
					<td><input class="form-control form-control-lg" type="text"
						name="s_rdate" value="2024-07-25"></td>
				</tr>




			</table>
			<div class="container" style="text-align: center;">
				<input class="diary-btn-yellow" type="button" value="등록"
					onclick="send(this.form);">
			</div>


		</form>
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