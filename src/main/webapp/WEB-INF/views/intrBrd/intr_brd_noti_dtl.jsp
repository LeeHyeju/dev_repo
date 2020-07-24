<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script>
//validation 체크 & 저장
function fnSave() {
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
        },
        // validation이 끝난 이후의 submit 직전 추가 작업할 부분
        submitHandler: function(form) {
        	if(confirm("저장하시겠습니까?") == true){
        		var brdType = document.getElementById("brdType").value;
	        	var brdTypeNm = brdType == '0001' ? '대출' : (brdType == '0002' ? '서비스' : '기타');
	        	document.getElementById("brdTypeNm").value = brdTypeNm;
        	
	        	// 저장
	        	submit('save');
        	}
        },
       	// jquery validate 로 사용하기 힘든 validation 체크
        invalidHandler: function(form, validator) {
        }
    });
}
/*삭제*/
function fnDel(){
	if(confirm("삭제하시겠습니까?") == true){
		 submit('del');
	}
}
/*submit*/
function submit(service){
	var form = document.getElementById("writeForm");
    form.method = "get";
    form.action = "<c:url value='/intrBrd/" + service + "'/>";
    form.submit();
}
/*달력*/
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

</script>

<div id="contentarea" class="l-content">
	<div class="breadcrumb">
		<a href="${pageContext.request.contextPath}/main"><span class="path_home">Home</span></a>
		<a href="${pageContext.request.contextPath}/intrBrd/intr_brd"><span>게시판관리</span></a>
		<span>${brd.brdNm}</span><span class="path_current">${boardManage.boardName}</span>
	</div> <!-- //breadcrumb -->
	
	<div class="subcontent_wrap">
		<div class="subcontent_inner">
			<div class="subcontent">
				
				<div class="subcontent_title_wrap">
					<h3 class="subcontent_title">${brd.brdNm}</h3>
					<p class="subcontent_desc"></p>
					
				</div> <!-- //subboard_title_wrap -->
				
				<div class="boardType01_wrap">
					<span class="boardType01_info_top"><strong>*</strong> 필수입력사항입니다.</span>
					
					<form name="writeForm" id="writeForm">
					<input type="hidden" name="hit" id="hit" value="${dtl.hit}"/>
					<input type="hidden" name="brdCd" id="brdCd" value="${dtl.brdCd}"/>
					<input type="hidden" name="brdTypeNm" id="brdTypeNm" value="${dtl.brdTypeNm}"/>
					<div class="boardType01_write">
						<table id="boardTable1" class="boardType01_tbl">
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
										<div class="input_adj" style="display:${dtl.brdType == '0003' || authCd == 'ADM01' || authCd == 'BRD01' || authCd == 'A0001' ? 'none' : ''};">
											<input type="text" name="brdType" id="brdType" class="input_textN" disabled style="width:200px;" value="${dtl.brdTypeNm}"/>
										</div>
										<div class="input_adj" style="display:${dtl.brdType == '0003' || authCd == 'ADM01' || authCd == 'BRD01' || authCd == 'A0001' ? '' : 'none'};">
											<select name="brdType" id="brdType" class="input_selectN" style="width:200px;">
												<option value="${dtl.brdType}">${dtl.brdTypeNm}</option>
											      <c:forEach var="type" items="${type}">
											         <option value="${type.brdType}">${type.brdTypeNm}</option>
											      </c:forEach>
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
											<input type="text" name="brdTl" id="brdTl" class="input_textN" style="width:200px;" maxlength="50" value="${dtl.brdTl}"/>
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
											<textarea name="brdCont" id="brdCont" class="input_textN" style="width:300px; height:100px;" maxlength="300">${dtl.brdCont}</textarea>
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
											<select name="useYn" id="useYn" class="input_selectN" style="width:200px;">
												<option value="${dtl.useYn}">${dtl.useYn}</option>
												<option value="${dtl.useYn=='Y'?'N':'Y'}">${dtl.useYn=='Y'?'N':'Y'}</option>
											</select>
										</div>
									</td>
								</tr>
								<c:if test="${brd.postPeriYn == 'Y'}">
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">시작일</label>
										</span>
									</th>
									<td>
										<div class="input_adj">	
											<input type="text" name="startDt" id="startDt" class="datepicker" style="width:200px;" maxlength="50" value="<fmt:formatDate value="" pattern="yyyy-MM-dd"/>" />
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">종료일</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="text" name="endDt" id="endDt" class="datepicker" style="width:200px;" maxlength="50" value="<fmt:formatDate value="" pattern="yyyy-MM-dd"/>" />
										</div>
									</td>
								</tr>
								</c:if>
								<c:if test="${brd.vdYn == 'Y'}">
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">동영상</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="text" name="vd" id="vd" class="input_textN" style="width:200px;" maxlength="50" value="${dtl.vd}" />
										</div>
									</td>
								</tr>
								</c:if>
								<c:if test="${brd.fileYn == 'Y'}">
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">첨부파일</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="text" name="file" id="file" class="input_textN" style="width:200px;" maxlength="50" value="${dtl.file}"/>
										</div>
									</td>
								</tr>
								</c:if>
								<c:if test="${brd.linkYn == 'Y'}">
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">연결URL</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="text" name="link" id="link" class="input_textN" style="width:200px;" maxlength="50" value="${dtl.link}"/>
										</div>
									</td>
								</tr>
								</c:if>
								<c:if test="${brd.imgYn == 'Y'}">
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">이미지</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="text" name="img" id="img" class="input_textN" style="width:200px;" maxlength="50" value="${dtl.img}" />
										</div>
									</td>
								</tr>
								</c:if>
								<c:if test="${brd.replYn == 'Y'}">
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">답글</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<textarea name="replCont" id="replCont" class="input_textN" style="width:300px; height:100px;" maxlength="300">${dtl.replCont}</textarea>
										</div>
									</td>
								</tr>
								</c:if>
								<c:if test="${brd.cmtYn == 'Y'}">
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">댓글</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="text" name="cmtCont" id="cmtCont" class="input_textN" style="width:200px;" value="${dtl.cmtCont}"/>
										</div>
									</td>
								</tr>
								</c:if>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">작성일</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<fmt:formatDate var="fmtDate" value="${dtl.regDt}" pattern="yyyy.MM.dd"/>
											${fmtDate}
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
											${dtl.regId}
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div> <!-- //boardType01_write -->
						
					<div class="boardType01_write_btn">
						<button type="submit" id="btnSave" onClick="fnSave()" style="display:${dtl.brdType == '3' || authCd == 'ADM01' || authCd == 'BRD01' || authCd == 'A0001' ? '' : 'none'};" class="btnTxt btnTxt_normal btnTxt_gray"><span>저장</span></button>
						<button id="btnDel" onClick="fnDel()" style="display:${dtl.brdType == '3' || authCd == 'ADM01' || authCd == 'BRD01' || authCd == 'A0001' ? '' : 'none'};" class="btnTxt btnTxt_normal btnTxt_gray"><span>삭제</span></button>
						<a href="${pageContext.request.contextPath}/intrBrd/intr_brd_noti" class="btnTxt btnTxt_normal btnTxt_dark"><span>목록</span></a>
					</div> <!-- //boardType01_write_btn -->
					
					<table id="boardTable2" class="boardType01_tblList">
						<caption><span class="t-hidden">검색</span></caption>
						<colgroup>
							<col style="width:5%"/>
							<col style="width:20%"/>
						</colgroup>
						<tbody>
							<tr class="hover">
								<c:if test="${not empty pri}">
									<td>이전글</td>
									<td style="text-overflow : ellipsis;overflow : hidden;"><a href="/intrBrd/intr_brd_noti_dtl?brdCd=${pri.brdCd}&hit=${pri.hit}&regId=${pri.regId}"><nobr>${pri.brdTl}</nobr></a></td>
								</c:if>
							</tr>
					     	<c:if test="${empty pri}">
							<tr style="border-top: 1px solid;">
								<td colspan="2" class="no-data"><strong>이전 글이 존재하지 않습니다.</strong></td>
							</tr>
							</c:if>
							<tr class="hover">
								<c:if test="${not empty next}">
									<td>다음글</td>
									<td style="text-overflow : ellipsis;overflow : hidden;"><a href="/intrBrd/intr_brd_noti_dtl?brdCd=${next.brdCd}&hit=${next.hit}&regId=${next.regId}"><nobr>${next.brdTl}</nobr></a></td>
								</c:if>
							</tr>
					     	<c:if test="${empty next}">
							<tr>
								<td colspan="2" class="no-data"><strong>다음 글이 존재하지 않습니다.</strong></td>
							</tr>
							</c:if>
					</tbody>
					</table>
					</form>
				</div> <!-- //boardType01_wrap -->
				
			</div> <!-- //subcontent -->
		</div> <!-- //subcontent_inner -->
	</div> <!-- //subcontent_wrap -->
	
</div> <!-- //content -->




