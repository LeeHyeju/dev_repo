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
        	brdNm: {
                 required 	: true
                ,maxlength 	: 100
            }
    		,brdPage: {
                 required 	: true
                ,maxlength 	: 100
            }
		    ,fileYn: {
		    	required 	: true
		    }
		    ,notiYn: {
		    	required 	: true
		    }
		    ,replYn: {
		    	required 	: true
		    }
		    ,cmtYn: {
		    	required 	: true
		    }
		    ,useYn: {
		    	required 	: true
		    }
		    ,delYn: {
		    	required 	: true
		    }
        },
        //규칙체크 실패시 출력될 메시지
        messages : {
        	brdNm: {
                 required 	: "필수로입력하세요"
                ,maxlength 	: "최대 {100}글자까지 입력하세요"
            }
	        ,brdPage: {
	            required 	: "필수로입력하세요"
	           ,maxlength 	: "최대 {100}글자까지 입력하세요"
	       	}
	        ,fileYn: {
	        	required 	: "필수로선택하세요"
	        }
	        ,notiYn: {
	        	required 	: "필수로선택하세요"
	        }
	        ,replYn: {
	        	required 	: "필수로선택하세요"
	        }
	        ,cmtYn: {
	        	required 	: "필수로선택하세요"
	        }
	        ,useYn: {
	        	required 	: "필수로선택하세요"
	        }
	        ,delYn: {
	        	required 	: "필수로선택하세요"
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
    form.action = "<c:url value='/intrBrd/insertBrd'/>";
    form.submit();
}
</script>

<div id="contentarea" class="l-content">
	<div class="breadcrumb">
		<a href="${pageContext.request.contextPath}/main"><span class="path_home">Home</span></a>
		<a href="${pageContext.request.contextPath}/intrBrd/intr_brd"><span>게시판관리</span></a>
		<span>통합게시판관리</span><span class="path_current">${boardManage.boardName}</span>
	</div> <!-- //breadcrumb -->
	
	<div class="subcontent_wrap">
		<div class="subcontent_inner">
			<div class="subcontent">
				
				<div class="subcontent_title_wrap">
					<h3 class="subcontent_title">통 합 게 시 판 관 리</h3>
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
											<label for="">유형</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<select name="brdType" id="brdType" class="input_selectN" style="width:200px;">
												<c:forEach var="type" items="${type}">
													<option value="${type.cmnNm}">${type.cmnNm}</option>
										     	</c:forEach>
											</select>
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">게시판명</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="text" name="brdNm" id="brdNm" class="input_textN" style="width:200px;" maxlength="50"/>
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">게시판 페이지</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="text" name="brdPage" id="brdPage" class="input_textN" style="width:200px;" maxlength="50"/>
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">첨부여부</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="radio" name="fileYn" id="fileY" class="input_group" style="width:50px;" value="Y">
											<label for="fileYn">사용</label>
											<input type="radio" name="fileYn" id="fileN" class="input_group" style="width:50px;" value="N">
											<label for="fileYn">미사용</label>
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">답글여부</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="radio" name="replYn" id="replY" class="input_group" style="width:50px;" value="Y">
											<label for="replYn">사용</label>
											<input type="radio" name="replYn" id="replN" class="input_group" style="width:50px;" value="N">
											<label for="replYn">미사용</label>
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">댓글여부</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="radio" name="cmtYn" id="cmtY" class="input_group" style="width:50px;" value="Y">
											<label for="cmtYn">사용</label>
											<input type="radio" name="cmtYn" id="cmtN" class="input_group" style="width:50px;" value="N">
											<label for="cmtYn">미사용</label>
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
											<input type="radio" name="useYn" id="useY" class="input_group" style="width:50px;" value="Y">
											<label for="useYn">사용</label>
											<input type="radio" name="useYn" id="useN" class="input_group" style="width:50px;" value="N">
											<label for="useYn">미사용</label>
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">삭제여부</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="radio" name="delYn" id="delY" class="input_group" style="width:50px;" value="Y">
											<label for="delYn">사용</label>
											<input type="radio" name="delYn" id="delN" class="input_group" style="width:50px;" value="N">
											<label for="delYn">미사용</label>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div> <!-- //boardType01_write -->
						
					<div class="boardType01_write_btn">
						<button id="btnInsert" class="btnTxt btnTxt_normal btnTxt_gray"><span>등록</span></button>
						<a href="${pageContext.request.contextPath}/intrBrd/intr_brd" class="btnTxt btnTxt_normal btnTxt_dark"><span>취소</span></a>
					</div> <!-- //boardType01_write_btn -->
					</form>
				</div> <!-- //boardType01_wrap -->
				
			</div> <!-- //subcontent -->
		</div> <!-- //subcontent_inner -->
	</div> <!-- //subcontent_wrap -->
</div> <!-- //content -->