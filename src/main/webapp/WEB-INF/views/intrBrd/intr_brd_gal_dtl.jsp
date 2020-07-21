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
	        	brdTl: {
	                 required 	: true
	                ,maxlength 	: 100
	            }
	    		,brdCont: {
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
		        	var brdType = document.getElementById("brdType").value;
		        	var brdTypeNm = brdType == '1' ? '대출' : (brdType == '2' ? '서비스' : '기타');
		        	document.getElementById("brdTypeNm").value = brdTypeNm;
	        	
		        	// 저장
	        		submit('galSave');
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
		submit('galDel');
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
		<span>통합게시판(갤러리형)</span><span class="path_current">${boardManage.boardName}</span>
	</div> <!-- //breadcrumb -->
	
	<div class="subcontent_wrap">
		<div class="subcontent_inner">
			<div class="subcontent">
				
				<div class="subcontent_title_wrap">
					<h3 class="subcontent_title">통 합 게 시 판 (갤러리형)</h3>
					<p class="subcontent_desc"></p>
				</div> <!-- //subboard_title_wrap -->
				
				<div class="boardType01_wrap">
					<span class="boardType01_info_top"><strong>*</strong> 필수입력사항입니다.</span>
					
					<form name="writeForm" id="writeForm">
					<input type="hidden" name="hit" id="hit" value="${dtl.hit}"/>
					<input type="hidden" name="brdCd" id="brdCd" value="${dtl.brdCd}"/>
					<input type="hidden" name="brdTypeNm" id="brdTypeNm" value="${dtl.brdTypeNm}"/>
					<div class="boardType01_write">
						<table class="boardType01_tbl">
							<caption class="boardType01_cpt"><span class="t-hidden">등록</span></caption>
							<colgroup>
								<col style="width:20%;"/>
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
											<select name="brdType" id="brdType" class="input_selectN" style="width:200px;">
												<option value="${dtl.brdType}">${dtl.brdTypeNm}</option>
											      <c:forEach var="type" items="${type}">
											         <option value="${type.brdType}">${type.brdTypeNm}</option>
											      </c:forEach>
											</select>
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
											<textarea name="brdCont" id="brdCont" class="input_textN" style="width:300px; height:100px;" maxlength="300">${dtl.brdCont}</textarea>
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
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">이미지</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="file" name="img" id="img" class="input_textN" style="width:200px;" value="${dtl.img}"/>
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">작성일</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<fmt:formatDate var="fmtDate" value="${dtl.regDt}" pattern="yyyy.MM.dd"/>
											${fmtDate}
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">작성자</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											${dtl.regId}
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div> <!-- //boardType01_write -->
						
					<div class="boardType01_write_btn">
						<button type="submit" id="btnSave" onClick="fnSave()" class="btnTxt btnTxt_normal btnTxt_gray"><span>저장</span></button>
						<button id="btnDel" onClick="fnDel()" class="btnTxt btnTxt_normal btnTxt_gray"><span>삭제</span></button>
						<a href="${pageContext.request.contextPath}/intrBrd/intr_brd_gal" class="btnTxt btnTxt_normal btnTxt_dark"><span>목록</span></a>
					</div> <!-- //boardType01_write_btn -->
					
					<table id="boardTable2" class="boardType01_tblList">
						<caption><span class="t-hidden">검색</span></caption>
						<colgroup>
							<col style="width:5%"/>
							<col style="width:20%"/>
						</colgroup>
						<tbody>
							<tr class="hover">
								<c:if test="${not empty pri}">
									<td>이전글</td>
									<td style="text-overflow : ellipsis;overflow : hidden;"><a href="/intrBrd/intr_brd_gal_dtl?brdCd=${pri.brdCd}&hit=${pri.hit}&regId=${pri.regId}"><nobr>${pri.brdTl}</nobr></a></td>
								</c:if>
							</tr>
					     	<c:if test="${empty pri}">
							<tr style="border-top: 1px solid;">
								<td colspan="2" class="no-data"><strong>이전 글이 존재하지 않습니다.</strong></td>
							</tr>
							</c:if>
							<tr class="hover">
								<c:if test="${not empty next}">
									<td>다음글</td>
									<td style="text-overflow : ellipsis;overflow : hidden;"><a href="/intrBrd/intr_brd_gal_dtl?brdCd=${next.brdCd}&hit=${next.hit}&regId=${next.regId}"><nobr>${next.brdTl}</nobr></a></td>
								</c:if>
							</tr>
					     	<c:if test="${empty next}">
							<tr>
								<td colspan="2" class="no-data"><strong>다음 글이 존재하지 않습니다.</strong></td>
							</tr>
							</c:if>
					</tbody>
					</table>
					</form>
				</div> <!-- //boardType01_wrap -->
				
			</div> <!-- //subcontent -->
		</div> <!-- //subcontent_inner -->
	</div> <!-- //subcontent_wrap -->
	
</div> <!-- //content -->