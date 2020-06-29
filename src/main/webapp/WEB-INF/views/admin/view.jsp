<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:if test="${!empty msg}">
<script>
	alert('<c:out value="${msg}"/>');
</script>
</c:if>
<script>
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
	
	$("#viewFrm").validate({
	    //규칙
		rules: {
		        pw: {
		            required : true,
		            minlength : 5
		        },
		        nm: {
		            required : true,
		            minlength : 2
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
				pw: {
				    required : "비밀번호를 입력하세요",
				    minlength : "최소 {5}글자이상 입력하세요"
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
		    form.method = "post";
		    form.action = "<c:url value='/admin/update'/>";
		  	form.submit();
		},
		invalidHandler: function(form, validator) {
		  	
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
	   	 	form.action = "<c:url value='/admin/delete'/>";
	   	 	form.submit();
		} 
	}
	
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
					<input type="hidden" name="admId" id="admId" value="${view.admId }" />
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
											<label for="">아이디</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											${view.admId }
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">비밀번호 확인</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="password" name="pw" id="pw" class="input_textN" style="width:200px;" maxlength="50" value="" />
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
											<input type="text" name="nm" id="nm" class="input_textN" style="width:200px;" maxlength="50" value="${view.nm }" />
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
											<select name="authCd" id="authCd" style="width:200px;" class="form-control" >
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
											<input type="text" name="tel" id="tel" class="input_textN" style="width:200px;" maxlength="50" value="${view.tel }" />
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
											<input type="text" name="emailId" id="emailId" value="${view.emailId}"class="input_textN" style="width:200px;" /> @ <input type="text" name="emailDomain" id="emailDomain" value="${view.emailDomain}">
											<select name="select_email" onChange="selectEmail(this)" class="form-control input-sm" style="width:100px;display: inline-block;"> 
												<option value="" selected>선택하세요</option> 
												<option value="naver.com" <c:if test="${view.emailDomain eq 'naver.com'}">selected="selected"</c:if>>naver.com</option> 
												<option value="gmail.com" <c:if test="${view.emailDomain eq 'gmail.com'}">selected="selected"</c:if>>gmail.com</option> 
												<option value="hanmail.com" <c:if test="${view.emailDomain eq 'hanmail.com'}">selected="selected"</c:if>>hanmail.com</option> 
												<option value="nate.com" <c:if test="${view.emailDomain eq 'nate.com'}">selected="selected"</c:if>>nate.com</option> 
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
								<tr> 
									<th>
										<span class="th_wrap">
											수정여부
										</span>
									</th>
									<td>
										<div class="input_adj">
											<select name="delYn" class="form-control input-sm" style="width:100px;display: inline-block;"> 
												<option value="${view.delYn}">${view.delYn}</option>
												<option value="${view.delYn=='Y'?'N':'Y'}">${view.delYn=='Y'?'N':'Y'}</option>
											</select>
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											삭제여부
										</span>
									</th>
									<td>
										<div class="input_adj">
											<select name="useYn" class="form-control input-sm" style="width:100px;display: inline-block;"> 
												<option value="${view.useYn}">${view.useYn}</option>
												<option value="${view.useYn=='Y'?'N':'Y'}">${view.useYn=='Y'?'N':'Y'}</option>
											</select>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div> <!-- //boardType01_write -->
						
					<div class="boardType01_write_btn">
						<button type="button" id="btn_write" class="btnTxt btnTxt_normal btnTxt_gray" onClick="fn_update()"><span>수정</span></button>
						<button type="submit" id="boardDel" class="btnTxt btnTxt_normal btnTxt_gray" onClick="fn_delete()"><span>삭제</span></button>
						<a href="${pageContext.request.contextPath}/admin/list" class="btnTxt btnTxt_normal btnTxt_dark"><span>목록</span></a>
					</div> <!-- //boardType01_write_btn -->
					</form>
				</div> <!-- //boardType01_wrap -->
			</div> <!-- //subcontent -->
		</div> <!-- //subcontent_inner -->
	</div> <!-- //subcontent_wrap -->
</div> <!-- //content -->




