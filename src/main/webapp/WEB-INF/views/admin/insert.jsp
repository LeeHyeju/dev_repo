<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script>

//validation 체크 
$(function(){

	//유효성 체크
	$.validator.addMethod("telnum", function(value, element){
	  var pattern = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;
	  if(!pattern.test(value)){
	    return this.optional(element)||false;
	  }
	  return true;
	});
	//회원ID 검사
	$.validator.addMethod("user_id", function (value, element) {
	  var pattern = /(^[a-zA-Z0-9\_])/;
	  if (!pattern.test(value)) {
	    return this.optional(element) || false;
	  }
	  return true;
	});
	//숫자 영어만 사용 
	$.validator.addMethod("eng_number", function (value, element) {
		return this.optional(element) || /^[a-zA-Z\d]+$/.test(value);
	});
	
    $("#writeFrm").validate({
        //규칙
        rules: {
        	admId: {
                required : true,
                user_id : true,
                minlength : 6
            },
            pw: {
                required : true,
                minlength : 5
            },
            pw2: {
                required : true,
                minlength : 5,
                equalTo : pw
            },
            nm: {
                required : true,
                minlength : 2
            },
            authCd: {
                required : true
            },
            tel: {
                telnum : true
            },
            emailId: {
                minlength : 5,
                eng_number: true
            }
        },
        //규칙체크 실패시 출력될 메시지
        messages : {
            admId: {
                required : "필수로입력하세요",
                user_id: "영문소문자, 숫자, _ 만 입력 가능합니다",
                minlength : "최소 {6}글자이상 입력하세요"
            },
            pw: {
                required : "필수로입력하세요",
                minlength : "최소 {5}글자이상 입력하세요"
            },
            pw2: {
                required : "필수로입력하세요",
                minlength : "최소 {5}글자이상 입력하세요",
                equalTo : "비밀번호가 일치하지 않습니다"
            },
            nm: {
                required : "필수로입력하세요",
                minlength : "최소 {0}글자이상 입력하세요"
            },
            authCd: {
            	required : "필수로입력하세요"
            },
            tel: {
                telnum : "올바른 형식으로 입력하세요"
            },
            emailId: {
                minlength : "최소 {5}글자이상이어야 합니다",
                eng_number: "영문과 숫자만 입력하세요"
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
var idck = 0;
$(function() {
    //idck 버튼을 클릭했을 때 
    $('#btn_idck').click(function() {
        //userid 를 param.
        var userid = $('#admId').val();
        alert(userid);
        $.ajax({
            type : 'POST',
            data : userid,
            url : "idcheck",
            dataType : "json",
            contentType: "application/json; charset=UTF-8",
            success : function(data) {
                if (data.cnt > 0) {
                    alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
                	$("#admId").addClass("bg-danger");
                	$("#admId").removeClass("bg-success");
                    $("#admId").focus();
                                    
                } else {
                    alert("사용가능한 아이디입니다.");
                	$("#admId").addClass("bg-success"); 
                	$("#admId").removeClass("bg-danger");
                    $("#pw").focus();
                    //아이디가 중복하지 않으면  idck = 1 
                    idck = 1;
                }
            },
            error : function(error) {
                
                alert("error : " + error);
            }
        });
    });
});

//연락처 하이픈 자동생성
$(document).on("keyup", "#tel", function() { 
	$(this).val( $(this).val().replace(/[^0-9]/g, "")
			.replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3")
			.replace("--", "-") ); 
});

function selectEmail(ele){ 
	var $ele = $(ele); 
	var $emailDomain = $('input[name=emailDomain]'); // '1'인 경우 직접입력 
	
	if($ele.val() == "1"){ 
		$emailDomain.attr('readonly', false); 
		$emailDomain.val(''); 
	} else { 
		$emailDomain.attr('readonly', true); 
		$emailDomain.val($ele.val()); 
	} 
}

/*데이터 입력
function fn_insert(){
    var form = document.getElementById("writeFrm");	// document.writeFrm   DOM
    form.action = "<c:url value='/admin/insert'/>";
    form.submit();
    /*
    document.getElementById("pw").value
    form.pw.value
    $("#pw").val()
    $("input[name=pw]").val()
	
} */

/*비밀번호 일치 여부 확인
$(function(){ 
	$("#alert-success").hide(); 
	$("#alert-danger").hide(); 
	$("input").keyup(function(){ 
		var pwd1=$("#pw").val(); 
		var pwd2=$("#pw2").val(); 
		if(pwd1 != "" || pwd2 != ""){ 
			if(pwd1 == pwd2){ 
				$("#alert-success").show(); 
				$("#alert-danger").hide(); 
				$("#submit").removeAttr("disabled"); 
		}else{ 
			$("#alert-success").hide(); 
			$("#alert-danger").show(); 
			$("#submit").attr("disabled", "disabled"); 
			} 
		} 
	}); 
});
*/
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
					
					<form name="writeFrm" id="writeFrm" method="post" action="/admin/insert">
					<input type="hidden" name="regId" id="regId" value="${sessionScope.admin.admId }" />
					<div class="boardType01_write">
						<table cellspacing="0" class="boardType01_tbl">
							<caption class="boardType01_cpt"><span class="t-hidden">등록</span></caption>
							<colgroup>
								<col style="width:20%;" />
								<col />
							</colgroup>
							<tbody>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">아이디</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="text" name="admId" id="admId" class="input_textN required" style="width:200px;" maxlength="50" value="" autocomplete=”off”/> 
											<button type="button" id="btn_idck" class="btnTxt btnTxt_normal btnTxt_cyan" style="width:100px; height:28px;line-height:0;"><span>중복확인</span></button>
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">비밀번호</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="password" name="pw" id="pw" class="input_textN required" style="width:200px;" maxlength="50" value="" />
											<!-- <span class="alert alert-success" id="alert-success" style="width:200px;height:5px;" >비밀번호가 일치합니다.</span> 
											<span class="alert alert-danger" id="alert-danger" style="width:200px;height:5px;">비밀번호가 일치하지 않습니다.</span>	 -->
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">비밀번호확인</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="password" name="pw2" id="pw2" class="input_textN" style="width:200px;" maxlength="50" value="" required="required"/>
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">이름</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="text" name="nm" id="nm" class="input_textN" style="width:200px;" maxlength="10" value="" required="required"/>
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">그룹코드</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<select name="authCd" id="authCd" style="width:200px;" class="form-control" required="required">
											      <c:forEach var="code" items="${codes}" varStatus="i">
											         <option value="${code.authCd}">${code.authNm}</option>
											      </c:forEach>
											   </select>
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											연락처
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="text" name="tel" id="tel" class="input_textN" style="width:200px;" maxlength="13" value="" />
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											이메일
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="text" name="emailId" id="emailId" class="input_textN" style="width:200px;" /> @ <input type="text" name="emailDomain" id="emailDomain" value="">
											<select name="select_email" onChange="selectEmail(this)"> 
												<option value="" selected>선택하세요</option> 
												<option value="naver.com">naver.com</option> 
												<option value="gmail.com">gmail.com</option> 
												<option value="hanmail.com">hanmail.com</option> 
												<option value="1">직접입력</option> </select>
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
						<button type="submit" id="btn_write" class="btnTxt btnTxt_normal btnTxt_gray"><span>저장</span></button>
						<button id="boardDel" class="btnTxt btnTxt_normal btnTxt_gray"><span>삭제</span></button>
						<a href="${pageContext.request.contextPath}/admin/list" class="btnTxt btnTxt_normal btnTxt_dark"><span>목록</span></a>
					</div> <!-- //boardType01_write_btn -->
					</form>
						
				</div> <!-- //boardType01_wrap -->
				
			</div> <!-- //subcontent -->
		</div> <!-- //subcontent_inner -->
	</div> <!-- //subcontent_wrap -->
	
</div> <!-- //content -->




