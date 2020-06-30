<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script>
/*검색*/
function fnGroCdSrch() {
	submit("codePopup");
}
/*코드 선택*/
function fnClick(groCd, groNm) {
	if(confirm("선택하시겠습니까?") == true){
// 		opener.parent.location.reload();
		opener.document.getElementById("groCd").value = groCd;
		opener.document.getElementById("groNm").value = groNm;
		window.close();
    }
}
/*코드 입력*/
function fnCdInput() {
	if(document.getElementById("groCd").value == "" || document.getElementById("groNm").value == ""){
	 	alert("코드를 직접입력해주세요");		
	} else {
		if(confirm("입력하시겠습니까?") == true){
			opener.document.getElementById("groCd").value = document.getElementById("groCd").value;
			opener.document.getElementById("groNm").value = document.getElementById("groNm").value;
			window.close();
	    }
	}
}
/*submit*/
function submit(service){
	var form = document.getElementById("popupForm");
    form.method = "get";
    form.action = "<c:url value='/cmnCd/" + service + "'/>";
    form.submit();
}
</script>
<style type="text/css">
	html {overflow:hidden;} 
	.l-content {padding:15px;float:left;height:600px;width:520px;}
	.boardType01_tblList {width:100%; border-top:2px solid #777; border-bottom:2px solid #dbdbdb;}
	.boardType01_tblList th,
	.boardType01_tblList td {padding-top:10px; padding-bottom:12px; border-bottom:1px solid #dbdbdb; text-align:center; color:#666;}
	.boardType01_tblList th {font-size:13px;}
	
	.li {list-style: none; float: left; padding: 6px;}
	.hover:hover {background-color:#f5f5f5;}
</style>
<div id="contentarea" class="l-content">
	<div class="subcontent_wrap">
		<div class="subcontent_inner">
			<div class="subcontent">
			
				<form name="popupForm" id="popupForm">
					<div class="boardType01_wrap">
						<table id="boardTable1" class="boardType01_tblList">
							<caption><span class="t-hidden">검색</span></caption>
							<colgroup>
								<col style="width:5%"/>
								<col style="width:8%"/>
								<col style="width:10%"/>
							</colgroup>
							<tbody>
							<tr>
								<th>그룹코드</th>
								<td><input type="text" id="keyGroCd" name="keyGroCd"></td>
								<td>
									<div class="boardType01_write_btn">
										<button type="button" onClick='fnGroCdSrch()' id="btnGroCdSrch" class="btnTxt btnTxt_normal btnTxt_gray">검색</button>
									</div>	
								</td>
							</tr>
							</tbody>
						</table>
					</div>
						
						<div style="padding:5px 0px 15px 0px;">
						<div style="float:left; height:490px;">
							<div style="height:480px;">
								<span class="boardType01_info_top">
									총 <strong><c:out value="${count == '' ? 0 : count}"></c:out></strong>개의 게시물이 있습니다.
								</span>
						
								<input type="hidden" name="keyGroNm" id="keyGroNm"/>
								<table id="boardTable2" class="boardType01_tblList">
									<caption><span class="t-hidden">검색</span></caption>
									<colgroup>
										<col style="width:5%"/>
										<col style="width:10%"/>
										<col style="width:10%"/>
										<col style="width:10%"/>
									</colgroup>
									<thead>
										<tr>
											<th></th>
											<th>그룹코드</th>
											<th>그룹명</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="cmnCd" items="${list}">
										<tr class="hover" onClick='fnClick("${cmnCd.groCd}", "${cmnCd.groNm}")'>
												<td>${cmnCd.rNum}</td>
												<td>${cmnCd.groCd}</td>
												<td>${cmnCd.groNm}</td>
												<td></td>
										</tr>
								     	</c:forEach>
								     	<c:if test="${empty list}">
										<tr>
											<td></td>
											<td><input type="text" id="groCd" name="groCd"></td>
											<td><input type="text" id="groNm" name="groNm"></td>
											<td>
												<div class="boardType01_write_btn">
													<button type="button" onClick='fnCdInput()' id="btnCdInput" class="btnTxt btnTxt_medium btnTxt_gray">입력</button>
												</div>
											</td>
										</tr>
										<tr>
											<td colspan="10" class="no-data"><strong>코드를 직접입력 해주세요.</strong></td>
										</tr>
										</c:if>
								</tbody>
							</table>
								
								<div class="pagination">
								  <ul>
								    <c:if test="${pageMaker.prev}">
								    	<li class="li"><a href="codePopup${pageMaker.makeQuery(pageMaker.startPage - 1)}&<%=  request.getQueryString() %>">이전</a></li>
								    </c:if> 
								
								    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
								    	<li class="li"><a href="codePopup${pageMaker.makeQuery(idx)}&<%=  request.getQueryString() %>">${idx}</a></li>
								    </c:forEach>
								
								    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								    	<li class="li"><a href="codePopup${pageMaker.makeQuery(pageMaker.endPage + 1)}&<%=  request.getQueryString() %>">다음</a></li>
								    </c:if> 
								  </ul>
								</div>
							
							</div>
						</div>
						</div>
				</form>
				
			</div>
		</div>
	</div>
</div>