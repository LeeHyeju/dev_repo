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
    		,brdCont: {
    			required 	: true
               ,maxlength 	: 300
            }
		    ,useYn: {
		    	required 	: true
		    }
        },
        //규칙체크 실패시 출력될 메시지
        messages : {
        	brdTl: {
                 required 	: "필수로입력하세요"
                ,maxlength 	: "최대 {100}글자까지 입력하세요"
            }
	        ,brdCont: {
	        	required 	: "필수로입력하세요"
               ,maxlength 	: "최대 {300}글자까지 입력하세요"
	        }
	        ,useYn: {
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
function fnInsert() {
	var brdType = document.getElementById("brdType").value;
	var brdTypeNm = brdType == '1' ? '대출' : (brdType == '2' ? '서비스' : '기타');
	document.getElementById("brdTypeNm").value = brdTypeNm;
	
	var form = document.getElementById("writeForm");
    form.method = "get";
    form.action = "<c:url value='/intrBrd/galInsert'/>";
    form.submit();
}
</script>


<script>
    $(function() {
        function init() {
            var appendFiles = [];

            var $dnd = $('#dnd');
            var xhr = new XMLHttpRequest();
	        if (xhr.upload) {
                $dnd.on("dragenter", function(e) {
                    e.stopPropagation();
                    e.preventDefault();

                    e.originalEvent.dataTransfer.dropEffect = "copy";
                    $dnd.css('background-color','#ccc');
                });
                $dnd.on("dragleave", function(e) {
                    e.stopPropagation();
                    e.preventDefault();

                    $dnd.css('background-color','#fefefe');
                });
                $dnd.on("dragover", function(e) {
                    e.stopPropagation();
                    e.preventDefault();

                    e.originalEvent.dataTransfer.dropEffect = "copy";
                    $dnd.css('background-color','#ccc');
                });
                $dnd.on("drop", function(e) {
                    e.preventDefault();

                    $dnd.css('background-color','#fefefe');

                    var files = e.originalEvent.dataTransfer.files;
                    
                    appendFiles = appendFiles.concat(files);
                    $.each(files, function(k, y) {
                        var reader = new FileReader();
                        reader.onload = function(r) {
                        console.log('r', r);
                        };
                        reader.readAsDataURL(files[k]);
                        console.log('drop', files[k]);
                    });
                });
            }
        }
        init();
     //// var formData = new FormData(form);
     //// formData.append('files', appendFiles);

     /// var $f = $('<input type="file" name="files" multiple="multiple" />');
     /// $f.files = appendFiles;
     /// form.append($f);

    });
  </script>
<div id="contentarea" class="l-content">
	<div class="breadcrumb">
		<a href="${pageContext.request.contextPath}/main"><span class="path_home">Home</span></a>
		<a href="${pageContext.request.contextPath}/intrBrd/intr_brd"><span>게시판관리</span></a>
		<span>통합게시판(갤러리형)</span><span class="path_current">${boardManage.boardName}</span>
	</div> <!-- //breadcrumb -->
	
	<div class="subcontent_wrap">
		<div class="subcontent_inner">
			<div class="subcontent">
				
				<div class="subcontent_title_wrap">
					<h3 class="subcontent_title">통 합 게 시 판 (갤러리형)</h3>
					<p class="subcontent_desc"></p>
				</div> <!-- //subboard_title_wrap -->
				
				<div class="boardType01_wrap">
					<span class="boardType01_info_top"><strong>*</strong> 필수입력사항입니다.</span>
					
					<form name="writeForm" id="writeForm">
					<input type="hidden" name="regId" id="regId" value="${sessionScope.admin.admId}"/>
					<input type="hidden" name="brdTypeNm" id="brdTypeNm"/>
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
												<option value="1">대출</option>
											    <option value="2">서비스</option>
											    <option value="3">기타</option>
											</select>
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
											<input type="text" name="brdTl" id="brdTl" class="input_textN" style="width:200px;" maxlength="100"/>
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
											<label for="">이미지</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="file" name="img" id="img" class="input_textN" style="width:200px;" maxlength="50"/>
											<span><strong>${view.orgnFile}</strong></span>
										</div>
										<img src="${pageContext.request.contextPath}/resources/files/${view.saveFile}" width="70%"  align="middle" style="margin-top: 10px"/>
											<%-- <input type="file" name="file" id="file" class="input_textN" style="width:200px;" maxlength="50" value="${view.saveFile}" /> --%>
									</td>
								</tr>
							</tbody>
						</table>
					</div> <!-- //boardType01_write -->
						
					<div class="boardType01_write_btn">
						<button type="submit" id="btnReg" class="btnTxt btnTxt_normal btnTxt_gray"><span>등록</span></button>
						<a href="${pageContext.request.contextPath}/intrBrd/intr_brd_gal" class="btnTxt btnTxt_normal btnTxt_dark"><span>취소</span></a>
					</div> <!-- //boardType01_write_btn -->
					</form>
				</div> <!-- //boardType01_wrap -->
				
			</div> <!-- //subcontent -->
		</div> <!-- //subcontent_inner -->
	</div> <!-- //subcontent_wrap -->
	
</div> <!-- //content -->