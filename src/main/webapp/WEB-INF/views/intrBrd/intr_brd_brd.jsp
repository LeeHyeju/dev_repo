<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<script>
/*검색*/
function fnSrch(){
	 submit('intr_brd_brd_search');
}
/*등록*/
function fnReg(){
	 submit('intr_brd_brd_reg');
}

function submit(service){
	var form = document.getElementById("viewFrm");
    form.method = "get";
    form.action = "<c:url value='/cmnCd/" + service + "'/>";
    form.submit();
}
</script>

<div id="contentarea" class="l-content">
	<div class="breadcrumb">
		<a href="${pageContext.request.contextPath}/main"><span class="path_home">Home</span></a>
		<a href="${pageContext.request.contextPath}/intrBrd/"><span>게시판관리</span></a>
		<span>통합게시판(게시판형)</span><span class="path_current">${boardManage.boardName}</span>
	</div> <!-- //breadcrumb -->
	<div class="subcontent_wrap">
		<div class="subcontent_inner">
			<div class="subcontent">
				
				<div class="subcontent_title_wrap">
					<h3 class="subcontent_title">통 합 게 시 판 (게시판형)</h3>
					<p class="subcontent_desc"></p>
				</div> <!-- //subcontent_title_wrap -->
						
				<div class="boardType01_wrap">
					<form id="searchFrm" action="" method="get">
						<fieldset>
							<legend>게시판 검색폼</legend>
							<div class="boardType01_search">
								<select name="srch" id="srch" class="boardType01_search_select">
									<option value="t">제목</option>
									<option value="c">내용</option>
									<option value="tc">제목+내용</option>
									<option value="w">작성자</option>
								</select>
								<input type="hidden" name="boardCode" id="boardCode" value=" "/>
								<input type="text" name="sKeyword" id="sKeyword" class="boardType01_search_input" value="" /><button type="submit" onClick='fnSrch()'><img src="${pageContext.request.contextPath}/resources/admin/img/common/btn_search_gray.gif" alt="검색" /></button>
							</div> <!-- //boardType01_search -->
						</fieldset>
					</form>
					
					<span class="boardType01_info_top">총 <strong>${count}</strong>개의 게시물이 있습니다.</span>
					
<!-- 					<table id="boardTable1" class="boardType01_tblList" cellspacing="0"> -->
<%-- 						<caption><span class="t-hidden">검색<span></caption> --%>
<%-- 						<colgroup> --%>
<%-- 							<col style="width:10%"/> --%>
<%-- 							<col style="width:10%"/> --%>
<%-- 						</colgroup> --%>
<!-- 						<tbody> -->
<!-- 						<tr> -->
<!-- 							<th>제목</th> -->
<!-- 							<td><input type="text" id="title" name="title"></td> -->
<!-- 						</tr> -->
<!-- 						</tbody> -->
<!-- 					</table> -->
					
<!-- 					<div class="boardType01_write_btn"> -->
<!-- 						<button type="button" id="btn_srch" class="btnTxt btnTxt_normal btnTxt_gray">검색</button> -->
<!-- 					</div> -->

<!-- 					<span class="boardType01_info_top">총 <strong>1</strong>개의 게시물이 있습니다.</span> -->
					
					<c:set var="cols" value="5"/>
					<table id="boardTable2" class="boardType01_tblList" cellspacing="0">
						<caption><span class="t-hidden">게시판형</span></caption>
						<colgroup>
							<col style="width:1%" />
							<col style="width:7%" />
							<col style="width:7%" />
							<col style="width:7%" />
							<col style="width:7%" />
							<col style="width:7%" />
							<col style="width:7%" />
						</colgroup>
						<thead>
						<tr>
							<th></th>
							<th>제목</th>
							<th>내용</th>
							<th>.</th>
							<th>작성일</th>
							<th>작성자</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="brd" items="${list}">
						<tr>
								<td>${brd.rNum}</td>
								<td><a href="/intrBrd/intr_brd_brd_dtl?boardTitle=${brd.boardTitle}">${brd.boardTitle}</a></td>
								<td>${brd.boardContent}</td>
								<td>.</td>
								<td><fmt:formatDate value="${brd.regDt}" pattern="yyyy.MM.dd"/></td>
								<td class="t-gray">${brd.regId}</td>
						</tr>
				     	</c:forEach>
				     	<c:if test="${empty list}">
						<tr>
							<td colspan="10" class="no-data">게시물이 없습니다.</td>
						</tr>
						</c:if>
						</tbody>
					</table> <!-- //boardType01_tblList -->
					
					<div class="pagination">
						<a href="#" class="first">시작</a>
						<a href="#" class="prev">다음</a>
						<a href="#" class="on">1</a>
						<a href="#">2</a>
						<a href="#">3</a>
						<a href="#">4</a>
						<a href="#">5</a>
						<a href="#">6</a>
						<a href="#">7</a>
						<a href="#">8</a>
						<a href="#">9</a>
						<a href="#">10</a>
						<a href="#" class="next">다음</a>
						<a href="#" class="last">마지막</a>
					</div>
		
					<div class="boardType01_list_btn">
						<a href="${pageContext.request.contextPath}/intrBrd/intr_brd_brd_reg" class="btnTxt btnTxt_normal btnTxt_gray"><span>등록</span></a>
					</div> <!-- //boardType01_list_btn -->
				</div> <!-- //boardType01_wrap -->
				
			</div> <!-- //subcontent -->
		</div> <!-- //subcontent_inner -->
	</div> <!-- //subcontent_wrap -->
	
</div> <!-- //content -->
