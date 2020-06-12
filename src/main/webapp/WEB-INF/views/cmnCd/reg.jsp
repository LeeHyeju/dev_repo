<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<script>
/*저장*/
function fn_insert(){
    var form = document.getElementById("writeFrm");
    form.method = "post";
    form.action = "<c:url value='/cmnCd/insert'/>";
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
					<p class="subcontent_desc">.</p>
				</div> <!-- //subcontent_title_wrap -->
				
				<div class="boardType01_wrap">
					<span class="boardType01_info_top"><strong>*</strong> 필수입력사항입니다.</span>
					
					<form name="writeFrm" id="writeFrm">
					<input type="hidden" name="regId" id="regId" value="${sessionScope.admin.admId}" />
					<div class="boardType01_write">
						<table cellspacing="0" class="boardType01_tbl">
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
											<input type="text" name="groCd" id="groCd" class="input_textN" style="width:200px;" maxlength="50" value=""/>
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
											<input type="text" name="groNm" id="groNm" class="input_textN" style="width:200px;" maxlength="50" value=""/>
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
											<input type="text" name="cmnCd" id="cmnCd" class="input_textN" style="width:200px;" maxlength="50" value=""/>
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
											<input type="text" name="cmnNm" id="cmnNm" class="input_textN" style="width:200px;" maxlength="50" value=""/>
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
											<input type="text" name="arayOrde" id="arayOrde" class="input_textN" style="width:200px;" maxlength="50" value=""/>
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
											<input type="radio" name="useYn" id="useYn" class="input_group" style="width:200px;" maxlength="50" value="Y">
											<label for="ancmOptnYn">사용</label>
											<input type="radio" name="useYn" id="useYn" class="input_group" style="width:200px;" maxlength="50" value="N">
											<label for="ancmOptnYn">미사용</label>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div> <!-- //boardType01_write -->
					</form>
						
					<div class="boardType01_write_btn">
						<button id="btn_save" onClick='fn_insert()' class="btnTxt btnTxt_normal btnTxt_gray"><span>저장</span></button>
						<button id="btn_del" class="btnTxt btnTxt_normal btnTxt_gray"><span>삭제</span></button>
						<a href="${pageContext.request.contextPath}/intrBrd/intr_brd_gal" class="btnTxt btnTxt_normal btnTxt_dark"><span>목록</span></a>
					</div> <!-- //boardType01_write_btn -->
				</div> <!-- //boardType01_wrap -->
				
			</div> <!-- //subcontent -->
		</div> <!-- //subcontent_inner -->
	</div> <!-- //subcontent_wrap -->
	
</div> <!-- //content -->




