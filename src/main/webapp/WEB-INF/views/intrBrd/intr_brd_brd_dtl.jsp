<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script>
/*저장*/
function fnSave(){
	 submit('intr_brd_brd_save');
}
/*삭제*/
function fnDel(){
	 submit('intr_brd_brd_del');
}

function submit(service){
	var form = document.getElementById("writeFrm");
    form.method = "get";
    form.action = "<c:url value='/intrBrd/" + service + "'/>";
    form.submit();
}
</script>

<div id="contentarea" class="l-content">
	<div class="breadcrumb">
		<a href="${pageContext.request.contextPath}/main"><span class="path_home">Home</span></a>
		<a href="${pageContext.request.contextPath}/intrBrd/intr_brd_brd"><span>게시판관리</span></a><span>통합게시판(게시판형)</span>
		<span class="path_current">${boardManage.boardName}</span>
	</div> <!-- //breadcrumb -->
	
	<div class="subcontent_wrap">
		<div class="subcontent_inner">
			<div class="subcontent">
				
				<div class="subcontent_title_wrap">
					<h3 class="subcontent_title">통 합 게 시 판 (게시판형)</h3>
					<p class="subcontent_desc">.</p>
				</div> <!-- //subboard_title_wrap -->
				
				<div class="boardType01_wrap">
					<span class="boardType01_info_top"><strong>*</strong> 필수입력사항입니다.</span>
					
					<form name="writeFrm" id="writeFrm" method="post" enctype="multipart/form-data">
					<input type="hidden" name="boardCd" id="boardCd" value="${dtl.boardCd}"/>
					<div class="boardType01_write">
						<table cellspacing="0" class="boardType01_tbl">
							<caption class="boardType01_cpt"><span class="t-hidden">등록</span></caption>
							<colgroup>
								<col style="width:20%;"/>
							</colgroup>
							<tbody>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">제목</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="text" name="boardTitle" id="boardTitle" class="input_textN" style="width:200px;" maxlength="50" value="${dtl.boardTitle}"/>
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">공지옵션</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="radio" name="ancmOptnYn" id="ancmOptnYn" class="input_group" style="width:20px;" maxlength="50" value="Y">
											<label for="ancmOptnYn">사용</label>
											<input type="radio" name="ancmOptnYn" id="ancmOptnYn" class="input_group" style="width:20px;" maxlength="50" value="N">
											<label for="ancmOptnYn">미사용</label>
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">게시기간</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="text" name="ntcPerdYn" id="ntcPerdYn" class="input_textN" style="width:200px;" maxlength="50" value="" />
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">동영상</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="text" name="vdUseYn" id="vdUseYn" class="input_textN" style="width:200px;" maxlength="50" value="" />
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">연결URL</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<select name="linkUseYn" id="linkUseYn" class="input_selectN" style="width:200px;" maxlength="50" value="">
											</select>
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">파일</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="text" name="fileYn" id="fileYn" class="input_textN" style="width:200px;" maxlength="50" value="${dtl.fileYn}" />
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">내용</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="text" name="boardContent" id="boardContent" class="input_textN" style="width:200px;" maxlength="50" value="${dtl.boardContent}" />
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div> <!-- //boardType01_write -->
					</form>
						
					<div class="boardType01_write_btn">
						<button id="btnSave" onClick="fnSave()" class="btnTxt btnTxt_normal btnTxt_gray"><span>저장</span></button>
						<button id="btnDel" onClick="fnDel()" class="btnTxt btnTxt_normal btnTxt_gray"><span>삭제</span></button>
						<a href="${pageContext.request.contextPath}/intrBrd/intr_brd_brd" class="btnTxt btnTxt_normal btnTxt_dark"><span>목록</span></a>
					</div> <!-- //boardType01_write_btn -->
				</div> <!-- //boardType01_wrap -->
				
			</div> <!-- //subcontent -->
		</div> <!-- //subcontent_inner -->
	</div> <!-- //subcontent_wrap -->
	
</div> <!-- //content -->




