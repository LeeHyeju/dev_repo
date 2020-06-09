<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<script>
/*저장*/
function fnReg(){
	 submit('intr_brd_faq_reg');
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
		<span>통합게시판(질문형)</span><span class="path_current">${boardManage.boardName}</span>
	</div> <!-- //breadcrumb -->
	<div class="subcontent_wrap">
		<div class="subcontent_inner">
			<div class="subcontent">
				
				<div class="subcontent_title_wrap">
					<h3 class="subcontent_title">통 합 게 시 판 (질문형)</h3>
					<p class="subcontent_desc">.</p>
				</div> <!-- //subcontent_title_wrap -->
						
				<div class="boardType01_wrap">
					<form id="searchFrm" action="" method="get">
					<table id="boardTable1" class="boardType01_tblList" cellspacing="0">
						<caption><span class="t-hidden">검색</span></caption>
						<colgroup>
							<col style="width:10%"/>
							<col style="width:10%"/>
						</colgroup>
						<tbody>
						<tr>
							<th>검색어</th>
							<td><input type="text" id="title" name="title"></td>
						</tr>
						</tbody>
					</table>
					
					<div class="boardType01_write_btn">
						<button type="button" id="btn_srch" class="btnTxt btnTxt_normal btnTxt_gray">검색</button>
					</div>

					<span class="boardType01_info_top">총 <strong>${count}</strong>개의 게시물이 있습니다.</span>
					
					<c:set var="cols" value="5"/>
					<table id="boardTable2" class="boardType01_tblList" cellspacing="0">
						<caption><span class="t-hidden">질문형</span></caption>
						<colgroup>
							<col style="width:2%"/>
							<col style="width:7%"/>
							<col style="width:7%"/>
						</colgroup>
						<thead>
						<tr>
							<th></th>
							<th>문의유형</th>
							<th>제목</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="faq" items="${list}">
						<tr>
								<td>${faq.rName}</td>
								<td>${faq.brdType}</td>
								<td><a href="/intrBrd/intr_brd_faq_dtl?boardTitle=${faq.brdTl}">${faq.brdTl}</a></td>
								<td><fmt:formatDate value="${faq.regDt}" pattern="yyyy.MM.dd"/></td>
								<td class="t-gray">${faq.regId}</td>
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
						<a href="${pageContext.request.contextPath}/intrBrd/intr_brd_faq_reg" class="btnTxt btnTxt_normal btnTxt_gray"><span>등록</span></a>
					</div> <!-- //boardType01_list_btn -->
					</form>	
				</div> <!-- //boardType01_wrap -->
				
			</div> <!-- //subcontent -->
		</div> <!-- //subcontent_inner -->
	</div> <!-- //subcontent_wrap -->
	
</div> <!-- //content -->
