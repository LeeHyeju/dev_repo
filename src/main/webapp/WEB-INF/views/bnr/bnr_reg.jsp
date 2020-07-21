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
	       	bnrExpl: {
                required 	: true
               ,maxlength 	: 100
           	}
	   		,bnrCont: {
	   			required 	: true
	           ,maxlength 	: 300
	        }
	   		,bnrNm: {
	   			required 	: true
	           ,maxlength 	: 300
	        }
	   		,link: {
	   			required 	: true
	           ,maxlength 	: 300
        	}
       },
       //규칙체크 실패시 출력될 메시지
       messages : {
	       	bnrExpl: {
                required 	: "필수로입력하세요"
               ,maxlength 	: "최대 {100}글자까지 입력하세요"
            }
	        ,bnrCont: {
	        	required 	: "필수로입력하세요"
	            ,maxlength 	: "최대 {300}글자까지 입력하세요"
	        }
	        ,bnrNm: {
                required 	: "필수로입력하세요"
               ,maxlength 	: "최대 {100}글자까지 입력하세요"
            }
             ,link: {
                required 	: "필수로입력하세요"
               ,maxlength 	: "최대 {100}글자까지 입력하세요"
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
    form.action = "<c:url value='/benner/insert'/>";
    form.submit();
}
</script>

<div id="contentarea" class="l-content">
	<div class="breadcrumb">
		<a href="${pageContext.request.contextPath}/main"><span class="path_home">Home</span></a>
		<a href="${pageContext.request.contextPath}/benner/benner"><span>게시판관리</span></a><span>베너관리</span>
		<span class="path_current">${boardManage.boardName}</span>
	</div> <!-- //breadcrumb -->
	
	<div class="subcontent_wrap">
		<div class="subcontent_inner">
			<div class="subcontent">
				
				<div class="subcontent_title_wrap">
					<h3 class="subcontent_title">베 너 관 리</h3>
					<p class="subcontent_desc"></p>
				</div> <!-- //subboard_title_wrap -->
				
				<div class="boardType01_wrap">
					<span class="boardType01_info_top"><strong>*</strong> 필수입력사항입니다.</span>
					
					<form name="writeForm" id="writeForm" method="post">
					<input type="hidden" name="regId" id="regId" value="${sessionScope.admin.admId}"/>
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
											<label for="">베너구분</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<select name="bnrType" id="bnrType" class="input_selectN" style="width:200px;">
												<c:forEach var="bnrType" items="${bnrType}">
													<option value="${bnrType.cmnCd}">${bnrType.cmnNm}</option>
										     	</c:forEach>
											</select>
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">베너종류</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<select name="bnrKind" id="bnrKind" class="input_selectN" style="width:200px;">
												<c:forEach var="bnrKind" items="${bnrKind}">
													<option value="${bnrKind.cmnCd}">${bnrKind.cmnNm}</option>
										     	</c:forEach>
											</select>
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">설명</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="text" name="bnrExpl" id="bnrExpl" class="input_textN" style="width:200px;" maxlength="50"/>
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">사용유무</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<select name="useYn" id="useYn" class="input_selectN" style="width:200px;">
												<option value="Y">Y</option>
												<option value="N">N</option>
											</select>
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">배너내용</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<textarea name="bnrCont" id="bnrCont" class="input_textN" style="width:300px; height:100px;" maxlength="300"></textarea>
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
											<input type="text" name="bnrNm" id="bnrNm" class="input_textN" style="width:200px;" maxlength="50"/>
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
											<input type="text" name="img" id="img" class="input_textN" style="width:200px;" maxlength="50"/>
										</div>
									</td>
								</tr>
								<tr> 
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">링크</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="text" name="link" id="link" class="input_textN" style="width:200px;" maxlength="50"/>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div> <!-- //boardType01_write -->
						
					<div class="boardType01_write_btn">
						<button id="btnInsert" class="btnTxt btnTxt_normal btnTxt_gray"><span>등록</span></button>
						<a href="${pageContext.request.contextPath}/intrbnr/intr_bnr" class="btnTxt btnTxt_normal btnTxt_dark"><span>취소</span></a>
					</div> <!-- //boardType01_write_btn -->
					</form>
				</div> <!-- //boardType01_wrap -->
				
			</div> <!-- //subcontent -->
		</div> <!-- //subcontent_inner -->
	</div> <!-- //subcontent_wrap -->
</div> <!-- //content -->