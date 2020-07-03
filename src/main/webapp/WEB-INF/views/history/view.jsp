<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
	html {overflow:hidden;} 
	.l-content {padding:15px;float:left;height:600px;width:520px;}
	.boardType01_tblList {width:100%; border-top:2px solid #777; border-bottom:2px solid #dbdbdb;}
	.boardType01_tblList th,
	.boardType01_tblList td {padding-top:10px; padding-bottom:12px; border-bottom:1px solid #dbdbdb; text-align:center; color:#666;}
	.boardType01_tblList th {font-size:13px;}
	
	.li {list-style: none; float: left; padding: 6px;}
	.hover:hover {background-color:#f5f5f5;}
</style>
<body>
	<table id="boardTable2" class="boardType01_tblList">
		<caption><span class="t-hidden">검색</span></caption>
		<colgroup>
			<col style="width:20%"/>
			<col style="width:80%"/>
		</colgroup>
		<thead>
			<tr style="background-color: #BDBDBD">
				<th>항목</th>
				<th>내용</th>
			</tr>
		</thead>
		<tbody>
			<tr class="hover" onClick='fnClick("${historyVer}")'>
				<td><strong>버전</strong></td>
				<td style="width:100px;height:150px;">${view.historyVer}</td>
			</tr>
			<tr class="hover" onClick='fnClick("${historyVer}")'>
				<td>컨텐츠스타일</td>
				<td style="width:100px;height:150px;">${view.contStyle}</td>
			</tr>
			<tr class="hover" onClick='fnClick("${historyVer}")'>
				<td>컨텐츠스크립트</td>
				<td style="width:100px;height:150px;">${view.contScript}</td>
			</tr>
			<tr class="hover" onClick='fnClick("${historyVer}")'>
				<td>컨텐츠내용</td>
				<td style="width:100px;height:150px;">${view.contents}</td>
			</tr>
			
	     	<c:if test="${empty view}">
			<tr>
				<td colspan="6" class="no-data"><strong>이전 히스토리가 존재하지 않습니다.</strong></td>
			</tr>
			</c:if>
		</tbody>
	</table>	
</body>
</html>