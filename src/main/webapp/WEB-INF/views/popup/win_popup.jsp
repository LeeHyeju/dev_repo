<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팝업</title>
</head>
<style type="text/css">
table.h2 {
	font-size: 20px; font-weight: bold;
}
table.type07 {
    border-collapse: collapse; text-align: left; line-height: 1.5;border: 1px solid #ccc; margin: 20px 10px;
}
table.type07 thead {
    border-right: 1px solid #ccc;border-left: 1px solid #ccc;background: #e7708d;
}
table.type07 thead th {
    padding: 10px;font-weight: bold;vertical-align: top;color: #fff;
}
table.type07 tbody th {
    width: 150px;padding: 10px;font-weight: bold;vertical-align: top;border-bottom: 1px solid #ccc;background: #fcf1f4;
}
table.type07 td {
    width: 350px;padding: 10px;vertical-align: top;border-bottom: 1px solid #ccc;
}
</style>
<body>
	<h2 class="h2">${winPop }</h2>
	<table class="type07">
		<colgroup>
			<col style="width:10%"/>
			<col style="width:80%"/>
		</colgroup> 
		<thead>
			<tr>
				<th scope="cols">항목</th>
				<th scope="cols">내용</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row"><strong>버전</strong></th>
				<td style="width:100px;height:50px;">${winPop.popIdx}</td>
			</tr>
			<tr>
				<th><strong>컨텐츠스타일</strong></th>
				<td style="width:100px;height:150px;">${winPop.popNm}</td>
			</tr>
			<!-- 
			<tr>
				<th><strong>컨텐츠스크립트</strong></th>
				<td style="width:100px;height:150px;">${view.contScript}</td>
			</tr>
			<tr>
				<th><strong>컨텐츠내용</strong></th>
				<td style="width:100px;height:150px;">${view.contents}</td>
			</tr>
			 -->
	     	<c:if test="${empty winPop}">
			<tr>
				<td colspan="6" class="no-data"><strong>팝업이 존재하지 않습니다.</strong></td>
			</tr>
			</c:if>
		</tbody>
	</table>	
</body>
</html>