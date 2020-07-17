<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <style>
	.schedule-table {border-spacing: 0; border-collapse: collapse; box-sizing: content-box; border: 1px solid #000; }
	.schedule-table tr th {border: 1px solid #000; background: #D1ABAB; width: 80px; height: 34px;}
	.schedule-table tr th #head {background: #ffffff;}
	.schedule-table tr .sunday {color: red;}
	.schedule-table td {border: 1px solid #000; width: 80px; height: 80px; vertical-align: top;}
	.schedule-table td .schedule-day {position: relative;}
	.schedule-table td .schedule-day span .day {position: absolute; top: 5px; left: 5px}
	.schedule-table td .schedule-day div.schedule {position: absolute; top: 20px; left: 5px; word-break: break-all;}
	.schedule-navi {cursor: pointer;}
  </style>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.1.min.js"></script> 
  <script>

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
				<th colspan="7" id="head">
			</tr>
		</thead>
	
	</table>
 </body>
</html>