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
		<a href="${pageContext.request.contextPath}/main"><span class="path_home">Home</span></a><a href="${pageContext.request.contextPath}/auth/list"><span>권한관리</span></a><span>권한관리 리스트</span><span class="path_current">${boardManage.boardName}</span>
	</div> <!-- //breadcrumb -->
	<div class="subcontent_wrap">
		<div class="subcontent_inner">
			<div class="subcontent">
				
				<div class="subcontent_title_wrap">
					<h3 class="subcontent_title">권 한 관 리</h3>
					<p class="subcontent_desc">.</p>
				</div> <!-- //subcontent_title_wrap -->
						
				<div class="boardType01_wrap">
					<form id="searchFrm" action="<c:url value='/auth/list'/>" method="get">
						<fieldset>
							<legend>게시판 검색폼</legend>
							<div class="boardType01_search">
								<select name="searchType" id="searchType" class="boardType01_search_select">
							      <option value="all"<c:out value="${searchType == all ? 'selected' : ''}"/>>---전체---</option>
							      <option value="authCd"<c:out value="${searchType eq 'authCd' ? 'selected' : ''}"/>>권한코드</option>
							      <option value="authNm"<c:out value="${searchType eq 'authNm' ? 'selected' : ''}"/>>권한이름</option>
							    </select>
								<input type="text" name="keyword" id="keyword" class="boardType01_search_input" value="${keyword}"/><button type="submit">
								<img src="${pageContext.request.contextPath}/resources/admin/img/common/btn_search_gray.gif" alt="검색" /></button>
							</div> <!-- //boardType01_search -->
						</fieldset>
					</form>
					
					<span class="boardType01_info_top">총 <strong>${count}</strong>개의 게시물이 있습니다.</span>
					
					<c:set var="cols" value="5"/>
					<table id="boardTable" class="boardType01_tblList" cellspacing="0">
						<caption><span class="t-hidden">권한코드 게시판</span></caption>
						<colgroup>
							<col style="width:7%" />
							<col style="width:7%" />
							<col style="width:7%" />
							<col style="width:8%" />
							<col style="width:15%" />
						</colgroup>
						<thead>
							<tr>
								<th>권한코드</th>
								<th>권한이름</th>
								<th>작성자</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="auth" items="${list}">
								<tr class="hover">
									<td>${auth.authCd}</td>
									<td><a href="/auth/view?admId=${auth.authCd}">${auth.authNm}</a></td>
									<td class="t-gray">${auth.regId}</td>
									<td><fmt:formatDate value="${auth.regDt}" pattern="yyyy.MM.dd"/></td>
								</tr>
					     	</c:forEach>
					     	<c:if test="${empty list}">
								<tr>
									<td colspan="4" class="no-data">게시물이 없습니다.</td>
								</tr>
							</c:if>
						</tbody>
					</table> <!-- //boardType01_tblList -->
					
					<div class="pagination">
						<a href="/auth/list${pageMaker.makeQuery(pageMaker.startPage)}" class="first">시작</a>
						  <ul style="display: inline-block;">
						    <c:if test="${pageMaker.prev}">
						    	<li style="display: inline-block;"><a href="/auth/list${pageMaker.makeQuery(pageMaker.startPage - 1)}" class="prev">이전</a></li>
						    </c:if> 
						
						    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						    	<li style="display: inline-block;"><a href="/auth/list${pageMaker.makeQuery(idx)}">${idx}</a></li>
						    </c:forEach>
						
						    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						    	<li style="display: inline-block;"><a href="/auth/list${pageMaker.makeQuery(pageMaker.endPage + 1)}" class="next">다음</a></li>
						    </c:if>
						  </ul>
						<a href="/auth/list${pageMaker.makeQuery(pageMaker.endPage)}" class="last">마지막</a>
					</div>
					<div class="boardType01_list_btn">
						<a href="${pageContext.request.contextPath}/auth/insert" class="btnTxt btnTxt_normal btnTxt_gray"><span>등록</span></a>
					</div> <!-- //boardType01_list_btn -->
				</div> <!-- //boardType01_wrap -->
				
			</div> <!-- //subcontent -->
		</div> <!-- //subcontent_inner -->
	</div> <!-- //subcontent_wrap -->
	
</div> <!-- //content -->
