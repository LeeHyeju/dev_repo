<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:set var="uri" value="${requestScope['javax.servlet.forward.request_uri']}" />

<div id="header">
	<div class="inner l-base">
		<h1 class="logo"><a href="${pageContext.request.contextPath}/" target="_self">
		<img src="${pageContext.request.contextPath}/resources/admin/img/common/logo4.png" style="width:100px;height:40px"alt="로고" /></a></h1>
		
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
				<li class="<c:if test="${fn:indexOf(uri, '/admin/') > -1 || fn:indexOf(uri, '/auth/') > -1 }">active</c:if>"><a href="${pageContext.request.contextPath}/admin/list">관리자관리</a></li>
				<li class="<c:if test="${fn:indexOf(uri, '/cmnCd/') > -1 }">active</c:if>"><a href="${pageContext.request.contextPath}/cmnCd/cmn_cd">공통관리</a></li>
				<li class="<c:if test="${fn:indexOf(uri, '/intrBrd/') > -1 }">active</c:if>"><a href="${pageContext.request.contextPath}/intrBrd/intr_brd_noti">게시판관리</a></li>
				<li class="<c:if test="${fn:indexOf(uri, '/contents/') > -1 }">active</c:if>"><a href="${pageContext.request.contextPath}/contents/list">화면관리</a></li>
			</ul> <!-- //gnb -->
		</div> <!-- //nav -->
	</div> <!-- //inner -->
</div> <!-- //header -->