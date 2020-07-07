<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<script>
/*초기화*/
function fnReset(){
	document.getElementById("keyGroCd").value = "";
	document.getElementById("keyGroNm").value = "";
	document.getElementById("keyCmnCd").value = "";
	document.getElementById("keyCmnNm").value = "";
	document.getElementById("keyUseYn").value = "";
}
/*검색*/
function fnSrch(){
	submit('cmn_cd');
}
/*그룹코드 선택*/
function fnClick(groCd){
	document.getElementById("groCd").value = groCd;
	getParams();
	submit('click');
}
function getParams() {
	// 현재 URL
    var url = document.location.href;
    // 파라미터가 담길 배열
    var param = new Array();
    
    if(url.indexOf('?') != -1){
	    // url에서 '?' 문자 이후의 파라미터 문자열까지 자르기
	    var params = url.substring(url.indexOf('?')+1, url.length);
	    // 파라미터 구분자("&") 로 분리
	    params = params.split("&");
	    // params 배열을 다시 "=" 구분자로 분리하여 param 배열에 key = value 로 담는다.
	    var key, value;
	    for(var i=0 ; i < params.length-1 ; i++) {
	        key = params[i].split("=")[0];
	        value = params[i].split("=")[1];

	        if(key == 'page'){
	        	document.getElementById(key).value = "${page}";
	        }
	        
	        if(key != 'perPageNum' && key != 'page'){
	        	document.getElementById(key).value = value;
	        }
	    }
    }
    return param;
}
/*편집*/
function fnEdit(edit, rNum){
	const queryString = window.location.search;
	const urlParams = new URLSearchParams(queryString);
	const param = urlParams.get('groCd');
    document.getElementById("keyGroCd").value = param;

	var editN = document.getElementById("editN["+rNum+"]");
	var editY = document.getElementById("editY["+rNum+"]");
	editN.style.display = 'none';
	editY.style.display = 'none';
	
	if(edit == 'N') {
		// 편집
		editY.style.display = '';
	} else {
		if(document.getElementById("cmnNm["+rNum+"]").value == ""
		|| document.getElementById("arayOrde["+rNum+"]").value == ""
		|| document.getElementById("useYn["+rNum+"]").value == ""){
			editY.style.display = 'contents';
			alert("필수값을 입력하세요");
		}else{
			// 저장
			editN.style.display = '';
			
			document.getElementById("keyCmnCd").value = document.getElementById("cmnCd["+rNum+"]").value;
		    document.getElementById("keyCmnNm").value = document.getElementById("cmnNm["+rNum+"]").value;
		    document.getElementById("keyArayOrde").value = document.getElementById("arayOrde["+rNum+"]").value;
		    document.getElementById("keyUseYn").value = document.getElementById("useYn["+rNum+"]").value;
			   
			submit('editSave');
		}
	}
}
/*삭제*/
function fnDel(rNum){
	if(confirm("삭제하시겠습니까?") == true){
		const queryString = window.location.search;
		const urlParams = new URLSearchParams(queryString);
		const param = urlParams.get('groCd');
	    document.getElementById("keyGroCd").value = param;
	    
		document.getElementById("keyCmnCd").value = document.getElementById("cmnCd["+rNum+"]").value;
	
		submit('del');
	}
}
/*submit*/
function submit(service){
	var form = document.getElementById("viewForm");
    form.method = "get";
    form.action = "<c:url value='/cmnCd/" + service + "'/>";
    form.submit();
}
</script>

<style type="text/css">
	.li {list-style: none; float: left; padding: 6px;}
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
						
				<form name="viewForm" id="viewForm">
				<div class="boardType01_wrap">
					<div>
						<table id="boardTable1" class="boardType01_tblList">
							<caption><span class="t-hidden">검색</span></caption>
							<colgroup>
								<col style="width:10%"/>
								<col style="width:10%"/>
								<col style="width:10%"/>
								<col style="width:10%"/>
								<col style="width:10%"/>
							</colgroup>
							<tbody>
							<tr>
								<th>그룹명</th>
								<td><input type="text" id="keyGroNm" name="keyGroNm"></td>
								<th>그룹코드</th>
								<td><input type="text" id="keyGroCd" name="keyGroCd"></td>
							</tr>
							<tr>
								<th>코드명</th>
								<td><input type="text" id="keyCmnNm" name="keyCmnNm"></td>
								<th>코드</th>
								<td><input type="text" id="keyCmnCd" name="keyCmnCd"></td>
							</tr>
							<tr>
								<th>사용여부</th>
								<td>
									<select id="keyUseYn" name="keyUseYn">
										<option value="">전체</option>
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
								
								<input type="hidden" name="keyArayOrde" id="keyArayOrde"/>
								<input type="hidden" name="page" id="page" value="1"/>
								<input type="hidden" name="groCd" id="groCd"/>
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
							    	<li class="li"><a href="cmn_cd${pageMaker.makeQuery(pageMaker.startPage - 1)}&<%=  request.getQueryString() %>">이전</a></li>
							    </c:if> 
							
							    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
							    	<li class="li"><a href="cmn_cd${pageMaker.makeQuery(idx)}&<%=  request.getQueryString() %>">${idx}</a></li>
							    </c:forEach>
							
							    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							    	<li class="li"><a href="cmn_cd${pageMaker.makeQuery(pageMaker.endPage + 1)}&<%=  request.getQueryString() %>">다음</a></li>
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
										<td><input type="text" style="width:80px;" id="cmnCd[${cmnCd.rNum}]" value="${cmnCd.cmnCd}" disabled/></td>
										<td><input type="text" style="width:80px;" id="cmnNm[${cmnCd.rNum}]" value="${cmnCd.cmnNm}"/></td>
										<td><input type="text" style="width:80px;" id="arayOrde[${cmnCd.rNum}]" value="${cmnCd.arayOrde}"/></td>
										<td><select id="useYn[${cmnCd.rNum}]" style="width:80px;">
											    <option value="${cmnCd.useYn}">${cmnCd.useYn}</option>
											    <option value="${cmnCd.useYn=='Y'?'N':'Y'}">${cmnCd.useYn=='Y'?'N':'Y'}</option>
											</select>
										</td>
<%-- 										<td><input type="text" style="width:80px;" id="useYn[${cmnCd.rNum}]" value="${cmnCd.useYn}"/></td> --%>
										<td><button type="button" onClick='fnEdit("Y",${cmnCd.rNum})' id="btnEditY" class="btnTxt btnTxt_small btnTxt_gray">저장</button>
										<button type="button" onClick='fnDel(${cmnCd.rNum})' id="btnDel" class="btnTxt btnTxt_small btnTxt_gray">삭제</button></td>
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
						<a href="${pageContext.request.contextPath}/cmnCd/cmn_cd_reg" class="btnTxt btnTxt_normal btnTxt_gray"><span>등록</span></a>
					</div> <!-- //boardType01_list_btn -->	
				</div> <!-- //boardType01_wrap -->
		
				</form>
				
			</div> <!-- //subcontent -->
		</div> <!-- //subcontent_inner -->
	</div> <!-- //subcontent_wrap -->
	
</div> <!-- //content -->
