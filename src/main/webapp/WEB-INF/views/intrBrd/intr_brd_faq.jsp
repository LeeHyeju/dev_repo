<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<script>
/*검색어 찾기*/
function fnSrch(){
	submit('intr_brd_faq');
}
/*탭 선택*/
function fnTab(tabNum) {
	var tabCont = document.getElementsByClassName("tab-content");
	var tab = document.getElementsByClassName("tab-link");
	for(i = 0; i < tabCont.length; i++){
		tabCont[i].style.display = "none";
		tab[i].style.background = "none";
	}
	tabCont[tabNum].style.display = "inherit";
	tab[tabNum].style.background = "#ededed";
}
/*submit*/
function submit(service){
	var form = document.getElementById("searchForm");
    form.method = "get";
    form.action = "<c:url value='/intrBrd/" + service + "'/>";
    form.submit();
}
</script>
<style type="text/css">
	.li {list-style: none; float: left; padding: 6px; text-align: center;}
	
	.container{width: 500px; margin: 0 auto;}
	ul.tabs{margin: 0px; padding: 0px; list-style: none;}
	ul.tabs li{background: none;color: #222;display: inline-block;padding: 10px 15px;cursor: pointer;}
	ul.tabs li.current{background: #ededed;color: #222;}
	.tab-content{display: none;background: #ededed;padding: 8px 10px 10px 10px;}
	.tab-content.current{display: inherit;}
</style>
<div id="contentarea" class="l-content">
	<div class="breadcrumb">
		<a href="${pageContext.request.contextPath}/main"><span class="path_home">Home</span></a>
		<a href="${pageContext.request.contextPath}/intrBrd/intr_brd"><span>게시판관리</span></a>
		<span>통합게시판(질문형)</span><span class="path_current">${boardManage.boardName}</span>
	</div> <!-- //breadcrumb -->
	<div class="subcontent_wrap">
		<div class="subcontent_inner">
			<div class="subcontent">
				
				<div class="subcontent_title_wrap">
					<h3 class="subcontent_title">통 합 게 시 판 (질문형)</h3>
					<p class="subcontent_desc"></p>
				</div> <!-- //subcontent_title_wrap -->
						
				<div class="boardType01_wrap">
					<form id="searchForm" name="searchForm">
					<table id="boardTable1" class="boardType01_tblList">
						<caption><span class="t-hidden">검색</span></caption>
						<colgroup>
							<col style="width:5%"/>
							<col style="width:10%"/>
						</colgroup>
						<tbody>
						<tr>
							<th>검색어</th>
							<td><input type="text" id="srch" name="srch" style="width:600px"></td>
						</tr>
						</tbody>
					</table>
					
					<div style="margin-top:10px; text-align:right;">
						<button type="button" id="btnSrch" onClick="fnSrch()" class="btnTxt btnTxt_normal btnTxt_gray">검색</button>
					</div>

					<ul class="tabs">
						<li class="tab-link current" onClick="fnTab('0')" data-tab="tab-1">TOP10</li>
						<li class="tab-link" onClick="fnTab('1')" data-tab="tab-2">전체</li>
					</ul>
					
					<div id="tab-1" class="tab-content current">
						<c:set var="cols" value="6"/>
						<table id="boardTable1" class="boardType01_tblList">
							<caption><span class="t-hidden">질문형</span></caption>
							<colgroup>
								<col style="width:2%"/>
								<col style="width:8%"/>
								<col style="width:20%"/>
								<col style="width:5%"/>
								<col style="width:5%"/>
								<col style="width:5%"/>
							</colgroup>
							<thead>
							<tr>
								<th></th>
								<th>문의유형</th>
								<th>제목</th>
								<th>작성날짜</th>
								<th>작성자</th>
								<th>조회수</th>
							</tr>
							</thead>
							<tbody>
							<c:forEach var="top10" items="${top10List}">
							<tr>
									<td>${top10.rNum}</td>
									<td>${top10.brdTypeNm}</td>
									<td><a href="/intrBrd/intr_brd_faq_dtl?brdCd=${top10.brdCd}&hit=${top10.hit}">${top10.brdTl}</a></td>
									<td><fmt:formatDate value="${top10.regDt}" pattern="yyyy.MM.dd"/></td>
									<td class="t-gray">${top10.regId}</td>
									<td>${top10.hit}</td>
							</tr>
					     	</c:forEach>
					     	<c:if test="${empty top10List}">
							<tr>
								<td colspan="10" class="no-data">게시물이 없습니다.</td>
							</tr>
							</c:if>
							</tbody>
						</table> <!-- //boardType01_tblList -->
					</div>
					
					<div id="tab-2" class="tab-content">
						<span class="boardType01_info_top">총 <strong>${count}</strong>개의 게시물이 있습니다.</span>
						
						<c:set var="cols" value="6"/>
						<table id="boardTable2" class="boardType01_tblList">
							<caption><span class="t-hidden">질문형</span></caption>
							<colgroup>
								<col style="width:2%"/>
								<col style="width:8%"/>
								<col style="width:20%"/>
								<col style="width:5%"/>
								<col style="width:5%"/>
								<col style="width:5%"/>
							</colgroup>
							<thead>
							<tr>
								<th></th>
								<th>문의유형</th>
								<th>제목</th>
								<th>작성날짜</th>
								<th>작성자</th>
								<th>조회수</th>
							</tr>
							</thead>
							<tbody>
							<c:forEach var="faq" items="${faqList}">
							<tr>
									<td>${faq.rNum}</td>
									<td>${faq.brdTypeNm}</td>
									<td><a href="/intrBrd/intr_brd_faq_dtl?brdCd=${faq.brdCd}&hit=${faq.hit}">${faq.brdTl}</a></td>
									<td><fmt:formatDate value="${faq.regDt}" pattern="yyyy.MM.dd"/></td>
									<td class="t-gray">${faq.regId}</td>
									<td>${faq.hit}</td>
							</tr>
					     	</c:forEach>
					     	<c:if test="${empty faqList}">
							<tr>
								<td colspan="10" class="no-data">게시물이 없습니다.</td>
							</tr>
							</c:if>
							</tbody>
						</table> <!-- //boardType01_tblList -->
						<div style="position:relative; padding: 1px; display:block; text-align:center;">
						  <ul>
						    <c:if test="${pageMaker.prev}">
						    	<li class="li"><a href="intr_brd_faq${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
						    </c:if> 
						
						    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						    	<li class="li"><a href="intr_brd_faq${pageMaker.makeQuery(idx)}">${idx}</a></li>
						    </c:forEach>
						
						    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						    	<li class="li"><a href="intr_brd_faq${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
						    </c:if> 
						  </ul>
						</div>
					</div>
		
					<div style="margin-top:10px; text-align:right;">
						<a href="${pageContext.request.contextPath}/intrBrd/intr_brd_faq_reg" class="btnTxt btnTxt_normal btnTxt_gray"><span>등록</span></a>
					</div> <!-- //boardType01_list_btn -->
					</form>	
				</div> <!-- //boardType01_wrap -->
				
			</div> <!-- //subcontent -->
		</div> <!-- //subcontent_inner -->
	</div> <!-- //subcontent_wrap -->
	
</div> <!-- //content -->
