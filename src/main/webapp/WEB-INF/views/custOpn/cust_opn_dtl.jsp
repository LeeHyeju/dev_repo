<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script>
/*저장*/
function fnSave(){
	//유효성 체크
	$.validator.addMethod("telnum", function(value, element){
	  var pattern = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;
	  if(!pattern.test(value)){
	    return this.optional(element)||false;
	  }
	  return true;
	});
	//숫자 영어만 사용 
	$.validator.addMethod("eng_number", function (value, element) {
		return this.optional(element) || /^[a-zA-Z\d]+$/.test(value);
	});
	
    $("#writeForm").validate({
        //규칙
        rules: {
        	regNm: {
                 required 	: true
                ,maxlength 	: 100
            }
		    ,brdType: {
		        required 	: true
		       ,maxlength 	: 100
		    }
    		,brdTl: {
                 required 	: true
                ,maxlength 	: 100
            }
    		,brdCont: {
                required 	: true
               ,maxlength 	: 100
           	}
    		,emadr: {
                required 	: true
               ,maxlength 	: 100
            }
    		,tel: {
    			telnum : true
    		   ,maxlength : 13
           }
        },
        //규칙체크 실패시 출력될 메시지
        messages : {
        	regNm: {
                 required 	: "필수로입력하세요"
                ,maxlength 	: "최대 {100}글자까지 입력하세요"
            }
	        ,brdType: {
	            required 	: "필수로입력하세요"
	           ,maxlength 	: "최대 {100}글자까지 입력하세요"
	       	}
	        ,brdTl: {
	            required 	: "필수로입력하세요"
	           ,maxlength 	: "최대 {100}글자까지 입력하세요"
	       	}
	        ,brdCont: {
	            required 	: "필수로입력하세요"
	           ,maxlength 	: "최대 {100}글자까지 입력하세요"
	       	}
	        ,emadr: {
	            required 	: "필수로입력하세요"
	           ,maxlength 	: "최대 {100}글자까지 입력하세요"
	       	}
	        ,tel: {
	        	telnum : "올바른 형식으로 입력하세요"
	           ,maxlength : "최대 {13}글자이하이어야 합니다"
	       	}
        },
     	// error 표시 위치 변경
        errorPlacement : function(error, element) {
        },
        // validation이 끝난 이후의 submit 직전 추가 작업할 부분
        submitHandler: function(form) {
        	// 답변 작성시
			if(document.getElementById("replCont").value != ""){
				document.getElementById("mngmNm").value = document.getElementById("regId").value;
			}
			
        	if(confirm("저장하시겠습니까?") == true){
	        	// 등록
	        	submit('save');
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
		submit('del');
	}
}
/*submit*/
function submit(service){
	var form = document.getElementById("writeForm");
    form.method = "get";
    form.action = "<c:url value='/custOpn/" + service + "'/>";
    form.submit();
}
//연락처 하이픈 자동생성
$(document).on("keyup", "#tel", function() { 
	$(this).val( $(this).val().replace(/[^0-9]/g, "")
			.replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3")
			.replace("--", "-") ); 
});
</script>

<div id="contentarea" class="l-content">
	<div class="breadcrumb">
		<a href="${pageContext.request.contextPath}/main"><span class="path_home">Home</span></a>
		<a href="${pageContext.request.contextPath}/custOpn/"><span>게시판관리</span></a><span>고객문의</span>
		<span class="path_current">${boardManage.boardName}</span>
	</div> <!-- //breadcrumb -->
	
	<div class="subcontent_wrap">
		<div class="subcontent_inner">
			<div class="subcontent">
				
				<div class="subcontent_title_wrap">
					<h3 class="subcontent_title">고 객 문 의</h3>
					<p class="subcontent_desc"></p>
				</div> <!-- //subboard_title_wrap -->
				
				<div class="boardType01_wrap">
					<span class="boardType01_info_top"><strong>*</strong> 필수입력사항입니다.</span>
					
					<form name="writeForm" id="writeForm">
					<input type="hidden" name="regId" id="regId" value="${sessionScope.admin.admId}"/>
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
											<label for="">제목</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="text" name="brdTl" id="brdTl" class="input_textN" style="width:200px;" maxlength="50" value="${dtl.brdTl}"/>
										</div>
									</td>
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">유형</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<select name="brdType" id="brdType" class="input_selectN" style="width:200px;">
												<option value="${dtl.brdType}">${dtl.brdType}</option>
											</select>
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">접수자명</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="text" name="regNm" id="regNm" class="input_textN" style="width:200px;" maxlength="50" value="${dtl.regNm}"/>
										</div>
									</td>
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">진행상태</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="text" name="stsCd" id="stsCd" readOnly class="input_textN" style="width:200px;" maxlength="50" value="${dtl.stsCd}"/>
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">접수번호</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="text" name="regNo" id="regNo" readOnly class="input_textN" style="width:200px;" maxlength="50" value="${dtl.regNo}"/>
										</div>
									</td>
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">등록일</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<fmt:formatDate var="fmtDate" value="${dtl.regDt}" pattern="yyyy.MM.dd"/>
											<input type="text" name="regDt" disabled value="${fmtDate}"/>
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">접수채널</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="text" name="regChnl" id="regChnl" readOnly class="input_textN" style="width:200px;" maxlength="50" value="${dtl.regChnl}"/>
										</div>
									</td>
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">처리일</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<fmt:formatDate var="fmtDate" value="${dtl.mngmDt}" pattern="yyyy.MM.dd"/>
											<input type="text" name="mngmDt" disabled value="${fmtDate}"/>
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">휴대폰번호</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="text" name="tel" id="tel" class="input_textN" style="width:200px;" maxlength="50" value="${dtl.tel}"/>
										</div>
									</td>
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">처리자</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="text" name="mngmNm" id="mngmNm" readOnly class="input_textN" style="width:200px;" maxlength="50" value="${dtl.mngmNm}"/>
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">이메일주소</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="text" name="emadr" id="emadr" class="input_textN" style="width:200px;" maxlength="50" value="${dtl.emadr}"/>
										</div>
									</td>
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">회원여부</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="text" name="mbrYn" id="mbrYn" readOnly class="input_textN" style="width:200px;" maxlength="50" value="${dtl.mbrYn}"/>
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
							</tbody>
						</table>
					</div> <!-- //boardType01_write -->
						
					<div class="boardType01_write" style="margin-top: 50px;">
						<table id="boardTable1" class="boardType01_tbl">
							<caption class="boardType01_cpt"><span class="t-hidden">등록</span></caption>
							<colgroup>
								<col style="width:10%;"/>
								<col style="width:20%;"/>
							</colgroup>
							<tbody>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">상태</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="text" name="stsCd" id="stsCd" disabled class="input_textN" style="width:200px;" maxlength="50" value="${dtl.stsCd}"/>
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">답변내용</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<textarea name="replCont" id="replCont" class="input_textN" style="width:300px; height:100px;" maxlength="300">${dtl.replCont}</textarea>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<div class="boardType01_write_btn">
						<button type="submit" id="btnSave" onClick="fnSave()" class="btnTxt btnTxt_normal btnTxt_gray"><span>저장</span></button>
						<button id="btnDel" onClick="fnDel()" class="btnTxt btnTxt_normal btnTxt_gray"><span>삭제</span></button>
						<a href="${pageContext.request.contextPath}/custOpn/cust_opn" class="btnTxt btnTxt_normal btnTxt_dark"><span>목록</span></a>
					</div> <!-- //boardType01_write_btn -->
				</form>
				</div> <!-- //boardType01_wrap -->
				
			</div> <!-- //subcontent -->
		</div> <!-- //subcontent_inner -->
	</div> <!-- //subcontent_wrap -->
	
</div> <!-- //content -->




