<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
/*검색*/
function fnSrch() {
	var form = document.getElementById("writeForm");
    form.method = "get";
    form.action = "<c:url value='/bnr/bnr'/>";
    form.submit();
}
</script>
<style type="text/css">
	.li {list-style:none; float:left; padding:6px;}
</style>
<div id="contentarea" class="l-content">
	<div class="breadcrumb">
		<a href="${pageContext.request.contextPath}/main"><span class="path_home">Home</span></a>
		<a href="${pageContext.request.contextPath}/bnr/"><span>게시판관리</span></a>
		<span>베너관리</span><span class="path_current">${boardManage.boardName}</span>
	</div> <!-- //breadcrumb -->
	<div class="subcontent_wrap">
		<div class="subcontent_inner">
			<div class="subcontent">
				
				<div class="subcontent_title_wrap">
					<h3 class="subcontent_title">베 너 관 리</h3>
					<p class="subcontent_desc"></p>
				</div> <!-- //subcontent_title_wrap -->
						
				<div class="boardType01_wrap">
					<form id="writeForm" name="writeForm">
						<table id="boardTable1" class="boardType01_tblList">
							<caption><span class="t-hidden">검색</span></caption>
							<colgroup>
								<col style="width:5%"/>
								<col style="width:10%"/>
								<col style="width:5%"/>
							</colgroup>
							<tbody>
							<tr>
								<th><select name="srchKey" id="srchKey" class="input_selectN">
								    <option value="tl">베너명</option>
									<option value="type">베너구분</option>
								    <option value="kind">베너종류</option>
								</select></th>
								<td><input type="text" id="srchCont" name="srchCont" style="width:530px"></td>
								<td><button type="button" id="btnSrch" onClick="fnSrch()" class="btnTxt btnTxt_normal btnTxt_gray">검색</button></td>
							</tr>
							</tbody>
						</table>
						
						<span class="boardType01_info_top">총 <strong>${count}</strong>개의 게시물이 있습니다.</span>
					
						<c:set var="cols" value="8"/>
						<table id="boardTable1" class="boardType01_tblList" style=TABLE-layout:fixed>
							<caption><span class="t-hidden">필독/공지</span></caption>
							<colgroup>
								<col style="width:3%"/>
								<col style="width:5%"/>
								<col style="width:10%"/>
								<col style="width:10%"/>
								<col style="width:5%"/>
								<col style="width:5%"/>
								<col style="width:5%"/>
								<col style="width:5%"/>
							</colgroup>
							<thead>
							<tr>
								<th></th>
								<th>베너구분</th>
								<th>베너명</th>
								<th>베너설명</th>
								<th>베너종류</th>
								<th>사용유무</th>
								<th>작성자</th>
								<th>작성일</th>
							</tr>
							</thead>
							<tbody>
							<c:forEach var="bnr" items="${list}">
								<tr class="hover">
									<td>${bnr.rNum}</td>
									<td>${bnr.bnrType}</td>
									<td><a href="/bnr/bnr_dtl?bnrCd=${bnr.bnrCd}">${bnr.bnrNm}</a></td>
									<td>${bnr.bnrCont}</td>
									<td>${bnr.bnrKind}</td>
									<td>${bnr.useYn}</td>
									<td>${bnr.regId}</td>
									<td><fmt:formatDate value="${bnr.regDt}" pattern="yyyy.MM.dd"/></td>
								</tr>
					     	</c:forEach>
					     	
					     	<c:if test="${empty list}">
							<tr>
								<td colspan="8" class="no-data">게시물이 없습니다.</td>
							</tr>
							</c:if>
							</tbody>
						</table> <!-- //boardType01_tblList -->
					
						<div class="pagination">
						  <ul>
						    <c:if test="${pageMaker.prev}">
						    	<li class="li"><a href="bnr${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
						    </c:if> 
						    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						    	<li class="li"><a href="bnr${pageMaker.makeQuery(idx)}">${idx}</a></li>
						    </c:forEach>
						    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						    	<li class="li"><a href="bnr${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
						    </c:if> 
						  </ul>
						</div>
	
					<div class="boardType01_list_btn">
						<a href="${pageContext.request.contextPath}/bnr/bnr_reg" class="btnTxt btnTxt_normal btnTxt_gray"><span>등록</span></a>
					</div> <!-- //boardType01_list_btn -->
				</form>
				</div> <!-- //boardType01_wrap -->
			</div> <!-- //subcontent -->
		</div> <!-- //subcontent_inner -->
	</div> <!-- //subcontent_wrap -->
	
</div> <!-- //content -->
