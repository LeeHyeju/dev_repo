<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:set var="uri" value="${requestScope['javax.servlet.forward.request_uri']}" />

<div id="aside" class="l-aside">
	
	<h2 class="lnb_title"><span>관리자관리</span></h2>
		<ul id="lnb">
			<li  class="current opened"><a href="${pageContext.request.contextPath}/admin/list">관리자정보관리</a></li>
			<li  class="current"><a href="${pageContext.request.contextPath}/auth/list">권한관리</a></li>
		</ul>
	<h2 class="lnb_title"><span>공통관리</span></h2>
		<ul id="lnb">
			<li  class="current"><a href="${pageContext.request.contextPath}/cmnCd/cmn_cd">공통코드관리</a></li>
		</ul>
	<h2 class="lnb_title"><span>게시판관리</span></h2>
		<ul id="lnb">
			<li  class="current"><a href="${pageContext.request.contextPath}/intrBrd/info">통합게시판관리</a></li>
			<li  class="current"><a href="${pageContext.request.contextPath}/intrBrd/intr_brd_brd">통합게시판(게시판형)</a></li>
			<li  class="current"><a href="${pageContext.request.contextPath}/intrBrd/intr_brd_faq">통합게시판(질문형)</a></li>
			<li  class="current"><a href="${pageContext.request.contextPath}/intrBrd/intr_brd_gal">통합게시판(갤러리형)</a></li>
		</ul>
</div> <!-- //aside -->