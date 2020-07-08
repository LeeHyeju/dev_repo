<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<div id="contentarea" class="l-content">
	<div class="breadcrumb">
		<a href="${pageContext.request.contextPath}/main"><span class="path_home">Home</span></a><a href="${pageContext.request.contextPath}/contents/list"><span>컨텐츠관리</span></a><span>컨텐츠관리 리스트</span><span class="path_current">${boardManage.boardName}</span>
	</div> <!-- //breadcrumb -->
	<div class="subcontent_wrap">
		<div class="subcontent_inner">
			<div class="subcontent">
				
				<div class="subcontent_title_wrap">
					<h3 class="subcontent_title">컨 텐 츠 관 리</h3>
					<p class="subcontent_desc">.</p>
				</div> <!-- //subcontent_title_wrap -->
						
				<div class="boardType01_wrap">
					<form id="contFrm" action="<c:url value='/contents/list'/>" method="get">
						<fieldset>
							<legend>게시판 검색폼</legend>
							<div class="boardType01_search">
								<select name="searchType" id="searchType" class="boardType01_search_select">
							      <option value="all"<c:out value="${searchType == all ? 'selected' : ''}"/>>---전체---</option>
							      <option value="contCd"<c:out value="${searchType eq 'contCd' ? 'selected' : ''}"/>>컨텐츠코드</option>
							      <option value="contNm"<c:out value="${searchType eq 'contNm' ? 'selected' : ''}"/>>컨텐츠이름</option>
							      <option value="contents"<c:out value="${searchType eq 'contents' ? 'selected' : ''}"/>>내용</option>
							    </select>
								<input type="text" name="keyword" id="keyword" class="boardType01_search_input" value="${keyword}"/><button type="submit">
								<img src="${pageContext.request.contextPath}/resources/admin/img/common/btn_search_gray.gif" alt="검색" /></button>
								 
							</div> <!-- //boardType01_search -->
						</fieldset>
					</form>
					
					<span class="boardType01_info_top">총 <strong>${count}</strong>개의 게시물이 있습니다.</span>
				
					<c:set var="cols" value="5"/>
					<table id="boardTable" class="boardType01_tblList" cellspacing="0" style=TABLE-layout:fixed>
						<caption><span class="t-hidden"> 게시판</span></caption>
						<colgroup>
							<col style="width:5%" />
							<col style="width:6%" />
							<col style="width:10%" />
							<col style="width:7%" />
							<col style="width:7%" />
							<col style="width:15%" />
							<col style="width:7%" />
							<col style="width:7%" />
						</colgroup>
						<thead>
							<tr>
								<th>No.</th>
								<th>코드</th>
								<th>컨텐츠명</th>
								<th>스타일</th>
								<th>스크립트</th>
								<th>내용</th>
								<th>등록자</th>
								<th>등록일자</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="contents" items="${list}" varStatus="loop">
								<tr class="hover">
									<td>${contents.contIdx}</td>
									<td>${contents.contCd}</td>
									<td><a href="/contents/view?contIdx=${contents.contIdx}">${contents.contNm}</a></td>
									<td>${empty contents.contStyle? 'N' : 'Y'}</td>
									<td>${empty contents.contScript? 'N' : 'Y'}</td>
									<td style="text-overflow : ellipsis;overflow : hidden;"><nobr>${contents.contents}</nobr></td>
									<td class="t-gray">${contents.regId}</td>
									<td><fmt:formatDate value="${contents.regDt}" pattern="yyyy.MM.dd"/></td>
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
						<a href="/contents/list${pageMaker.makeQuery(pageMaker.startPage)}" class="first">시작</a>
						  <ul style="display: inline-block;">
						    <c:if test="${pageMaker.prev}">
						    	<li style="display: inline-block;"><a href="/contents/list${pageMaker.makeQuery(pageMaker.startPage - 1)}" class="prev">이전</a></li>
						    </c:if> 
						
						    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						    	<li style="display: inline-block;"><a href="/contents/list${pageMaker.makeQuery(idx)}">${idx}</a></li>
						    </c:forEach>
						
						    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						    	<li style="display: inline-block;"><a href="/contents/list${pageMaker.makeQuery(pageMaker.endPage + 1)}" class="next">다음</a></li>
						    </c:if>
						  </ul>
						<a href="/contents/list${pageMaker.makeQuery(pageMaker.endPage)}" class="last">마지막</a>
					</div>
					<div class="boardType01_list_btn">
						<a href="${pageContext.request.contextPath}/contents/insert" class="btnTxt btnTxt_normal btnTxt_gray"><span>등록</span></a>
					</div> <!-- //boardType01_list_btn -->
				</div> <!-- //boardType01_wrap -->
				
			</div> <!-- //subcontent -->
		</div> <!-- //subcontent_inner -->
	</div> <!-- //subcontent_wrap -->
	
</div> <!-- //content -->
