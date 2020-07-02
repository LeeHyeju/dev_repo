<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script>
//validation 체크 
$(function(){

	//숫자 영어만 사용 
	$.validator.addMethod("eng_number", function (value, element) {
		return this.optional(element) || /^[a-zA-Z\d]+$/.test(value);
	});
	
    $("#writeFrm").validate({
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
        	// $.ajax();
        	form.submit();
        },
        invalidHandler: function(form, validator) {
        	// jquery validate 로 사용하기 힘든 validation 체크
            //alert('invalidHandler');
        }
    });

});

//아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
var cdCk = 0;
$(function() {
    //idck 버튼을 클릭했을 때 
	$('#btn_cdCk').click(function() {
        //userid 를 param.
        var contCd = $('#contCd').val();
        
        if(contCd == "" || contCd == null) {
           		alert("아이디를 입력해주세요");
    	} else {
	        $.ajax({
	            type : 'POST',
	            data : contCd,
	            url : "contCdcheck",
	            dataType : "json",
	            contentType: "application/json; charset=UTF-8",
	            success : function(data) {
	                if (data.cnt > 0) {
	                    alert("컨텐츠 코드가 존재합니다. 다른 코드번호를 입력해주세요.");
	                	$("#contCd").addClass("bg-danger");
	                	$("#contCd").removeClass("bg-success");
	                    $("#contCd").focus();
	                                    
	                } else {
	                    alert("사용가능한 코드번호입니다.");
	                	$("#contCd").addClass("bg-success"); 
	                	$("#contCd").removeClass("bg-danger");
	                    $("#contNm").focus();
	                    //중복하지 않으면  cdCk= 1 
	                    cdCk = 1;
	                }
	            },
	            error : function(error) {
	                alert("error : " + error);
	            }
	        });
		}
    });
});

</script>

<div id="contentarea" class="l-content">
	<div class="breadcrumb">
		<a href="${pageContext.request.contextPath}/main"><span class="path_home">Home</span></a><a href="${pageContext.request.contextPath}/contents/list"><span>컨텐츠관리</span></a><span>컨텐츠관리</span><span class="path_current">${boardManage.boardName}</span>
	</div> <!-- //breadcrumb -->
	
	<div class="subcontent_wrap">
		<div class="subcontent_inner">
			<div class="subcontent">
				
				<div class="subcontent_title_wrap">
					<h3 class="subcontent_title">컨텐츠관리</h3>
					<p class="subcontent_desc">.</p>
				</div> <!-- //subboard_title_wrap -->
				
				<div class="boardType01_wrap">
					<span class="boardType01_info_top"><strong>*</strong> 필수입력사항입니다.</span>
					
					<form name="writeFrm" id="writeFrm"  method="post" action="/contents/insert">
					<input type="hidden" name="regId" id="regId" value="${sessionScope.admin.admId }" />
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
												<span class="bullet_required">*<span class="t-hidden">필수</span></span>
												<label for="">컨텐츠코드</label>
											</span>
										</th>
										<td>
											<div class="input_adj">
												<input type="text" name="contCd" id="contCd" class="input_textN" style="width:200px;" maxlength="5" value="" />
												<button type="button" id="btn_cdCk" class="btnTxt btnTxt_normal btnTxt_cyan" style="width:100px; height:28px;line-height:0;"><span>중복확인</span></button>
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
												<input type="text" name="contNm" id="contNm" class="input_textN" style="width:200px;" maxlength="20" value="" />
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
												<textarea name="contStyle" id="contStyle" class="input_textN" style="width:550px;height:150px;resize: none;" value=""></textarea>
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
												<textarea name="contScript" id="contScript" class="input_textN" style="width:550px;height:150px;resize: none;" value=""></textarea>
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
												<textarea name="contents" id="contents" class="input_textN" style="width:550px;height:100px;resize: none;" value=""></textarea>
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
												${sessionScope.admin.nm } ( ${sessionScope.admin.admId } )
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div> <!-- //boardType01_write -->
						
						<div class="boardType01_write_btn">
						<!-- 히스토리 체크박스 만들기 // 체크하면 히스토리 저장되게 -->
							<button type="submit" id="btn_write" class="btnTxt btnTxt_normal btnTxt_gray"><span>저장</span></button>
							<button type="button" id="btn_cancle" class="btnTxt btnTxt_normal btnTxt_gray" onClick="location.href='javascript:history.back();'"><span>취소</span></button>
							<a href="${pageContext.request.contextPath}/contents/list" class="btnTxt btnTxt_normal btnTxt_dark"><span>목록</span></a>
						</div> <!-- //boardType01_write_btn -->
					</form>
				</div> <!-- //boardType01_wrap -->
			</div> <!-- //subcontent -->
		</div> <!-- //subcontent_inner -->
	</div> <!-- //subcontent_wrap -->
</div> <!-- //content -->




