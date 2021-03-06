<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
$(document).ready(function(){
	var notiChk = ${notiChk};
	if(notiChk == true){
		$("input:checkbox[id='notiChk']").prop("checked", true);
	}
	
	var perPageNum = ${perPageNum};
	$("#perPageNum").val(perPageNum).prop("selected", true);
});
/*검색 & 게시물 보여지는 개수 선택*/
function fnSrch(){
	var form = document.getElementById("srchForm");
    form.method = "get";
    form.action = "<c:url value='/intrBrd/intr_brd_noti'/>";
    form.submit();
}
/*공지 숨기기 선택*/
function fnNotiClick(length) {
	var style;
	if(document.getElementById("notiChk").checked == true){
		style = 'none';
	}else{
		style = '';
	}
	
	for(i=1;i<=length;i++){
		document.getElementById("trNoti["+i+"]").style.display = style;
	}
}
</script>
<style type="text/css">
	.li {list-style:none; float:left; padding:6px;}
	.notiTr {text-overflow:ellipsis; overflow:hidden;}
</style>
<div id="contentarea" class="l-content">
	<div class="breadcrumb">
		<a href="${pageContext.request.contextPath}/main"><span class="path_home">Home</span></a>
		<a href="${pageContext.request.contextPath}/intrBrd/intr_brd"><span>게시판관리</span></a>
		<span>${brd.brdNm}</span><span class="path_current">${boardManage.boardName}</span>
	</div> <!-- //breadcrumb -->
	<div class="subcontent_wrap">
		<div class="subcontent_inner">
			<div class="subcontent">
				
				<div class="subcontent_title_wrap">
					<h3 class="subcontent_title">${brd.brdNm}</h3>
					<p class="subcontent_desc"></p>
				</div> <!-- //subcontent_title_wrap -->
						
				<div class="boardType01_wrap">
					<form id="srchForm" name="srchForm">
						<fieldset> <legend>게시판 검색폼</legend>
							<div class="boardType01_search">
							<c:if test="${brd.srchYn == 'Y'}">
								<select name="srchPeriod" id="srchPeriod" class="boardType01_search_select">
									<option value="0">전체기간</option>
									<option value="1d">1일</option>
									<option value="1w">1주</option>
									<option value="1m">1개월</option>
									<option value="6m">6개월</option>
									<option value="1y">1년</option>
								</select>
								<select name="srchKey" id="srchKey" class="boardType01_search_select">
									<option value="t">제목</option>
									<option value="c">내용</option>
									<option value="tc">제목+내용</option>
									<option value="w">작성자</option>
								</select>
								<input type="text" name="srchCont" id="srchCont" class="boardType01_search_input"/>
								<button type="submit" onClick='fnSrch()'><img src="${pageContext.request.contextPath}/resources/admin/img/common/btn_search_gray.gif" alt="검색" /></button>
							</c:if>
							</div> <!-- //boardType01_search -->
						</fieldset>
					
						<span class="boardType01_info_top">총 <strong>${postListCount}</strong>개의 게시물이 있습니다.</span>
						
						<div style="float:right;">
							<c:if test="${brd.notiYn == 'Y'}">
								<input type="checkbox" name="notiChk" id="notiChk" onClick="fnNotiClick(${fn:length(notiList)})"/>
		  						<label for="notiChk" style="padding-right: 15px">공지 숨기기</label>
	  						</c:if>
	  						<c:if test="${brd.pageYn == 'Y'}">
		  						<select name="perPageNum" id="perPageNum" onChange='fnSrch()' class="boardType01_search_select">
									<option value="5">5개씩</option>
									<option value="10">10개씩</option>
									<option value="15">15개씩</option>
									<option value="20">20개씩</option>
								</select>
							</c:if>
						</div>
					</form>
					<c:set var="cols" value="8"/>
					<table id="boardTable1" class="boardType01_tblList" style=TABLE-layout:fixed>
						<caption><span class="t-hidden">필독/공지</span></caption>
						<colgroup>
							<col style="width:4%"/>
							<col style="width:15%"/>
							<col style="width:10%"/>
							<col style="width:5%"/>
							<col style="width:5%"/>
							<col style="width:7%"/>
							<col style="width:5%"/>
						</colgroup>
						<thead>
						<tr>
							<th></th>
							<th>제목</th>
							<th>내용</th>
							<th>사용여부</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="noti" items="${notiList}">
							<tr id="trNoti[${noti.rNum}]" class="hover" style="display:${notiChk == false ? '' : 'none'};">
								<td>${noti.brdTypeNm}</td>
								<td style="text-overflow : ellipsis;overflow : hidden;"><a href="/intrBrd/intr_brd_noti_dtl?brdCd=${noti.brdCd}&hit=${noti.hit}&regId=${noti.regId}"><nobr>${noti.brdTl}</nobr></a></td>
								<td style="text-overflow : ellipsis;overflow : hidden;"><nobr>${noti.brdCont}</nobr></td>
								<td>${noti.useYn}</td>
								<td class="t-gray">${noti.regId}</td>
								<td><fmt:formatDate value="${noti.regDt}" pattern="yyyy.MM.dd"/></td>
								<td>${noti.hit}</td>
							</tr>
				     	</c:forEach>
						
						<c:forEach var="post" items="${postList}">
							<tr class="hover">
								<td>${post.rNum}</td>
								<td style="text-overflow : ellipsis;overflow : hidden;"><a href="/intrBrd/intr_brd_noti_dtl?brdCd=${post.brdCd}&hit=${post.hit}&regId=${post.regId}"><nobr>${post.brdTl}</nobr></a></td>
								<td style="text-overflow : ellipsis;overflow : hidden;"><nobr>${post.brdCont}</nobr></td>
								<td>${post.useYn}</td>
								<td class="t-gray">${post.regId}</td>
								<td><fmt:formatDate value="${post.regDt}" pattern="yyyy.MM.dd"/></td>
								<td>${post.hit}</td>
							</tr>
				     	</c:forEach>
				     	<c:if test="${empty postList}">
						<tr>
							<td colspan="8" class="no-data">게시물이 없습니다.</td>
						</tr>
						</c:if>
						</tbody>
					</table> <!-- //boardType01_tblList -->
					
					<div class="pagination">
					  <ul>
					    <c:if test="${pageMaker.prev}">
					    	<li class="li"><a href="intr_brd_noti${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
					    </c:if> 
					    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					    	<li class="li"><a href="intr_brd_noti${pageMaker.makeQuery(idx)}">${idx}</a></li>
					    </c:forEach>
					    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					    	<li class="li"><a href="intr_brd_noti${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
					    </c:if> 
					  </ul>
					</div>
	
					<div class="boardType01_list_btn">
						<a href="${pageContext.request.contextPath}/intrBrd/intr_brd_noti_reg?regId=${sessionScope.admin.admId}" class="btnTxt btnTxt_normal btnTxt_gray"><span>등록</span></a>
					</div> <!-- //boardType01_list_btn -->
				</div> <!-- //boardType01_wrap -->
				
			</div> <!-- //subcontent -->
		</div> <!-- //subcontent_inner -->
	</div> <!-- //subcontent_wrap -->
	
</div> <!-- //content -->
