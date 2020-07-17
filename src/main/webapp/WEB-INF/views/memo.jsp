<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <style>
	.schedule-table {border-spacing: 0; border-collapse: collapse; box-sizing: content-box; border: 1px solid #000; }
	.schedule-table tr th {border: 1px solid #000; background: #D1ABAB; width: 80px; height: 34px; }
	.schedule-table tr th#head {background: #ffffff; }
	.schedule-table tr .sunday {color: red;}
	 .schedule-table tr .saturday {color: blue;} 
	.schedule-table td {border: 1px solid #000; width: 80px; height: 80px; vertical-align: top;}
	.schedule-table td .schedule-day {position: relative;}
	.schedule-table td .schedule-day span .day {position: absolute; top: 5px; left: 5px}
	.schedule-table td .schedule-day div.schedule {position: absolute; top: 20px; left: 5px; word-break: break-all;}
	.schedule-navi {cursor: pointer;}
  </style>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.1.min.js"></script> 
  <script>
	var today = new Date();
	
	//한 주의 시작 요일 가져오기
	function getFirstDay() {
		today.setDate('1');
		return  today.getDay();
	}
	
	//매월 마지막 날짜 가져오기(윤년 계산)
	function getLastDate() {
		var year = today.getFullYear(); //현재 년도
		var month = today.getMonth(); //현재 월
		var last = [31,28,31,30,31,30,31,31,30,31,30,31]; //매월 마지막 날짜
		//윤년 계산
		if (year % 4 == 0 && year % 100 !=0 || year % 400 == 0) {
			last[1] = 29; 
		}
		lastDate = last[month-1]; 
		return lastDate;
	}
	
	//달력 월 이동 
	function moveTo(addMonth) {
		today.setMonth(today.getMonth() + addMonth);
		next();
	}
	//스케쥴러 일정 열기
	function open(year, month, date) {
		var schedule = storage.get(year, month, date);
		console.log("schedule", schedule);
		
		$("#year").val(year);
		$("#month").val(month);
		$("#date").val(date);
		
		if (schedule) {
			$("#title").val(schedule.title);
			$("#time").val(schedule.time);
			$("#memo").val(schedule.meno);
		} else {
			$("#title").val('');
			$("#time").val('');
			$("#memo").val('');
		}
		$('#div2').show();
	}
	
	//일정 저장하기
	function save() {
		var year = $("#year").val();
		var month = $("#month").val();
		var date = $("#date").val();
		var title = $("#title").val();
		var time = $("#time").val();
		var memo = $("#memo").val();
		
		storage.set(year,month,date,
			{
				title: title,
				time: time,
				memo: memo
			});
		moveTo(0);
		cancel();
	}
	
	//일정 취소하기 
	function cancel() {
		$("#title").val('');
		$("#time").val('');
		$("#memo").val('');
		$('#div2').hide();
	}
	
	//저장소 설정
	var storage = {
		set: function (year, month, date, val) {
			var key = "schedule_" + year + "_" + month + "_" + date;
			window.localStorage.setItem(key, JSON.stringify(val));
		},
		get: function(year, month, date) {
			var key = "schedule_" + year + "_" + month + "_" + date;
			var data = window.localStorage.getItem(key);
			if (data) {
				return JSON.parse(data);
			}
			return null;
		},
		remove: function() {
			window.localStorage.removeItem(key);
		}
	}
	
	function calAdd(c) {
		var year = today.getFullYear(); //현재 년도
		var month = today.getMonth()+1; //현재 월 
		open(year,month,c);
	}
	
	//달력 그리기
	function next() {
		var year = today.getFullYear(); //현재 년도
		var month = today.getMonth()+1; //현재 월 
		var date = today.getDate();//현재 일
		var firstDay = getFirstDay(); //시작요일 0(일)~6(토)
		var lastDate = getLastDate(); //마지막날짜
		
		//테이블 제목
		var now = "<h2><a onclick='moveTo(-1)'>◀</a>"+year+"년"+month+"월"+"<a onclick='moveTo(1)'>▶</a></h2>";
		
		//for문으로 테이블 그리기
		var cal = "";
		var c = 1;
		for (var i = 1; i <= 6; i++) { //tr
			cal += "<tr>";
			for (var j = 1; j <= 7; j++) { //td
				cal +="<td class='schedule-day" + (j ==1? " sunday" : (j == 7? " saturday" : ""))+ "' onclick='calAdd("+ c+");'>";
				
				//요일만큼 빈칸  생성 
				if (firstDay >0 && i == 1 && j <=firstDay) { 
				//c가 매월 마지막 날짜보다 작을때까지만	
				} else if (c <= lastDate) { 
					var save = storage.get(year, month, c);
					cal += "<span class='day'>"+ (c++) + "</span>";
					if (save) {
						cal += "<div class='schedule'>" + save.title + "</div>";
					}
				} else { //6줄일 때만 6줄 보여주기
					i = 6;
				}
				cal += "</td>";
			}
			cal +="</tr>";
		}
		$("#head").html(now);
		$("#body").html(cal);
	}
	next();
  </script>
  <title>스케쥴러 만들기</title>
 </head>
 <body>
 <!-- 스케쥴러 
 	1. 테이블로 달력그리기 
 	(현재 년월일, 현재 월의 종료일, 현재 월의 시작일의 요일)
  -->
	<table class="schedule-table">
		<thead>
			<tr>
				<th id="head" colspan="7" >
			</tr>
			<tr>
				<th class="sunday">일</th>
				<th>월</th>
				<th>화</th>
				<th>수</th>
				<th>목</th>
				<th>금</th>
				<th class="saturday">토</th>
			</tr>
		</thead>
		<tbody id="body"></tbody>
	</table>
	<div id="div2">
		<fieldset style="width:300px">
			<legend>[일정 관리]</legend>
				<form>
					<input type="text" id="year">년<br>
					<input type="text" id="month">월<br>
					<input type="text" id="date">일<br>	
					<ul>
						<li>제목:<input type="text" id="title"></li>
						<li>시간:<input type="time" id="time"></li>
						<li>메모:<input type="text" id="memo" style="width:350px"></li>
					</ul>		
					<button type="button" onclick="save();">저장</button>
					<button type="button" onclick="cancel();">취소</button>		
				</form>
		</fieldset>
	</div>
 </body>
</html>