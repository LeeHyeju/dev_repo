<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script>
/*검색*/
function fnSearch() {
	submit("groCdSearch");
}
/*submit*/
function submit(service){
	var form = document.getElementById("popupForm");
    form.method = "get";
    form.action = "<c:url value='/cmnCd/" + service + "'/>";
    form.submit();
}
</script>

<div id="contentarea" class="l-content">
	<div class="subcontent_wrap">
		<div class="subcontent_inner">
			<div class="subcontent">
				<form name="popupForm" id="popupForm">
					<div class="boardType01_wrap">
						<table id="boardTable1" class="boardType01_tblList">
							<caption><span class="t-hidden">검색</span></caption>
							<colgroup>
								<col style="width:10%"/>
							</colgroup>
							<tbody>
							<tr>
								<th>그룹코드</th>
								<td><input type="text" id="keyGroCd" name="keyGroCd"></td>
							</tr>
							</tbody>
						</table>
						
						<div class="boardType01_write_btn">
							<button type="button" onClick='fnSearch()' id="btnSearch" class="btnTxt btnTxt_normal btnTxt_gray">검색</button>
						</div>
						
						<table id="boardTable1" class="boardType01_tblList">
							<caption><span class="t-hidden">검색</span></caption>
							<colgroup>
								<col style="width:10%"/>
								<col style="width:10%"/>
							</colgroup>
							<tbody>
							<tr>
								<th>그룹코드</th>
								<td><input type="text" id="keyGroCd" name="keyGroCd"></td>
								<th>그룹명</th>
								<td><input type="text" id="keyGroNm" name="keyGroNm"></td>
							</tr>
							</tbody>
						</table>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>