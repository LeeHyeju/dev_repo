<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script>
/*저장*/
function fnSave(){
	 $("#writeForm").validate({
	        //규칙
	        rules: {
	        	brdNm: {
	                 required 	: true
	                ,maxlength 	: 100
	            }
	    		,brdPage: {
	    			required 	: true
	               ,maxlength 	: 300
	            }
	        },
	        //규칙체크 실패시 출력될 메시지
	        messages : {
	        	brdTl: {
	                 required 	: "필수로입력하세요"
	                ,maxlength 	: "최대 {100}글자까지 입력하세요"
	            }
		        ,brdCont: {
		        	required 	: "필수로입력하세요"
	               ,maxlength 	: "최대 {300}글자까지 입력하세요"
		        }
	        },
	        // validation이 끝난 이후의 submit 직전 추가 작업할 부분
	        submitHandler: function(form) {
	        	if(confirm("저장하시겠습니까?") == true){
		        	// 저장
	        		submit('brdSave');
	        	}
	        },
	       	// jquery validate 로 사용하기 힘든 validation 체크
	        invalidHandler: function(form, validator) {
	        }
	    });
}
/*삭제*/
function fnDel(){
	if(confirm("삭제하시겠습니까?") == true){
    	// 삭제
		submit('brdDel');
	}
}
/*submit*/
function submit(service){
	var form = document.getElementById("writeForm");
    form.method = "get";
    form.action = "<c:url value='/intrBrd/" + service + "'/>";
    form.submit();
}
</script>

