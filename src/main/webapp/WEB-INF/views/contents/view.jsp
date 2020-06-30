<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script>

$(function(){

	//숫자 영어만 사용 
	$.validator.addMethod("eng_number", function (value, element) {
		return this.optional(element) || /^[a-zA-Z\d]+$/.test(value);
	});
	
    $("#viewFrm").validate({
        //규칙
        rules: {
        	contCd: {
                required : true,
                eng_number: true,
                maxlength : 5
            },
            contNm: {
                required : true,
                maxlength : 20
            },
            contents: {
                required : true
            }
        },
        //규칙체크 실패시 출력될 메시지
        messages : {
        	contCd: {
                required : "필수로입력하세요",
                eng_number: "영문과 숫자만 입력하세요",
                maxlength : "최대 {5}글자이하만 입력하세요"
            },
            contNm: {
                required : "필수로입력하세요",
                minlength : "최대 {20}글자이하만 입력하세요",
                
            },
            contents: {
                required : "필수로입력하세요",
            }
        },
        //validation이 끝난 이후의 submit 직전 추가 작업할 부분
        submitHandler: function(form){
        	form.method = "post";
 		    form.action = "<c:url value='/contents/update'/>";
 		  	form.submit();
        },
        invalidHandler: function(form, validator) {
        	// jquery validate 로 사용하기 힘든 validation 체크
            //alert('invalidHandler');
        }
    });

});
/*수정*/
function fn_update(){
	if (confirm("수정하시겠습니까?")) {		    
	    $("#viewFrm").submit();
	}
}

/*삭제*/
function fn_delete(){
	if (confirm("삭제하시겠습니까?")) {
	    var form = document.getElementById("viewFrm");
   	 	form.method = "post";
   	 	form.action = "<c:url value='/contents/delete'/>";
   	 	form.submit();
	} 
}
</script>

<div id="contentarea" class="l-content">
	<div class="breadcrumb">
		<a href="${pageContext.request.contextPath}/main"><span class="path_home">Home</span></a><a href="${pageContext.request.contextPath}/admin/list"><span>게시판관리</span></a><span>게시물관리</span><span class="path_current">${boardManage.boardName}</span>
	</div> <!-- //breadcrumb -->
	
	<div class="subcontent_wrap">
		<div class="subcontent_inner">
			<div class="subcontent">
				
				<div class="subcontent_title_wrap">
					<h3 class="subcontent_title">관리자정보관리</h3>
					<p class="subcontent_desc">.</p>
				</div> <!-- //subboard_title_wrap -->
				
				<div class="boardType01_wrap">
					<span class="boardType01_info_top"><strong>*</strong> 필수입력사항입니다.</span>
					
					<form name="viewFrm" id="viewFrm" method="post">
						<input type="hidden" id="contIdx" name="contIdx" value="${view.contIdx }">
						<div class="boardType01_write">
							<table cellspacing="0" class="boardType01_tbl">
								<caption class="boardType01_cpt"><span class="t-hidden"> 등록</span></caption>
								<colgroup>
									<col style="width:20%;" />
									<col />
								</colgroup>
								<tbody>
									<tr> 
										<th>
											<span class="th_wrap">
												<label for="">No.</label>
											</span>
										</th>
										<td>
											<div class="input_adj">
												${view.contIdx }
											</div>
										</td>
									</tr>
									<tr> 
										<th>
											<span class="th_wrap">
												<span class="bullet_required">*<span class="t-hidden">필수</span></span>
												<label for="">컨텐츠코드</label>
											</span>
										</th>
										<td>
											<div class="input_adj">
											${view.contCd }
											</div>
										</td>
									</tr>
									<tr> 
										<th>
											<span class="th_wrap">
												<span class="bullet_required">*<span class="t-hidden">필수</span></span>
												<label for="">컨텐츠이름</label>
											</span>
										</th>
										<td>
											<div class="input_adj">
												<input type="text" name="contNm" id="contNm" class="input_textN" style="width:200px;" maxlength="50" value="${view.contNm }" />
											</div>
										</td>
									</tr>
									<tr> 
										<th>
											<span class="th_wrap">
												스타일
											</span>
										</th>
										<td>
											<div class="input_adj">
												<textarea name="contStyle" id="contStyle" class="input_textN" style="width:550px;height:200px;resize: none;">${view.contStyle }</textarea>
											</div>
										</td>
									</tr>
									<tr> 
										<th>
											<span class="th_wrap">
												<label for="">스크립트</label>
											</span>
										</th>
										<td>
											<div class="input_adj">
												<textarea name="contScript" id="contScript" class="input_textN" style="width:550px;height:200px;resize: none;">${view.contScript }</textarea>
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
												<textarea name="contents" id="contents" class="input_textN" style="width:550px;height:200px;resize: none;" >${view.contents }</textarea>
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
												${view.regId }
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
												<fmt:formatDate value="${view.regDt}" pattern="yyyy.MM.dd"/>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div> <!-- //boardType01_write -->
						
						<div class="boardType01_write_btn">
						<!-- 히스토리 체크박스 만들기 // 체크하면 히스토리 저장되게 -->
							<button type="button" id="btn_write" class="btnTxt btnTxt_normal btnTxt_gray" onClick="fn_update()"><span>수정</span></button>
							<button type="submit" id="boardDel" class="btnTxt btnTxt_normal btnTxt_gray" onClick="fn_delete()"><span>삭제</span></button>
							<a href="${pageContext.request.contextPath}/contents/list" class="btnTxt btnTxt_normal btnTxt_dark"><span>목록</span></a>
						</div> <!-- //boardType01_write_btn -->
					</form>
				</div> <!-- //boardType01_wrap -->
			</div> <!-- //subcontent -->
		</div> <!-- //subcontent_inner -->
	</div> <!-- //subcontent_wrap -->
</div> <!-- //content -->



