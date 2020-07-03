<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
var cdChk = 0; // (아이디 중복일 경우 = 0, 중복이 아닐경우 = 1)
//validation 체크 
$(function(){
	// 영어대문자, 숫자
	$.validator.addMethod("engNum", function(value, element){
	  var pattern = /^[A-Z0-9]+$/;
	  if(!pattern.test(value)){
	    return this.optional(element)||false;
	  }
	  return true;
	});
	// 한글, 숫자
	$.validator.addMethod("korNum", function (value, element) {
	  var pattern = /^[가-힣0-9]+$/;
	  if (!pattern.test(value)) {
	    return this.optional(element) || false;
	  }
	  return true;
	});
	// 숫자
	$.validator.addMethod("num", function (value, element) {
	  var pattern = /^[0-9]+$/;
	  if (!pattern.test(value)) {
	    return this.optional(element) || false;
	  }
	  return true;
	});
	
    $("#writeForm").validate({
        //규칙
        rules: {
        	groCd: {
                 required 	: true
                ,engNum		: true
                ,maxlength 	: 6
            }
    		,groNm: {
    			required 	: true
//                ,korNum		: true
               ,maxlength 	: 6
            }
    		,cmnCd: {
    			required 	: true
               ,num			: true
               ,maxlength 	: 6
            }
    		,cmnNm: {
    			required 	: true
               ,korNum		: true
               ,maxlength 	: 6
            }
    		,arayOrde: {
    			required 	: true
               ,num			: true
               ,maxlength 	: 6
            }
    		,useYn: {
    			 required	: true
    		}
        },
        //규칙체크 실패시 출력될 메시지
        messages : {
        	groCd: {
                 required 	: "필수로입력하세요"
                ,engNum		: "영어대문자와 숫자만 입력하세요"
                ,maxlength 	: "최대 {6}글자까지 입력하세요"
            }
	        ,groNm: {
	        	required 	: "필수로입력하세요"
//                ,korNum		: "한글과 숫자만 입력하세요"
               ,maxlength 	: "최대 {6}글자까지 입력하세요"
	        }
	        ,cmnCd: {
	        	required 	: "필수로입력하세요"
	           ,num			: "숫자만 입력하세요"
	           ,maxlength 	: "최대 {6}글자까지 입력하세요"
	        }
	        ,cmnNm: {
	        	required 	: "필수로입력하세요"
	 	       ,korNum		: "한글과 숫자만 입력하세요"
	 	       ,maxlength 	: "최대 {6}글자까지 입력하세요"
	        }
	        ,arayOrde: {
	        	required 	: "필수로입력하세요"
	           ,num			: "숫자만 입력하세요"
	           ,maxlength 	: "최대 {6}글자까지 입력하세요"
	        }
	        ,useYn: {
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
        	// $.ajax();
        	submit('insert');
        },
       	// jquery validate 로 사용하기 힘든 validation 체크
        invalidHandler: function(form, validator) {
        }
    });
});

/*저장*/
function fnInsert(){
// 	if(document.getElementById("groCd").value == ""
// 	|| document.getElementById("groNm").value == ""
// 	|| document.getElementById("cmnCd").value == ""
// 	|| document.getElementById("cmnNm").value == ""
// 	|| document.getElementById("arayOrde").value == ""
// 	|| (document.getElementById("useYnY").checked == false && document.getElementById("useYnN").checked == false)){
// 		alert("필수값을 입력하세요");
// 	}else{
// 		submit('insert');
// 	}
	
	if(cdChk == 0){
		alert("코드 중복확인 해주세요");
	}
}
/*groCd 선택*/
function fnClick() {
	var keyGroCd = document.getElementById("keyGroCd").value;
	var groCd = document.getElementById("groCd");
	var groNm = document.getElementById("groNm");
	
	keyGroCd = keyGroCd.split(",");
	groCd.value = keyGroCd[0];
	
	if(keyGroCd[0] == ""){
// 		groCd.disabled = false;
		groCd.readOnly = false;
		groNm.readOnly = false;
		groNm.value = "";
	} else {
		groCd.readOnly = true;
		groNm.readOnly = true;
		groNm.value = keyGroCd[1];
	}
}
/*groCd 선택*/
function fnGroCd() {
	window.open("cmn_cd_popup", "_blank", "top=200,left=400,height=650, width=520, status=no,toolbar=no,menubar=no,location=no");
} 
/*code 중복확인*/
function fncdChk() {
	 var groCd = $('#groCd').val();
	 var cmnCd = $('#cmnCd').val();
	 var cd = groCd + "," + cmnCd
	 
	 if(cmnCd != "" && groCd != ""){
		$.ajax({
		    type : 'POST',
		    data : cd,
		    url : "cdChk",
		    dataType : "json",
		    contentType: "application/json; charset=UTF-8",
		    success : function(data) {
		        if (data.count > 0) {
		            alert("코드가 존재합니다");
		        	$("#cmnCd").addClass("bg-danger");
		        	$("#cmnCd").removeClass("bg-success");
		            $("#cmnCd").focus();
		            cdChk = 0; 
		                           
		        } else {
		            alert("사용가능한 코드입니다");
		        	$("#cmnCd").addClass("bg-success"); 
		        	$("#cmnCd").removeClass("bg-danger");
		            $("#cmnNm").focus();
		            document.getElementById("arayOrde").value = data.listCount;
		            document.getElementById("arayOrde").readOnly = true;
		            cdChk = 1;
		        }
		    },
		    error : function(error) {
		        alert("error : " + error);
		    }
		});
	 }else{
		alert("코드를 입력해주세요");
	 }
}
/*submit*/
function submit(service){
	var form = document.getElementById("writeForm");
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
					
					<form name="writeForm" id="writeForm">
					<input type="hidden" name="regId" id="regId" value="${sessionScope.admin.admId}" />
					<div class="boardType01_write">
						<table class="boardType01_tbl">
							<caption class="boardType01_cpt"><span class="t-hidden">등록</span></caption>
							<colgroup>
								<col style="width:4%"/>
								<col style="width:20%"/>
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
											<input type="text" name="groCd" id="groCd" value="${groCd}" readOnly class="input_textN" style="width:200px;" maxlength="50"/>
											<button type="button" onClick='fnGroCd()' id="btnGroCd" class="btnTxt btnTxt_small btnTxt_gray">그룹코드 입력</button>
<!-- 											<select id="keyGroCd" name="keyGroCd" onClick="fnClick()"> -->
<!-- 									     			<option value="">직접입력</option> -->
<%-- 												<c:forEach var="cmnCd" items="${list}"> --%>
<%-- 													<option value="${cmnCd.groCd},${cmnCd.groNm}">${cmnCd.groCd}</option> --%>
<%-- 									     		</c:forEach> --%>
<!-- 											</select> -->
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
											<input type="text" name="groNm" id="groNm" value="${groNm}" readOnly class="input_textN" style="width:200px;" maxlength="50"/>
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
											<button type="button" onClick='fncdChk()' id="btncdChk" class="btnTxt btnTxt_small btnTxt_gray">코드 중복확인</button>
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
											<input type="text" name="arayOrde" id="arayOrde" readOnly class="input_textN" style="width:200px;" maxlength="50"/>
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
					
						
					<div class="boardType01_write_btn">
						<button type="submit" id="btnSave" onClick='fnInsert()' class="btnTxt btnTxt_normal btnTxt_gray"><span>저장</span></button>
						<a href="${pageContext.request.contextPath}/cmnCd/cmn_cd" class="btnTxt btnTxt_normal btnTxt_gray"><span>목록</span></a>
				</div> <!-- //boardType01_write_btn -->
				</form>
				</div> <!-- //boardType01_wrap -->
				
			</div> <!-- //subcontent -->
		</div> <!-- //subcontent_inner -->
	</div> <!-- //subcontent_wrap -->
	
</div> <!-- //content -->