<div id="contentarea" class="l-content">
	<div class="breadcrumb">
		<a href="${pageContext.request.contextPath}/main"><span class="path_home">Home</span></a>
		<a href="${pageContext.request.contextPath}/intrBrd/intr_brd"><span>게시판관리</span></a>
		<span>통합게시판관리</span><span class="path_current">${boardManage.boardName}</span>
	</div> <!-- //breadcrumb -->
	
	<div class="subcontent_wrap">
		<div class="subcontent_inner">
			<div class="subcontent">
				
				<div class="subcontent_title_wrap">
					<h3 class="subcontent_title">통 합 게 시 판 관 리</h3>
					<p class="subcontent_desc"></p>
				</div> <!-- //subboard_title_wrap -->
				
				<div class="boardType01_wrap">
					<span class="boardType01_info_top"><strong>*</strong> 필수입력사항입니다.</span>
					
					<form name="writeForm" id="writeForm">
					<input type="hidden" name="brdCd" id="brdCd" value="${dtl.brdCd}"/>
					<div class="boardType01_write">
						<table id="boardTable1" class="boardType01_tbl">
							<caption class="boardType01_cpt"><span class="t-hidden">등록</span></caption>
							<colgroup>
								<col style="width:10%;"/>
								<col style="width:20%;"/>
								<col style="width:10%;"/>
								<col style="width:20%;"/>
							</colgroup>
							<tbody>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">게시판번호</label>
										</span>
									</th>
									<td colspan="3">
										<div class="input_adj">
											${dtl.brdCd}
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">유형</label>
										</span>
									</th>
									<td colspan="3">
										<div class="input_adj">
											<select name="brdType" id="brdType" class="input_selectN" style="width:200px;">
												<option value="${dtl.brdType}">${dtl.brdType}</option>
												<c:forEach var="cmnCd" items="${cmnCd}">
													<option value="${cmnCd.key}">${cmnCd.key}</option>
										     	</c:forEach>
											</select>
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">게시판명</label>
										</span>
									</th>
									<td colspan="3">
										<div class="input_adj">
											<input type="text" name="brdNm" id="brdNm" class="input_textN" style="width:200px;" maxlength="50" value="${dtl.brdNm}"/>
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">게시판 페이지</label>
										</span>
									</th>
									<td colspan="3">
										<div class="input_adj">
											<input type="text" name="brdPage" id="brdPage" class="input_textN" style="width:200px;" maxlength="50" value="${dtl.brdPage}"/>
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
											<select name="useYn" id="useYn" class="input_selectN" style="width:200px;">
												<option value="${dtl.useYn}">${dtl.useYn}</option>
												<option value="${dtl.useYn=='Y'?'N':'Y'}">${dtl.useYn=='Y'?'N':'Y'}</option>
											</select>
										</div>
									</td>
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">삭제여부</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<select name="delYn" id="delYn" class="input_selectN" style="width:200px;">
												<option value="${dtl.delYn}">${dtl.delYn}</option>
												<option value="${dtl.delYn=='Y'?'N':'Y'}">${dtl.delYn=='Y'?'N':'Y'}</option>
											</select>
										</div>
									</td>
								</tr>
								<tr><td colspan="4">목록</td></tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">페이지여부</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<select name="pageYn" id="pageYn" class="input_selectN" style="width:200px;">
												<option value="${dtl.pageYn}">${dtl.pageYn}</option>
												<option value="${dtl.pageYn=='Y'?'N':'Y'}">${dtl.pageYn=='Y'?'N':'Y'}</option>
											</select>
										</div>
									</td>
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">게시기간여부</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<select name="postPeriYn" id="postPeriYn" class="input_selectN" style="width:200px;">
												<option value="${dtl.postPeriYn}">${dtl.postPeriYn}</option>
												<option value="${dtl.postPeriYn=='Y'?'N':'Y'}">${dtl.postPeriYn=='Y'?'N':'Y'}</option>
											</select>
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">검색여부</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<select name="srchYn" id="srchYn" class="input_selectN" style="width:200px;">
												<option value="${dtl.srchYn}">${dtl.srchYn}</option>
												<option value="${dtl.srchYn=='Y'?'N':'Y'}">${dtl.srchYn=='Y'?'N':'Y'}</option>
											</select>
										</div>
									</td>
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">공지옵션여부</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<select name="notiYn" id="notiYn" class="input_selectN" style="width:200px;">
												<option value="${dtl.notiYn}">${dtl.notiYn}</option>
												<option value="${dtl.notiYn=='Y'?'N':'Y'}">${dtl.notiYn=='Y'?'N':'Y'}</option>
											</select>
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">탭사용여부</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<select name="tabYn" id="tabYn" class="input_selectN" style="width:200px;">
												<option value="${dtl.tabYn}">${dtl.tabYn}</option>
												<option value="${dtl.tabYn=='Y'?'N':'Y'}">${dtl.tabYn=='Y'?'N':'Y'}</option>
											</select>
										</div>
									</td>
									<th>
									</th>
									<td>
									</td>
								</tr>
								<tr><td colspan="4">상세</td></tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">파일첨부여부</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<select name="fileYn" id="fileYn" class="input_selectN" style="width:200px;">
												<option value="${dtl.fileYn}">${dtl.fileYn}</option>
												<option value="${dtl.fileYn=='Y'?'N':'Y'}">${dtl.fileYn=='Y'?'N':'Y'}</option>
											</select>
										</div>
									</td>
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">동영상사용여부</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<select name="vdYn" id="vdYn" class="input_selectN" style="width:200px;">
												<option value="${dtl.vdYn}">${dtl.vdYn}</option>
												<option value="${dtl.vdYn=='Y'?'N':'Y'}">${dtl.vdYn=='Y'?'N':'Y'}</option>
											</select>
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">링크사용여부</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<select name="linkYn" id="linkYn" class="input_selectN" style="width:200px;">
												<option value="${dtl.linkYn}">${dtl.linkYn}</option>
												<option value="${dtl.linkYn=='Y'?'N':'Y'}">${dtl.linkYn=='Y'?'N':'Y'}</option>
											</select>
										</div>
									</td>
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">이미지사용여부</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<select name="imgYn" id="imgYn" class="input_selectN" style="width:200px;">
												<option value="${dtl.imgYn}">${dtl.imgYn}</option>
												<option value="${dtl.imgYn=='Y'?'N':'Y'}">${dtl.imgYn=='Y'?'N':'Y'}</option>
											</select>
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">답글여부</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<select name="replYn" id="replYn" class="input_selectN" style="width:200px;">
												<option value="${dtl.replYn}">${dtl.replYn}</option>
												<option value="${dtl.replYn=='Y'?'N':'Y'}">${dtl.replYn=='Y'?'N':'Y'}</option>
											</select>
										</div>
									</td>
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">댓글여부</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<select name="cmtYn" id="cmtYn" class="input_selectN" style="width:200px;">
												<option value="${dtl.cmtYn}">${dtl.cmtYn}</option>
												<option value="${dtl.cmtYn=='Y'?'N':'Y'}">${dtl.cmtYn=='Y'?'N':'Y'}</option>
											</select>
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">작성자 / 작성일</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<fmt:formatDate var="fmtDate" value="${dtl.regDt}" pattern="yyyy.MM.dd"/>
											${dtl.regId} / ${fmtDate}
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div> <!-- //boardType01_write -->
						
					<div class="boardType01_write_btn">
						<button type="submit" id="btnSave" onClick="fnSave()" class="btnTxt btnTxt_normal btnTxt_gray"><span>저장</span></button>
						<button id="btnDel" onClick="fnDel()" class="btnTxt btnTxt_normal btnTxt_gray"><span>삭제</span></button>
						<a href="${pageContext.request.contextPath}/intrBrd/intr_brd" class="btnTxt btnTxt_normal btnTxt_dark"><span>목록</span></a>
					</div> <!-- //boardType01_write_btn -->
					
					</form>
				</div> <!-- //boardType01_wrap -->
				
			</div> <!-- //subcontent -->
		</div> <!-- //subcontent_inner -->
	</div> <!-- //subcontent_wrap -->
	
</div> <!-- //content -->




