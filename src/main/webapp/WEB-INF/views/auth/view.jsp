<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script>
/*수정*/
function fn_update(){
	    var form = document.getElementById("viewFrm");
	    form.method = "post";
	    form.action = "<c:url value='/auth/update'/>";
	    form.submit();
}

/*삭제*/
function fn_delete(){
    var form = document.getElementById("viewFrm");
    form.method = "post";
    form.action = "<c:url value='/auth/delete'/>";
    form.submit();
}
</script>

<div id="contentarea" class="l-content">
	<div class="breadcrumb">
		<a href="${pageContext.request.contextPath}/main"><span class="path_home">Home</span></a><a href="${pageContext.request.contextPath}/auth/list"><span>권한관리</span></a><span>권한정보관리 조회</span><span class="path_current">${boardManage.boardName}</span>
	</div> <!-- //breadcrumb -->
	
	<div class="subcontent_wrap">
		<div class="subcontent_inner">
			<div class="subcontent">
				
				<div class="subcontent_title_wrap">
					<h3 class="subcontent_title">권한정보관리</h3>
					<p class="subcontent_desc">.</p>
				</div> <!-- //subboard_title_wrap -->
				
				<div class="boardType01_wrap">
					<span class="boardType01_info_top"><strong>*</strong> 필수입력사항입니다.</span>
					
					<form name="viewFrm" id="viewFrm">
					<input type="hidden" name="authCd" id="authCd" value="${view.authCd }" />
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
											<label for="">권한코드</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
										${view.authCd }
										</div>
									</td>
								</tr>
								<tr> 
									<th>
										<span class="th_wrap">
											<span class="bullet_required">*<span class="t-hidden">필수</span></span>
											<label for="">권한명</label>
										</span>
									</th>
									<td>
										<div class="input_adj">
											<input type="text" name="authNm" id="authNm" class="input_textN" style="width:200px;" maxlength="50" value="${view.authNm }" />
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
							</tbody>
						</table>
					</div> <!-- //boardType01_write -->
					</form>
						
					<div class="boardType01_write_btn">
						<button type="button" id="btn_write" class="btnTxt btnTxt_normal btnTxt_gray" onClick='fn_update()' ><span>수정</span></button>
						<button type="submit" id="boardDel" class="btnTxt btnTxt_normal btnTxt_gray" onClick='fn_delete()'><span>삭제</span></button>
						<a href="${pageContext.request.contextPath}/auth/list" class="btnTxt btnTxt_normal btnTxt_dark"><span>목록</span></a>
					</div> <!-- //boardType01_write_btn -->
				</div> <!-- //boardType01_wrap -->
				
			</div> <!-- //subcontent -->
		</div> <!-- //subcontent_inner -->
	</div> <!-- //subcontent_wrap -->
	
</div> <!-- //content -->




