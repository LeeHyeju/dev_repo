<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page session="false" %>
<style>
	.sitemap li {margin-right: 10px;float: left;width:170px;text-align:center;}
	.sitemap li span.sitemap-tit01 {border-bottom: 1px #999 solid;display: block;font-size: 16px;font-weight:bold;height:30px;color: #2E64FE;}
	.sitemap li dd {margin-top:10px}
</style>

<div id="contentarea" class="l-content">
	<div class="breadcrumb">
		<a href="${pageContext.request.contextPath}/"><span class="path_home">Home</span></a>
	</div> <!-- //breadcrumb -->
	<div class="subcontent_wrap">
		<div class="subcontent_inner">
			<div class="subcontent">
				 
				<div class="subcontent_title_wrap">
					<h3 class="subcontent_title" style="text-align:center">__  S i t e M a p __  </h3>
					<hr>
					<p class="subcontent_desc"></p>
				</div> <!-- //subcontent_title_wrap -->
						
				<div class="boardType01_wrap">
					<ul class="sitemap">
						<li>
							<span class="sitemap-tit01">관 리 자 관 리</span>
							<dl>
								<dd><a href="${pageContext.request.contextPath}/admin/list">관리자정보관리</a></dd>
								<dd><a href="${pageContext.request.contextPath}/auth/list">권한관리</a></dd>
							</dl>
						</li>
						<li>
							<span class="sitemap-tit01">공 통 관 리</span>
							<dl>
								<dd><a href="${pageContext.request.contextPath}/cmnCd/cmn_cd">공통코드관리</a></dd>
							</dl>
						</li>
						<li>
							<span class="sitemap-tit01">게 시 판 관 리</span>
							<dl>
								<dd><a href="${pageContext.request.contextPath}/intrBrd/intr_brd">통합게시판관리</a></dd>
								<dd><a href="${pageContext.request.contextPath}/intrBrd/intr_brd_noti">게시판형</a></dd>
								<dd><a href="${pageContext.request.contextPath}/intrBrd/intr_brd_faq">질문형</a></dd>
								<dd><a href="${pageContext.request.contextPath}/intrBrd/intr_brd_gal">갤러리형</a></dd>
							</dl>
						</li>
						<li>
							<span class="sitemap-tit01">화 면 관 리</span>
							<dl>
								<dd><a href="${pageContext.request.contextPath}/contents/list">컨텐츠관리</a></dd>
								<dd><a href="${pageContext.request.contextPath}/popup/list">팝업관리</a></dd>
							</dl>
						</li>
					</ul>
				</div>
				
			</div> <!-- //subcontent -->
		</div> <!-- //subcontent_inner -->
	</div> <!-- //subcontent_wrap -->
	
</div> <!-- //content -->