<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script>
//validation 체크 & 등록
$(document).ready(function(){
    $("#writeForm").validate({
        //규칙
        rules: {
        	brdType: {
                required 	: true
            }	
        	,regNm: {
                 required 	: true
                ,maxlength 	: 100
            }
    		,brdTl: {
                 required 	: true
                ,maxlength 	: 100
            }
    		,emadr: {
                required 	: true
               ,maxlength 	: 100
           }
    		,tel: {
                required 	: true
               ,maxlength 	: 100
           }
    		,brdCont: {
                required 	: true
               ,maxlength 	: 300
           }
    	 	,mbrYn: {
                required 	: true
           }
        },
        //규칙체크 실패시 출력될 메시지
        messages : {
        	brdType: {
                 required 	: "필수로입력하세요"
            }
	        ,regNm: {
	            required 	: "필수로입력하세요"
	           ,maxlength 	: "최대 {100}글자까지 입력하세요"
	       	}
	        ,brdTl: {
	            required 	: "필수로입력하세요"
	           ,maxlength 	: "최대 {100}글자까지 입력하세요"
	       	}
	        ,emadr: {
	            required 	: "필수로입력하세요"
	           ,maxlength 	: "최대 {100}글자까지 입력하세요"
	       	}
	        ,tel: {
	            required 	: "필수로입력하세요"
	           ,maxlength 	: "최대 {100}글자까지 입력하세요"
	       	}
	        ,brdCont: {
	            required 	: "필수로입력하세요"
	           ,maxlength 	: "최대 {300}글자까지 입력하세요"
	       	}
	        ,mbrYn: {
	            required 	: "필수로입력하세요"
	       	}
        },
     	// error 표시 위치 변경
        errorPlacement : function(error, element) {
        	if(element.is(":radio")) {
        		element.parent().after(error);
        	}else{
        		element.after(error);
        	}
        },
        // validation이 끝난 이후의 submit 직전 추가 작업할 부분
        submitHandler: function(form) {
        	if(confirm("등록하시겠습니까?") == true){
	        	// 등록
	        	fnInsert();
        	}
        },
       	// jquery validate 로 사용하기 힘든 validation 체크
        invalidHandler: function(form, validator) {
        }
    });
});
/*등록*/
function fnInsert(){
	var form = document.getElementById("writeForm");
    form.method = "get";
    form.action = "<c:url value='/custOpn/insert'/>";
    form.submit();
}
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
					<input type="hidden" name="stsCd" id="stsCd" value="대기중"/>
					<input type="hidden" name="regChnl" id="regChnl" value="HOM"/>
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
											<label for="">유형</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
												<input type="radio" name="brdType" id="brdType" class="input_group" style="width:50px;" value="제안">
												<label for="brdType">제안</label>
												<input type="radio" name="brdType" id="brdType" class="input_group" style="width:50px;" value="칭찬">
												<label for="brdType">칭찬</label>
												<input type="radio" name="brdType" id="brdType" class="input_group" style="width:50px;" value="불만">
												<label for="brdType">불만</label>
												<input type="radio" name="brdType" id="brdType" class="input_group" style="width:50px;" value="문의">
												<label for="brdType">문의</label>
												<input type="radio" name="brdType" id="brdType" class="input_group" style="width:50px;" value="요청">
												<label for="brdType">요청</label>
												<input type="radio" name="brdType" id="brdType" class="input_group" style="width:50px;" value="기타">
												<label for="brdType">기타</label>
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
											<input type="text" name="regNm" id="regNm" class="input_textN" style="width:200px;" maxlength="50"/>
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">제목</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="text" name="brdTl" id="brdTl" class="input_textN" style="width:200px;" maxlength="50"/>
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">휴대폰 번호</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="text" name="tel" id="tel" class="input_textN" style="width:200px;" maxlength="50"/>
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">이메일 주소</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="text" name="emadr" id="emadr" class="input_textN" style="width:200px;" maxlength="50"/>
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
											<textarea name="brdCont" id="brdCont" class="input_textN" style="width:300px; height:100px;" maxlength="300"></textarea>
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">회원여부</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
										    <input type="radio" name="mbrYn" id="mbrY" class="input_group" style="width:50px;" value="Y">
											<label for="mbrYn">회원</label>
											<input type="radio" name="mbrYn" id="mbrN" class="input_group" style="width:50px;" value="N">
											<label for="mbrYn">비회원</label>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div> <!-- //boardType01_write -->
						
					<div class="boardType01_write_btn">
						<button id="btnInsert" class="btnTxt btnTxt_normal btnTxt_gray"><span>등록</span></button>
						<a href="${pageContext.request.contextPath}/custOpn/cust_opn" class="btnTxt btnTxt_normal btnTxt_dark"><span>취소</span></a>
					</div> <!-- //boardType01_write_btn -->
					</form>
				</div> <!-- //boardType01_wrap -->
				
			</div> <!-- //subcontent -->
		</div> <!-- //subcontent_inner -->
	</div> <!-- //subcontent_wrap -->
</div> <!-- //content -->