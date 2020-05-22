<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="container">
    <table class="board_view" border="1">
    	<colgroup> 
    		<col width="15%"/> 
    		<col width="35%"/> 
    		<col width="15%"/> 
    		<col width="35%"/> 
    	</colgroup>
		<tbody>
			<tr>
				<th>아이디</th>
				<th>비번</th>
				<th>이름</th>
				<th>그룹코드</th>
				<th>연락처</th>
				<th>이메일</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>수정여부</th>
				<th>삭제여부</th>
			</tr>
			<tr>
				<td>
					<label for="admId">ID</label>
					<input type="text" name="admId" value="${view.admId }"></input>
				</td>
				<td>
					<label for="pw">PW</label>
					<input type="text" name="pw" value="${view.pw }"></input>
				</td>
				<td>
					<label for="nm">NM</label>
					<input type="text" name="pw" value="${view.nm }" ></input>
				</td>
			</tr>
			<tr>
				
			</tr>
		</tbody>
 	</table>
        <div class="card-body">
            <a href="#" class="btn btn-outline-secondary btn-sm" role="button">수정</a>
            <a href="#" class="btn btn-outline-secondary btn-sm " role="button">삭제</a>
        </div>
        <div class="card-body">
            <a href='<c:url value='/board/boardList'/>' class="btn btn-info" role="button">목록으로</a>
     	</div>
</div>


