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
	var form = document.getElementById("searchFrm");
    form.method = "get";
    form.action = "<c:url value='/intrBrd/" + service + "'/>";
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
								<select name="srchKey" id="srchKey" class="boardType01_search_select">
									<option value="t">제목</option>
									<option value="c">내용</option>
									<option value="tc">제목+내용</option>
									<option value="w">작성자</option>
								</select>
								<input type="text" name="srch" id="srch" class="boardType01_search_input"/>
								<button type="submit" onClick='fnSrch()'><img src="${pageContext.request.contextPath}/resources/admin/img/common/btn_search_gray.gif" alt="검색" /></button>
							</div> <!-- //boardType01_search -->
						</fieldset>
					</form>
					
					<span class="boardType01_info_top">총 <strong>${count}</strong>개의 게시물이 있습니다.</span>
					
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
						</colgroup>
						<thead>
						<tr>
							<th></th>
							<th>제목</th>
							<th>내용</th>
							<th>공지옵션</th>
							<th>작성일</th>
							<th>작성자</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="brd" items="${list}">
						<tr>
								<td>${brd.rNum}</td>
								<td><a href="/intrBrd/intr_brd_brd_dtl?boardCd=${brd.boardCd}">${brd.boardTitle}</a></td>
								<td>${brd.boardContent}</td>
								<td>${brd.ancmOptnYn}</td>
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
					  <ul>
					    <c:if test="${pageMaker.prev}">
					    	<li class="li1"><a href="cmn_cd${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
					    </c:if> 
					
					    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					    	<li class="li1"><a href="cmn_cd${pageMaker.makeSearch(idx)}">${idx}</a></li>
					    </c:forEach>
					
					    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					    	<li class="li1"><a href="cmn_cd${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
					    </c:if> 
					  </ul>
					</div>
	
					<div class="boardType01_list_btn">
						<a href="${pageContext.request.contextPath}/intrBrd/intr_brd_brd_reg" class="btnTxt btnTxt_normal btnTxt_gray"><span>등록</span></a>
					</div> <!-- //boardType01_list_btn -->
				</div> <!-- //boardType01_wrap -->
				
			</div> <!-- //subcontent -->
		</div> <!-- //subcontent_inner -->
	</div> <!-- //subcontent_wrap -->
	
</div> <!-- //content -->
