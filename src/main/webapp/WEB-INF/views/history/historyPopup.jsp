<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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

<script>
$(function(){
	$('#boardTable2 tr td button').click(function() {
		if (!confirm("선택하시겠습니까?")) return;
		
		var ver = $(this).data('version');
		$.ajax({
	        type : "GET", //전송방식을 지정한다 (POST,GET)
	        data : ver,
	    	url : "/history/view?historyVer="+ver,//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
	        dataType : "html",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
	        error : function(){
	            alert("통신실패!!!!");
	        },
	        success : function(Parse_data){
	            $("#Parse_Area").html(Parse_data); //div에 받아온 값을 넣는다.
	            alert("통신 데이터 값 : " + Parse_data);
	        }
	         
	    }); //end of ajax
	});
});

/*검색*/
function fnGroCdSrch() {
	submit("historyPopup");
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
	var form = document.getElementById("historyFrm");
    form.method = "get";
    form.action = "<c:url value='/contents/" + service + "'/>";
    form.submit();
}
</script>


<div id="contentarea" class="l-content">
	<div class="subcontent_wrap">
		<div class="subcontent_inner">
			<div class="subcontent">
			
				<form name="historyFrm" id="historyFrm">
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
									<th>현재 버전</th>
									<td><input type="text" id="historyVer" name="historyVer" value="" readonly></td>
									<td>
										<div class="boardType01_write_btn">
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
									총 <strong><c:out value="${map.count == '' ? 0 : map.count}"></c:out></strong>개의 게시물이 있습니다.
								</span>
						
								<input type="hidden" name="keyGroNm" id="keyGroNm"/>
								<table id="boardTable2" class="boardType01_tblList">
									<caption><span class="t-hidden">검색</span></caption>
									<colgroup>
										<col style="width:5%"/>
										<col style="width:20%"/>
										<col style="width:20%"/>
										<col style="width:20%"/>
										<col style="width:10%"/>
									</colgroup>
									<thead>
										<tr>
											<th>ver.</th>
											<th>컨텐츠이름</th>
											<th>스타일</th>
											<th>스크립트</th>
											<th>내용</th>
											<th>보기</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="history" items="${map.list}">
										<tr class="hover">
											<td>${history.historyVer}</td>
											<td>${history.contNm}</td>
											<td>${history.contStyle}</td>
											<td>${history.contScript}</td>
											<td>${history.contents}</td>
											<td><button type="button" data-version="${history.historyVer}" class="btnTxt btnTxt_normal btnTxt_dark">체크</button></td>
										</tr>
										<tr>
										</tr>
								     	</c:forEach>
								     	<c:if test="${empty map.list}">
										<tr>
											<td colspan="10" class="no-data"><strong>이전 히스토리가 존재하지 않습니다.</strong></td>
										</tr>
										</c:if>
								</tbody>
							</table>
								
								<div class="boardType01_write_btn">
								<!-- 히스토리 체크박스 만들기 // 체크하면 히스토리 저장되게 -->
									<button type="button" id="btn_write" class="btnTxt btnTxt_normal btnTxt_gray" onClick="fn_update()"><span>수정</span></button>
									<button type="submit" id="boardDel" class="btnTxt btnTxt_normal btnTxt_gray" onClick="fn_delete()"><span>삭제</span></button>
									<a href="${pageContext.request.contextPath}/contents/list" class="btnTxt btnTxt_normal btnTxt_dark"><span>목록</span></a>
								</div>
								
								<div class="pagination" >
								  <a href="historyPopup${pageMaker.makeQuery(pageMaker.startPage)}" class="first">◁</a>
								  <ul style="display: inline-block;" >
								    <c:if test="${pageMaker.prev}">
								    	<li style="display: inline-block;" class="li"><a href="historyPopup${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
								    </c:if> 
								
								    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
								    	<li style="display: inline-block;" class="li"><a href="historyPopup${pageMaker.makeQuery(idx)}">${idx}</a></li>
								    </c:forEach>
								
								    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								    	<li style="display: inline-block;" class="li"><a href="historyPopup${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
								    </c:if> 
								  </ul>
								  <a href="historyPopup${pageMaker.makeQuery(pageMaker.endPage)}" class="last">▷</a>
								</div>
							
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>