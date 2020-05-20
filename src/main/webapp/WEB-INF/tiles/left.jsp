<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:set var="uri" value="${requestScope['javax.servlet.forward.request_uri']}" />

<div id="aside" class="l-aside">
	
	<h2 class="lnb_title"><span>관리자관리</span></h2>
	<ul id="lnb">
		<li  class="current opened"><a href="${pageContext.request.contextPath}/member/info">회원현황</a></li>
		<li  class="current"><a href="${pageContext.request.contextPath}/member/info">회원현황</a></li>
	</ul>
		<h2 class="lnb_title"><span>공통관리</span></h2>
	<ul id="lnb">
		<li  class="current opened"><a href="${pageContext.request.contextPath}/member/info">회원현황</a></li>
		<li  class="current"><a href="${pageContext.request.contextPath}/member/info">회원현황</a></li>
	</ul>
</div> <!-- //aside -->