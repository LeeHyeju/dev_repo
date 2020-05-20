<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div id="header">
	<div class="inner l-base">
		<h1 class="logo"><a href="${pageContext.request.contextPath}/main" target="_blank"><img src="#" alt="로고" /></a></h1>
		
		<div class="topmenu">
			<ul class="utility clearfix">
				<li><a href="${pageContext.request.contextPath}/manage/writ">이혜주 님</a></li>
				<li class="bar">|</li>
				<li><a href="${pageContext.request.contextPath}/login/logout/">로그아웃</a></li>
			</ul>
		</div> <!-- //topmenu -->
		
		<div id="nav"> 
			<ul class="gnb clearfix">
				<li><a href="${pageContext.request.contextPath}/member/">관리자관리</a></li>
				<li><a href="${pageContext.request.contextPath}/member/">공통관리</a></li>
				<li><a href="${pageContext.request.contextPath}/member/">게시판관리</a></li>
				<li><a href="${pageContext.request.contextPath}/member/">컨텐츠관리</a></li>
				<li><a href="${pageContext.request.contextPath}/member/">메뉴관리</a></li>
			</ul> <!-- //gnb -->
		</div> <!-- //nav -->
	</div> <!-- //inner -->
</div> <!-- //header -->