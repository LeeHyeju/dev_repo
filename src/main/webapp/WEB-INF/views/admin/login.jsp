<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/admin_login.css" type="text/css" media="screen, projection">

<div class="login-container"> 
	<div class="card align-middle" style="width: 20rem; border-radius: 20px;">
		<div class="card-title" style="margin-top: 30px;">
			<h2 class="card-title text-center" style="color: #113366;">ADMIN</h2>
		</div>
		<div class="card-body">
			<c:if test="${sessionScope.admId == null }">
				<form class="form-signin" method="post"
					action="${pageContext.request.contextPath}/admin/login">
					<label for="admId" class="sr-only">ID</label>
					<input type="text" id="admId" name="admId" class="form-control" placeholder="Your ID" required autofocus><br> 
					<label for="pw" class="sr-only">Password</label>
					<input type="password" id="pw" name="pw" class="form-control" placeholder="Password" required><br>
					<div class="checkbox">
						<label> <input type="checkbox" name="rememberMe" value="rememberMe"> Remember Me </label>
					</div>
					<button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit">L O G I N</button>
				</form>
			</c:if>
		</div>
	</div>
	<p></p>
	<div class="modal"></div>
</div>
