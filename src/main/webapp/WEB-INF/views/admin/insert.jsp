<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


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
					
					<form name="writeFrm" id="writeFrm" method="post" enctype="multipart/form-data">
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
											<input type="text" name="admId" id="admId" class="input_textN" style="width:200px;" maxlength="50" value="" />
											<button type="button" id="btn_overlap" class="btnTxt btnTxt_normal btnTxt_cyan" style="width:100px; height:28px;line-height:0;"><span>중복확인</span></button>
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
											<input type="password" name="pw" id="pw" class="input_textN" style="width:200px;" maxlength="50" value="" />
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
											<input type="text" name="nm" id="nm" class="input_textN" style="width:200px;" maxlength="10" value="" />
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
										${view.authCd }
											<select name="boardCate" id="boardCate" class="input_selectN" style="width:96px;">
												<c:forEach var="cate" items="${boardManage.boardCates}">
													<option value="${cate}" <c:if test="${cate == board.boardCate}">selected="selected"</c:if>>${cate}</option>
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
											${view.tel }
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
											${view.email }
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
						<button type="button" id="btn_write" class="btnTxt btnTxt_normal btnTxt_gray"><span>저장</span></button>
						<button id="boardDel" class="btnTxt btnTxt_normal btnTxt_gray"><span>삭제</span></button>
						<a href="${pageContext.request.contextPath}/admin/list" class="btnTxt btnTxt_normal btnTxt_dark"><span>목록</span></a>
					</div> <!-- //boardType01_write_btn -->
				</div> <!-- //boardType01_wrap -->
				
			</div> <!-- //subcontent -->
		</div> <!-- //subcontent_inner -->
	</div> <!-- //subcontent_wrap -->
	
</div> <!-- //content -->




