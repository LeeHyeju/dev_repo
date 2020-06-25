<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<script>
/*저장*/
function fnInsert(){
	if(document.getElementById("groCd").value == ""
	|| document.getElementById("groNm").value == ""
	|| document.getElementById("cmnCd").value == ""
	|| document.getElementById("cmnNm").value == ""
	|| document.getElementById("arayOrde").value == ""
	|| (document.getElementById("useYnY").checked == false && document.getElementById("useYnN").checked == false)){
		alert("필수값을 입력하세요");
	}else{
		submit('insert');
	}
}
/*목록*/
function fnList(){
   	submit('cmn_cd');
}
/*submit*/
function submit(service){
	var form = document.getElementById("writeFrm");
    form.method = "get";
    form.action = "<c:url value='/cmnCd/" + service + "'/>";
    form.submit();
}
</script>

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
				
				<div class="boardType01_wrap">
					<span class="boardType01_info_top"><strong>*</strong> 필수입력사항입니다.</span>
					
					<form name="writeFrm" id="writeFrm">
					<input type="hidden" name="regId" id="regId" value="${sessionScope.admin.admId}" />
					<div class="boardType01_write">
						<table class="boardType01_tbl">
							<caption class="boardType01_cpt"><span class="t-hidden">등록</span></caption>
							<colgroup>
								<col style="width:20%;" />
							</colgroup>
							<tbody>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">그룹코드</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="text" name="groCd" id="groCd" class="input_textN" style="width:200px;" maxlength="50"/>
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">그룹명</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="text" name="groNm" id="groNm" class="input_textN" style="width:200px;" maxlength="50"/>
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">코드</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="text" name="cmnCd" id="cmnCd" class="input_textN" style="width:200px;" maxlength="50"/>
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">코드명</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="text" name="cmnNm" id="cmnNm" class="input_textN" style="width:200px;" maxlength="50"/>
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">정렬순서</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="text" name="arayOrde" id="arayOrde" class="input_textN" style="width:200px;" maxlength="50"/>
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">사용여부</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="radio" name="useYn" id="useYnY" class="input_group" style="width:50px;" value="Y">
											<label for="useYn">사용</label>
											<input type="radio" name="useYn" id="useYnN" class="input_group" style="width:50px;" value="N">
											<label for="useYn">미사용</label>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div> <!-- //boardType01_write -->
					</form>
						
					<div class="boardType01_write_btn">
						<button id="btnSave" onClick='fnInsert()' class="btnTxt btnTxt_normal btnTxt_gray"><span>저장</span></button>
						<button id="btnList" onClick='fnList()' class="btnTxt btnTxt_normal btnTxt_gray"><span>목록</span></button>
<!-- 						<div class="boardType01_write_btn" style="clear:both"> -->
<%-- 							<a href="${pageContext.request.contextPath}/cmnCd/cmn_cd" class="btnTxt btnTxt_normal btnTxt_gray"><span>목록</span></a> --%>
<!-- 						</div> -->
					</div> <!-- //boardType01_write_btn -->
				</div> <!-- //boardType01_wrap -->
				
			</div> <!-- //subcontent -->
		</div> <!-- //subcontent_inner -->
	</div> <!-- //subcontent_wrap -->
	
</div> <!-- //content -->




