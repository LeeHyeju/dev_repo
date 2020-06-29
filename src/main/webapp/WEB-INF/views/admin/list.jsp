<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<script>

</script>

<div id="contentarea" class="l-content">
	<div class="breadcrumb">
		<a href="${pageContext.request.contextPath}/main"><span class="path_home">Home</span></a><a href="${pageContext.request.contextPath}/board/"><span>게시판관리</span></a><span>게시물관리</span><span class="path_current">${boardManage.boardName}</span>
	</div> <!-- //breadcrumb -->
	<div class="subcontent_wrap">
		<div class="subcontent_inner">
			<div class="subcontent">
				
				<div class="subcontent_title_wrap">
					<h3 class="subcontent_title">관 리 자 관 리</h3>
					<p class="subcontent_desc">.</p>
				</div> <!-- //subcontent_title_wrap -->
						
				<div class="boardType01_wrap">
					<form id="searchFrm" action="<c:url value='/admin/list'/>" method="get">
						<fieldset>
							<legend>게시판 검색폼</legend>
							<div class="boardType01_search">
								<select name="searchType" id="searchType" class="boardType01_search_select">
							      <option value="all"<c:out value="${searchType == all ? 'selected' : ''}"/>>---전체---</option>
							      <option value="admId"<c:out value="${searchType eq 'admId' ? 'selected' : ''}"/>>아이디</option>
							      <option value="nm"<c:out value="${searchType eq 'nm' ? 'selected' : ''}"/>>이름</option>
							      <option value="authCd"<c:out value="${searchType eq 'authCd' ? 'selected' : ''}"/>>그룹코드</option>
							      <option value="useYn"<c:out value="${scri.searchType eq 'useYn' ? 'selected' : ''}"/>>사용유무</option>
							    </select>
								<input type="text" name="keyword" id="keyword" class="boardType01_search_input" value="${keyword}"/><button type="submit">
								<img src="${pageContext.request.contextPath}/resources/admin/img/common/btn_search_gray.gif" alt="검색" /></button>
								 
							</div> <!-- //boardType01_search -->
						</fieldset>
					</form>
					
					<span class="boardType01_info_top">총 <strong>${map.count}</strong>개의 게시물이 있습니다.</span>
				
					<c:set var="cols" value="5"/>
					<table id="boardTable" class="boardType01_tblList" cellspacing="0">
						<caption><span class="t-hidden"> 게시판</span></caption>
						<colgroup>
							<col style="width:10%" />
							<col style="width:7%" />
							<col style="width:7%" />
							<col style="width:14%" />
							<col style="width:12%" />
							<col style="width:8%" />
							<col style="width:8%" />
							<col style="width:8%" />
							<col style="width:8%" />
							<col style="width:8%" />
						</colgroup>
						<thead>
							<tr>
								<th>아이디</th>
								<th>이름</th>
								<th>권한코드</th>
								<th>연락처</th>
								<th>이메일</th>
								<th>등록자</th>
								<th>등록일</th>
								<th>사용유무</th>
								<th>삭제유무</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="admin" items="${map.list}" varStatus="loop">
								<tr>
									<td><a href="/admin/view?admId=${admin.admId}">${admin.admId}</a></td>
									<td>${admin.nm}</td>
									<td>${admin.authCd}</td>
									<td>${admin.tel}</td>
									<td>${admin.email}</td>
									<td class="t-gray">${admin.regId}</td>
									<td><fmt:formatDate value="${admin.regDt}" pattern="yyyy.MM.dd"/></td>
									<td>${admin.useYn}</td>
									<td>${admin.delYn}</td>
								</tr>
					     	</c:forEach>
					     	<c:if test="${empty map.list}">
								<tr>
									<td colspan="11" class="no-data">게시물이 없습니다.</td>
								</tr>
							</c:if>
						</tbody>
					</table> <!-- //boardType01_tblList -->
					
									
					<div class="pagination">
						<a href="/admin/list${pageMaker.makeQuery(pageMaker.startPage)}" class="first">시작</a>
						  <ul style="display: inline-block;">
						    <c:if test="${pageMaker.prev}">
						    	<li style="display: inline-block;"><a href="/admin/list${pageMaker.makeQuery(pageMaker.startPage - 1)}" class="prev">이전</a></li>
						    </c:if> 
						
						    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						    	<li style="display: inline-block;"><a href="/admin/list${pageMaker.makeQuery(idx)}">${idx}</a></li>
						    </c:forEach>
						
						    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						    	<li style="display: inline-block;"><a href="/admin/list${pageMaker.makeQuery(pageMaker.endPage + 1)}" class="next">다음</a></li>
						    </c:if>
						  </ul>
						<a href="/admin/list${pageMaker.makeQuery(pageMaker.endPage)}" class="last">마지막</a>
					</div>
					<div class="boardType01_list_btn">
						<a href="${pageContext.request.contextPath}/admin/insert" class="btnTxt btnTxt_normal btnTxt_gray"><span>등록</span></a>
					</div> <!-- //boardType01_list_btn -->
				</div> <!-- //boardType01_wrap -->
				
			</div> <!-- //subcontent -->
		</div> <!-- //subcontent_inner -->
	</div> <!-- //subcontent_wrap -->
	
</div> <!-- //content -->
