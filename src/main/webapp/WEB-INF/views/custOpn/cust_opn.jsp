<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
/*초기화*/
function fnReset(){
	document.getElementById("brdType").value = "";
	document.getElementById("stsCd").value = "";
	document.getElementById("regNm").value = "";
	document.getElementById("brdTl").value = "";
	document.getElementById("regNo").value = "";
	document.getElementById("brdCont").value = "";
	document.getElementById("regChnl").value = "";
	document.getElementById("mngmNm").value = "";
	document.getElementById("regDt").value = "";
}
/*검색*/
function fnSrch(){
	var form = document.getElementById("writeForm");
    form.method = "get";
    form.action = "<c:url value='/custOpn/cust_opn'/>";
    form.submit();
}
</script>
<style type="text/css">
	.li {list-style:none; float:left; padding:6px;}
	.notiTr {text-overflow:ellipsis; overflow:hidden;}
</style>
<div id="contentarea" class="l-content">
	<div class="breadcrumb">
		<a href="${pageContext.request.contextPath}/main"><span class="path_home">Home</span></a>
		<a href="${pageContext.request.contextPath}/custOpn/"><span>게시판 관리</span></a>
		<span>고객문의</span><span class="path_current">${boardManage.boardName}</span>
	</div> <!-- //breadcrumb -->
	<div class="subcontent_wrap">
		<div class="subcontent_inner">
			<div class="subcontent">
				
				<div class="subcontent_title_wrap">
					<h3 class="subcontent_title">고 객 문 의</h3>
					<p class="subcontent_desc"></p>
				</div> <!-- //subcontent_title_wrap -->
						
				<div class="boardType01_wrap">
				<form name="writeForm" id="writeForm">
					<table id="boardTable1" class="boardType01_tblList">
						<caption><span class="t-hidden">검색</span></caption>
						<colgroup>
							<col style="width:10%"/>
							<col style="width:20%"/>
							<col style="width:10%"/>
							<col style="width:20%"/>
						</colgroup>
						<tbody>
						<tr>
							<th>유형</th>
							<td>
								<select id="brdType" name="brdType" style="width:100px;">
									<option value="">전체</option>
								    <option value="제안">제안</option>
								    <option value="칭찬">칭찬</option>
								    <option value="불만">불만</option>
								    <option value="문의">문의</option>
								    <option value="요청">요청</option>
								    <option value="기타">기타</option>
								</select>
							</td>
							<th>상태</th>
							<td>
								<select id="stsCd" name="stsCd" style="width:100px;">
									<option value="">전체</option>
								    <option value="대기중">대기중</option>
								    <option value="검토중">검토중</option>
								    <option value="답변완료">답변완료</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>접수자명</th>
							<td><input type="text" id="regNm" name="regNm"></td>
							<th>제목</th>
							<td><input type="text" id="brdTl" name="brdTl"></td>
						</tr>
						<tr>
							<th>접수번호</th>
							<td><input type="text" id="regNo" name="regNo"></td>
							<th>내용</th>
							<td><input type="text" id="brdCont" name="brdCont"></td>
						</tr>
						<tr>
							<th>접수채널</th>
							<td>
								<select id="regChnl" name="regChnl" style="width:100px;">
									<option value="">전체</option>
								    <option value="HOM">홈페이지</option>
								    <option value="WEB">모바일웹</option>
								    <option value="APP">모바일앱</option>
								</select>
							</td>
							<th>처리자</th>
							<td>
								<select id="mngmNm" name="mngmNm" style="width:100px;">
									<option value="">전체</option>
								    <option value="주관부서">주관부서</option>
								    <option value="처리부서">처리부서</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>등록일</th>
							<td colspan="3">regDt</td>
						</tr>
						</tbody>
					</table> <!-- //boardType01_tblList -->
					
					<div class="boardType01_write_btn">
						<button type="button" onClick='fnReset()' id="btnReset" class="btnTxt btnTxt_normal btnTxt_gray">초기화</button>
						<button type="submit" onClick='fnSrch()' id="btnSrch" class="btnTxt btnTxt_normal btnTxt_gray">검색</button>
					</div>
				
					
					<c:set var="cols" value="6"/>
					<table id="boardTable1" class="boardType01_tblList" style=TABLE-layout:fixed>
						<caption><span class="t-hidden">필독/공지</span></caption>
						<colgroup>
							<col style="width:3%"/>
							<col style="width:7%"/>
							<col style="width:8%"/>
							<col style="width:15%"/>
							<col style="width:10%"/>
							<col style="width:8%"/>
							<col style="width:10%"/>
							<col style="width:8%"/>
							<col style="width:8%"/>
							<col style="width:8%"/>
						</colgroup>
						<thead>
						<tr>
							<th></th>
							<th>접수번호</th>
							<th>유형</th>
							<th>제목</th>
							<th>작성자</th>
							<th>등록일</th>
							<th>처리일</th>
							<th>처리자</th>
							<th>진행상태</th>
							<th>접수채널</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="custOpn" items="${list}">
							<tr class="hover">
								<td>${custOpn.rNum}</td>
								<td>${custOpn.regNo}</td>
								<td>${custOpn.brdType}</td>
								<td><a href="/custOpn/cust_opn_dtl?regNo=${custOpn.regNo}">${custOpn.brdTl}</a></td>
								<td>${custOpn.regId}</td>
								<td><fmt:formatDate value="${custOpn.regDt}" pattern="yyyy.MM.dd"/></td>
								<td><fmt:formatDate value="${custOpn.mngmDt}" pattern="yyyy.MM.dd"/></td>
								<td>${custOpn.mngmNm}</td>
								<td>${custOpn.stsCd}</td>
								<td>${custOpn.regChnl}</td>
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
					    	<li class="li"><a href="cust_opn${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
					    </c:if> 
					    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					    	<li class="li"><a href="cust_opn${pageMaker.makeQuery(idx)}">${idx}</a></li>
					    </c:forEach>
					    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					    	<li class="li"><a href="cust_opn${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
					    </c:if> 
					  </ul>
					</div>
	
					<div class="boardType01_list_btn">
						<a href="${pageContext.request.contextPath}/custOpn/cust_opn_reg" class="btnTxt btnTxt_normal btnTxt_gray"><span>등록</span></a>
					</div> <!-- //boardType01_list_btn -->
				</form>
				</div> <!-- //boardType01_wrap -->
			</div> <!-- //subcontent -->
		</div> <!-- //subcontent_inner -->
	</div> <!-- //subcontent_wrap -->
	
</div> <!-- //content -->
