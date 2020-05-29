<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<script>
	$(document).ready(function() {

	});
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
					<p class="subcontent_desc">.</p>
				</div> <!-- //subcontent_title_wrap -->
						
				<div class="boardType01_wrap">
					<table id="boardTable1" class="boardType01_tblList" cellspacing="0">
						<caption><span class="t-hidden">검색</span></caption>
						<colgroup>
							<col style="width:10%"/>
							<col style="width:10%"/>
						</colgroup>
						<tbody>
						<tr>
							<td><select name="brdSlct" id="brdSlct" class="input_selectN" style="width:200px;" maxlength="50" value="">
							</select></td>
							<td><input type="text" id="brdSrch" name="brdSrch"></td>
							<td><button type="button" id="btn_srch" class="btnTxt btnTxt_normal btnTxt_gray">검색</button></td>
						</tr>
						</tbody>
					</table>

					<span class="boardType01_info_top">총 <strong>1</strong>개의 게시물이 있습니다.</span>
					
					<c:set var="cols" value="5"/>
					<table id="boardTable2" class="boardType01_tblList" cellspacing="0">
						<caption><span class="t-hidden">질문형</span></caption>
						<colgroup>
							<col style="width:2%" />
							<col style="width:7%" />
							<col style="width:7%" />
							<col style="width:7%" />
							<col style="width:7%" />
							<col style="width:7%" />
							<col style="width:7%" />
						</colgroup>
						<thead>
						<tr>
							<th>1</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="qna" items="${list}">
						<tr>
								<td>1</td>
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
						<a href="${pageContext.request.contextPath}/intrBrd/intr_brd_gal_reg" class="btnTxt btnTxt_normal btnTxt_gray"><span>등록</span></a>
					</div> <!-- //boardType01_list_btn -->
				</div> <!-- //boardType01_wrap -->
				
			</div> <!-- //subcontent -->
		</div> <!-- //subcontent_inner -->
	</div> <!-- //subcontent_wrap -->
	
</div> <!-- //content -->
