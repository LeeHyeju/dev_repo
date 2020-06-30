<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div id="header">
	<div class="inner l-base">
		<h1 class="logo"><a href="${pageContext.request.contextPath}/main" target="_blank"><img src="#" alt="로고" /></a></h1>
		
		<div class="topmenu">
			<ul class="utility clearfix">
				<li><a href="${pageContext.request.contextPath}/admin/list">${sessionScope.admin.nm } 님</a></li>
				<li class="bar">|</li>
				<c:choose>
					<c:when test="${sessionScope.admin.nm ne null }">
						<li><a href="${pageContext.request.contextPath}/admin/logout">로그아웃</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="${pageContext.request.contextPath}/admin/login/">로그인</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div> <!-- //topmenu -->
		
		<div id="nav"> 
			<ul class="gnb clearfix">
				<li><a href="${pageContext.request.contextPath}/admin/list">관리자관리</a></li>
				<li><a href="${pageContext.request.contextPath}/member/">공통관리</a></li>
				<li><a href="${pageContext.request.contextPath}/member/">게시판관리</a></li>
				<li><a href="${pageContext.request.contextPath}/contents/list">컨텐츠관리</a></li>
				<li><a href="${pageContext.request.contextPath}/member/">메뉴관리</a></li>
			</ul> <!-- //gnb -->
		</div> <!-- //nav -->
	</div> <!-- //inner -->
</div> <!-- //header -->