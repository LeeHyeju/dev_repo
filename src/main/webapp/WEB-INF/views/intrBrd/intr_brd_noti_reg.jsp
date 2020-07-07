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
        	brdTl: {
                 required 	: true
                ,maxlength 	: 100
            }
    		,ancmOptnYn: {
    			 required 	: true
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
	        ,ancmOptnYn: {
	        	required 	: "필수로선택하세요"
	        }
	        ,brdCont: {
	        	required 	: "필수로입력하세요"
               ,maxlength 	: "최대 {300}글자까지 입력하세요"
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
    form.action = "<c:url value='/intrBrd/insert'/>";
    form.submit();
}
</script>

<div id="contentarea" class="l-content">
	<div class="breadcrumb">
		<a href="${pageContext.request.contextPath}/main"><span class="path_home">Home</span></a>
		<a href="${pageContext.request.contextPath}/intrBrd/intr_brd_noti"><span>게시판관리</span></a><span>통합게시판(게시판형)</span>
		<span class="path_current">${boardManage.boardName}</span>
	</div> <!-- //breadcrumb -->
	
	<div class="subcontent_wrap">
		<div class="subcontent_inner">
			<div class="subcontent">
				
				<div class="subcontent_title_wrap">
					<h3 class="subcontent_title">통 합 게 시 판 (게시판형)</h3>
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
											<label for="">제목</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="text" name="brdTl" id="brdTl" class="input_textN" style="width:200px;" maxlength="50" value="${dtl.boardTitle}"/>
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">공지옵션</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="radio" name="ancmOptnYn" id="ancmOptnY" class="input_group" style="width:50px;" maxlength="50" value="Y">
											<label for="ancmOptnYn">사용</label>
											<input type="radio" name="ancmOptnYn" id="ancmOptnN" class="input_group" style="width:50px;" maxlength="50" value="N">
											<label for="ancmOptnYn">미사용</label>
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">파일</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="text" name="fileYn" id="fileYn" class="input_textN" style="width:200px;" maxlength="50" value="${dtl.fileYn}" />
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
											<input type="text" name="brdCont" id="brdCont" class="input_textN" style="width:200px;" maxlength="50" value="${dtl.boardContent}" />
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div> <!-- //boardType01_write -->
						
					<div class="boardType01_write_btn">
						<button id="btnInsert" class="btnTxt btnTxt_normal btnTxt_gray"><span>등록</span></button>
						<a href="${pageContext.request.contextPath}/intrBrd/intr_brd_noti" class="btnTxt btnTxt_normal btnTxt_dark"><span>취소</span></a>
					</div> <!-- //boardType01_write_btn -->
					</form>
				</div> <!-- //boardType01_wrap -->
				
			</div> <!-- //subcontent -->
		</div> <!-- //subcontent_inner -->
	</div> <!-- //subcontent_wrap -->
</div> <!-- //content -->