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
					<form id="searchFrm" action="" method="get">
						<fieldset>
							<legend>게시판 검색폼</legend>
							<div class="boardType01_search">
								<select name="sKeycon" id="sKeycon" class="boardType01_search_select">
									<option value="">제목+내용</option>
								</select>
								<input type="hidden" name="boardCode" id="boardCode" value=" "/>
								<input type="text" name="sKeyword" id="sKeyword" class="boardType01_search_input" value="" /><button type="submit"><img src="${pageContext.request.contextPath}/resources/admin/img/common/btn_search_gray.gif" alt="검색" /></button>
							</div> <!-- //boardType01_search -->
						</fieldset>
					</form>
					
					<span class="boardType01_info_top">총 <strong>1</strong>개의 게시물이 있습니다.</span>
					
					<c:set var="cols" value="5"/>
					<table id="boardTable" class="boardType01_tblList" cellspacing="0">
						<caption><span class="t-hidden">X 게시판</span></caption>
						<colgroup>
							<col style="width:7%" />
							<col style="width:7%" />
							<col style="width:7%" />
							<col style="width:12%" />
							<col style="width:12%" />
							<col style="width:15%" />
							<col style="width:8%" />
							<col style="width:10%" />
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
							<th>삭제유무</th>
							<th>사용유무</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="admin" items="${list}">
						<tr>
								<td><a href="/admin/view?admId=${admin.admId}">${admin.admId}</a></td>
								<td>${admin.nm}</td>
								<td>${admin.authCd}</td>
								<td>${admin.tel}</td>
								<td>${admin.email}</td>
								<td class="t-gray">${admin.regId}</td>
								<td><fmt:formatDate value="${admin.regDt}" pattern="yyyy.MM.dd"/></td>
								<td>${admin.delYn}</td>
								<td>${admin.useYn}</td>
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
						<a href="${pageContext.request.contextPath}/admin/insert" class="btnTxt btnTxt_normal btnTxt_gray"><span>등록</span></a>
					</div> <!-- //boardType01_list_btn -->
				</div> <!-- //boardType01_wrap -->
				
			</div> <!-- //subcontent -->
		</div> <!-- //subcontent_inner -->
	</div> <!-- //subcontent_wrap -->
	
</div> <!-- //content -->
