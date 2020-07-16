<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<script>
/*검색어 찾기*/
function fnSrch(){
	submit('intr_brd_gal');
}
/*submit*/
function submit(service){
	var form = document.getElementById("searchForm");
    form.method = "get";
    form.action = "<c:url value='/intrBrd/" + service + "'/>";
    form.submit();
}
</script>

<div id="contentarea" class="l-content">
	<div class="breadcrumb">
		<a href="${pageContext.request.contextPath}/main"><span class="path_home">Home</span></a>
		<a href="${pageContext.request.contextPath}/intrBrd/"><span>게시판관리</span></a>
		<span>통합게시판(갤러리형)</span><span class="path_current">${boardManage.boardName}</span>
	</div> <!-- //breadcrumb -->
	<div class="subcontent_wrap">
		<div class="subcontent_inner">
			<div class="subcontent">
				
				<div class="subcontent_title_wrap">
					<h3 class="subcontent_title">통 합 게 시 판 (갤러리형)</h3>
					<p class="subcontent_desc"></p>
				</div> <!-- //subcontent_title_wrap -->
						
				<div class="boardType01_wrap">
					<form id="searchForm" name="searchForm">
					<table id="boardTable1" class="boardType01_tblList">
						<caption><span class="t-hidden">검색</span></caption>
						<colgroup>
							<col style="width:10%"/>
							<col style="width:10%"/>
						</colgroup>
						<tbody>
						<tr>
							<td><input type="text" id="srch" name="srch" style="width: 600px"></td>
							<td><button type="button" onClick="fnSrch()" id="btn_srch" class="btnTxt btnTxt_normal btnTxt_gray">검색</button></td>
						</tr>
						</tbody>
					</table>

					<span class="boardType01_info_top">총 <strong>${count}</strong>개의 게시물이 있습니다.</span>
					
					<c:set var="cols" value="7"/>
					<table id="boardTable2" class="boardType01_tblList">
						<caption><span class="t-hidden">갤러리형</span></caption>
						<colgroup>
							<col style="width:20%"/>
							<col style="width:20%"/>
							<col style="width:20%"/>
						</colgroup>
						<thead>
						<tr>
							<th></th>
							<th>IMAGE</th>
							<th></th>
						</tr>
						</thead>
						<tbody>
						<%
							int newLine = 0;
							int cnt = 0;
						%>
						<c:forEach var="gal" items="${list}">
						<%
							if(newLine==0){
								out.print("<tr>");
							}
							newLine++;
							cnt++;
						%>
								<td><a href="/intrBrd/intr_brd_gal_dtl?brdCd=${gal.brdCd}&hit=${gal.hit}"><img src="${pageContext.request.contextPath}/resources/admin/img/intr/kogi.gif" alt="${gal.img}"/>
								<br>${gal.img}</a></td>
				     	<%
							if(newLine==3){
								out.print("</tr>");
								newLine = 0;
							}
						%>
				     	</c:forEach>
				     	<%
				     		cnt = 3 - (cnt%3==0 ? 3 : cnt%3);
							for(int i=0; i<cnt; i++){
								out.print("<td>");
								out.print("</td>");
							}
							
					     	if(newLine!=3 && newLine!=0){
								out.print("</tr>");
								newLine = 0;
							}
						%>
				     	<c:if test="${empty list}">
						<tr>
							<td colspan="10" class="no-data">게시물이 없습니다.</td>
						</tr>
						</c:if>
						</tbody>
					</table> <!-- //boardType01_tblList -->
					
					<div style="position:relative; padding: 1px; display:block; text-align:center;">
					  <ul>
					    <c:if test="${pageMaker.prev}">
					    	<li class="li"><a href="intr_brd_gal${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
					    </c:if> 
					
					    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					    	<li class="li"><a href="intr_brd_gal${pageMaker.makeQuery(idx)}">${idx}</a></li>
					    </c:forEach>
					
					    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					    	<li class="li"><a href="intr_brd_gal${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
					    </c:if> 
					  </ul>
					</div>
		
					<div style="margin-top:10px; text-align:right;">
						<a href="${pageContext.request.contextPath}/intrBrd/intr_brd_gal_reg" class="btnTxt btnTxt_normal btnTxt_gray"><span>등록</span></a>
					</div> <!-- //boardType01_list_btn -->
				</form>
				</div> <!-- //boardType01_wrap -->
				
			</div> <!-- //subcontent -->
		</div> <!-- //subcontent_inner -->
	</div> <!-- //subcontent_wrap -->
	
</div> <!-- //content -->
