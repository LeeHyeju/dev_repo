<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script>
$(function() {
    //input을 datepicker로 선언
    $(".datepicker").datepicker({
        dateFormat: 'yy-mm-dd' //Input Display Format 변경
        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
        ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
        ,changeYear: true //콤보박스에서 년 선택 가능
        ,changeMonth: true //콤보박스에서 월 선택 가능                
        ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
        ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
        ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
        ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
        ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
        ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
        ,minDate: "-0D" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
        ,maxDate: "+1Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
    });                    
    $('#startDate').datepicker();
    $('#endDate').datepicker();
    
    //초기값을 오늘 날짜로 설정
	$( "#datepicker" ).datepicker( "getDate" );
    //    $('.datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
});

/*수정*/
function fn_update(){
	    var form = document.getElementById("viewFrm");
	    form.method = "post";
	    form.action = "<c:url value='/popup/update'/>";
	    form.submit();
}

/*삭제*/
function fn_delete(){
    var form = document.getElementById("viewFrm");
    form.method = "post";
    form.action = "<c:url value='/popup/delete'/>";
    form.submit();
}
</script>

<div id="contentarea" class="l-content">
	<div class="breadcrumb">
		<a href="${pageContext.request.contextPath}/main"><span class="path_home">Home</span></a><a href="${pageContext.request.contextPath}/popup/list"><span>팝업정보관리</span></a><span>팝업정보관리 조회</span><span class="path_current">${boardManage.boardName}</span>
	</div> <!-- //breadcrumb -->
	
	<div class="subcontent_wrap">
		<div class="subcontent_inner">
			<div class="subcontent">
				
				<div class="subcontent_title_wrap">
					<h3 class="subcontent_title">팝업정보관리</h3>
					<p class="subcontent_desc">.</p>
				</div> <!-- //subboard_title_wrap -->
				
				<div class="boardType01_wrap">
					<span class="boardType01_info_top"><strong>*</strong> 필수입력사항입니다.</span>
					
					<form name="viewFrm" id="viewFrm">
					<input type="hidden" name="popIdx" id="popIdx" value="${view.popIdx }" />
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
											<label for="">팝업종류</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<select name="popTp" id="popTp" style="width:200px;" class="form-control" >
												<option value="layer" <c:if test="${view.popTp eq 'layer'}">selected</c:if>>레이어팝업</option>
												<option value="window"<c:if test="${view.popTp eq 'window'}">selected</c:if>>윈도우팝업</option>
											</select>
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">팝업이름</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="text" name="popNm" id="popNm" class="input_textN" style="width:200px;" maxlength="50" value="${view.popNm }" />
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">팝업이미지</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="file" name="popImg" id="popImg" class="input_textN" style="width:200px;" maxlength="50" value="${view.popImg }" />
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">팝업내용</span>
									</th>
									<td>
										<div class="input_adj">
											<textarea name="popTxt" id="popTxt" class="input_textN" style="width:550px;height:150px;resize: none;">${view.popTxt }</textarea>
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<label for="">시작일</label>
										</span>
									</th>
									<td>
										<div class="input_adj">	
											<input type="text" name="startDt" id="startDt" class="datepicker" style="width:200px;" maxlength="50" value="<fmt:formatDate value="${view.startDt }" pattern="yyyy-MM-dd"/>" />
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<label for="">종료일</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="text" name="endDt" id="endDt" class="datepicker" style="width:200px;" maxlength="50" value="<fmt:formatDate value="${view.endDt }" pattern="yyyy-MM-dd"/>" />
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<label for="">팝업URL</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="text" name="popUrl" id="popUrl" class="input_textN" style="width:200px;" maxlength="100" value="${view.popUrl }" />
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">사용여부</span>
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
											<fmt:formatDate value="${view.regDt}" pattern="yyyy-MM-dd"/>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div> <!-- //boardType01_write -->
					</form>
						
					<div class="boardType01_write_btn">
						<button type="button" id="btn_write" class="btnTxt btnTxt_normal btnTxt_gray" onClick='fn_update()' ><span>수정</span></button>
						<button type="submit" id="boardDel" class="btnTxt btnTxt_normal btnTxt_gray" onClick='fn_delete()'><span>삭제</span></button>
						<a href="${pageContext.request.contextPath}/popup/list" class="btnTxt btnTxt_normal btnTxt_dark"><span>목록</span></a>
					</div> <!-- //boardType01_write_btn -->
				</div> <!-- //boardType01_wrap -->
				
			</div> <!-- //subcontent -->
		</div> <!-- //subcontent_inner -->
	</div> <!-- //subcontent_wrap -->
	
</div> <!-- //content -->




