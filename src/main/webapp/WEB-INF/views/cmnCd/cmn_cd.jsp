<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<script>
/*초기화*/
function fnReset(){
	 submit('cmn_cd');
}
/*검색*/
function fnSrch(){
	 submit('search');
}
/*편집*/
function fnEdit(edit, rNum){
	var editN = document.getElementById("editN["+rNum+"]");
	var editY = document.getElementById("editY["+rNum+"]");
	editN.style.display = 'none';
	editY.style.display = 'none';
	
	if(edit == 'N') {
		// 편집
		document.getElementById("editY["+rNum+"]").style.display = 'contents';
	} else {
		// 저장
		editN.style.display = 'contents';
// 		edit.cells[1].innerHTML;
// 		submit('editSave');
	}
}
/*그룹코드 행 클릭*/
function fnClick(groCd){
	var x = request.getParameter("groCd");
// 	var y = jQuery.url.param("param_in_url");
// 	alert(y);
    document.getElementById("groCd").value = groCd; 
    submit('click');
}

function submit(service){
	var form = document.getElementById("viewFrm");
    form.method = "get";
    form.action = "<c:url value='/cmnCd/" + service + "'/>";
    form.submit();
}
</script>

<style type="text/css">
	.li1 {list-style: none; float: left; padding: 6px;}
	.hover:hover {background-color:#f5f5f5;}
	.border {border-style: hidden};
</style>
<div id="contentarea" class="l-content">
	<div class="breadcrumb">
		<a href="${pageContext.request.contextPath}/main"><span class="path_home">Home</span></a>
		<a href="${pageContext.request.contextPath}/cmnCd/"><span>공통관리</span></a>
		<span>공통코드관리</span><span class="path_current">${boardManage.boardName}</span>
	</div> <!-- //breadcrumb -->
	
	<div class="subcontent_wrap">
		<div class="subcontent_inner">
			<div class="subcontent">
				
				<div class="subcontent_title_wrap">
					<h3 class="subcontent_title">공 통 코 드 관 리</h3>
					<p class="subcontent_desc"></p>
				</div> <!-- //subcontent_title_wrap -->
						
				<form name="viewFrm" id="viewFrm">
				<div class="boardType01_wrap">
					<div>
						<table id="boardTable1" class="boardType01_tblList">
							<caption><span class="t-hidden">검색</span></caption>
							<colgroup>
								<col style="width:10%"/>
								<col style="width:10%"/>
								<col style="width:10%"/>
								<col style="width:10%"/>
							</colgroup>
							<tbody>
							<tr>
								<th>그룹명</th>
								<td><input type="text" id="groNm" name="groNm"></td>
								<th>그룹코드</th>
								<td><input type="text" id="groCd" name="groCd"></td>
							</tr>
							<tr>
								<th>코드명</th>
								<td><input type="text" id="cmnNm" name="cmnNm"></td>
								<th>코드</th>
								<td><input type="text" id="cmnCd" name="cmnCd"></td>
							</tr>
							<tr>
								<th>사용여부</th>
								<td>
									<select id="useYn" name="useYn">
									    <option value="Y">사용</option>
									    <option value="N">미사용</option>
									</select>
								</td>
								<th></th>
								<td></td>
							</tr>
							</tbody>
						</table> <!-- //boardType01_tblList -->
						
						<div class="boardType01_write_btn">
							<button type="button" onClick='fnReset()' id="btnReset" class="btnTxt btnTxt_normal btnTxt_gray">초기화</button>
							<button type="submit" onClick='fnSrch()' id="btnSrch" class="btnTxt btnTxt_normal btnTxt_gray">검색</button>
						</div>
						
					</div>

					<div style="padding:5px 0px 15px 0px;">
						<div style="float:left; height:490px;">
							<div style="height:480px;">
								<span class="boardType01_info_top">
									총 <strong><c:out value="${count}"></c:out></strong>개의 게시물이 있습니다.
								</span>
								
								<table id="boardTable2" class="boardType01_tblList" style="width:250px;">
									<caption><span class="t-hidden">그룹코드</span></caption>
									<colgroup>
										<col style="width:2%"/>
										<col style="width:7%"/>
										<col style="width:7%"/>
									</colgroup>
									<thead>
									<tr>
										<th></th>
										<th>그룹코드</th>
										<th>그룹명</th>
									</tr>
									</thead>
									<tbody>
									<c:forEach var="cmnCd" items="${list}">
									<tr class="hover" onClick='fnClick("${cmnCd.groCd}")'>
											<td>${cmnCd.rNum}</td>
											<td>${cmnCd.groCd}</td>
											<td>${cmnCd.groNm}</td>
									</tr>
							     	</c:forEach>
							     	<c:if test="${empty list}">
									<tr>
										<td colspan="10" class="no-data">게시물이 없습니다.</td>
									</tr>
									</c:if>
									</tbody>
								</table> <!-- //boardType01_tblList -->
							</div>
						
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
							
						</div>
						<div style="float:right;width:480px; height:490px;">
							<span class="boardType01_info_top">
								총 <strong><c:out value="${subCount}"></c:out></strong>개의 게시물이 있습니다.
							</span>
							<table id="boardTable3" class="boardType01_tblList">
								<caption><span class="t-hidden">코드</span></caption>
								<colgroup>
									<col style="width:2%"/>
									<col style="width:7%"/>
									<col style="width:7%"/>
									<col style="width:7%"/>
									<col style="width:7%"/>
									<col style="width:7%"/>
								</colgroup>
								<thead>
								<tr>
									<th></th>
									<th>코드</th>
									<th>코드명</th>
									<th>정렬순서</th>
									<th>사용여부</th>
									<th>편집</th>
								</tr>
								</thead>
								<tbody>
								<c:forEach var="cmnCd" items="${subList}">
								<tr id="editN[${cmnCd.rNum}]">
										<td>${cmnCd.rNum}</td>
										<td>${cmnCd.cmnCd}</td>
										<td>${cmnCd.cmnNm}</td>
										<td>${cmnCd.arayOrde}</td>
										<td>${cmnCd.useYn}</td>
										<td><button type="button" onClick='fnEdit("N",${cmnCd.rNum})' id="btnEditN" class="btnTxt btnTxt_small btnTxt_gray">편집</button></td>
								</tr>
								<tr id="editY[${cmnCd.rNum}]" style="display:none;">
										<td>${cmnCd.rNum}</td>
										<td><input type="text" style="width:80px;" id="cmnCd" value="${cmnCd.cmnCd}"/></td>
										<td><input type="text" style="width:80px;" id="cmnNm" value="${cmnCd.cmnNm}"/></td>
										<td><input type="text" style="width:80px;" id="arayOrde" value="${cmnCd.arayOrde}"/></td>
										<td><input type="text" style="width:80px;" id="useYn" value="${cmnCd.useYn}"/></td>
										<td><button type="button" onClick='fnEdit("Y",${cmnCd.rNum})' id="btnEditY" class="btnTxt btnTxt_small btnTxt_gray">저장</button></td>
								</tr>
						     	</c:forEach>
						     	<c:if test="${empty subList}">
								<tr>
									<td colspan="10" class="no-data">게시물이 없습니다.</td>
								</tr>
								</c:if>
								</tbody>
							</table> <!-- //boardType01_tblList -->
						</div>		
					</div>
					
					<div class="boardType01_write_btn" style="clear:both">
						<a href="${pageContext.request.contextPath}/cmnCd/insert" class="btnTxt btnTxt_normal btnTxt_gray"><span>등록</span></a>
					</div> <!-- //boardType01_list_btn -->	
				</div> <!-- //boardType01_wrap -->
		
				</form>
				
			</div> <!-- //subcontent -->
		</div> <!-- //subcontent_inner -->
	</div> <!-- //subcontent_wrap -->
	
</div> <!-- //content -->
