<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script>
/*저장*/
function fnSave(){
	 submit('intr_brd_faq_save');
}
/*삭제*/
function fnDel(){
	 submit('intr_brd_faq_del');
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
		<a href="${pageContext.request.contextPath}/intrBrd/intr_brd_faq"><span>게시판관리</span></a><span>통합게시판(질문형)</span>
		<span class="path_current">${boardManage.boardName}</span>
	</div> <!-- //breadcrumb -->
	
	<div class="subcontent_wrap">
		<div class="subcontent_inner">
			<div class="subcontent">
				
				<div class="subcontent_title_wrap">
					<h3 class="subcontent_title">통 합 게 시 판 (질문형)</h3>
					<p class="subcontent_desc">.</p>
				</div> <!-- //subboard_title_wrap -->
				
				<div class="boardType01_wrap">
					<span class="boardType01_info_top"><strong>*</strong> 필수입력사항입니다.</span>
					
					<form name="writeFrm" id="writeFrm" method="post">
					<input type="hidden" name="brdCd" id="brdCd" value="${dtl.brdCd}"/>
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
											<label for="">문의유형</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="text" name="brdType" id="brdType" class="input_textN" style="width:200px;" maxlength="50" value="${dtl.brdType}"/>
										</div>
									</td>
								</tr>
								<tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">제목</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="text" name="brdTl" id="brdTl" class="input_textN" style="width:200px;" maxlength="50" value="${dtl.brdTl}"/>
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
											<input type="text" name="brdCont" id="brdCont" class="input_textN" style="width:200px;" maxlength="50" value="${dtl.brdCont}"/>
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
						<a href="${pageContext.request.contextPath}/intrBrd/intr_brd_faq" class="btnTxt btnTxt_normal btnTxt_dark"><span>목록</span></a>
					</div> <!-- //boardType01_write_btn -->
				</div> <!-- //boardType01_wrap -->
				
			</div> <!-- //subcontent -->
		</div> <!-- //subcontent_inner -->
	</div> <!-- //subcontent_wrap -->
	
</div> <!-- //content -->




