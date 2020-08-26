<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page session="false" %>
<style>
	.sitemap li {margin-right: 10px;float: left;width:170px;text-align:center;}
	.sitemap li span.sitemap-tit01 {border-bottom: 1px #999 solid;display: block;font-size: 16px;font-weight:bold;height:30px;color: #2E64FE;}
	.sitemap li dd {margin-top:10px}
	*{ margin: 0;padding: 0;}
	.pop-layer {display: none; position: absolute; top: 50%; left: 50%; width: 410px;height: auto;background-color: #fff; border: 5px solid #3571B5; z-index: 10;}
	.pop-layer .pop-container {position:relative;}
	.pop-layer .pop-container .pop-conts {margin: 5px 5px 61px 5px;}
	.pop-layer .pop-container .pop-conts img {width:100%}
	.pop-layer .pop-header {height: 28px; background: #3571B5;}
	.pop-layer .pop-header p.ctxt {color: #666; line-height: 28px; color: #fff; font-weight: bold; font-size: 16px}
	.pop-layer .pop-header .btn-header-close {position: absolute; top: 5px; right: 5px; color: #fff}
	.pop-layer .btn-r {position:absolute;bottom:0;width: 100%; margin: 10px 0; padding-top: 10px; border-top: 1px solid #DDD; text-align:center;}
	.dim-layer {display: none; position: fixed;_position: absolute;top: 0;left: 0;width: 100%;height: 100%;z-index: 100;}
	.dim-layer .dimBg {position: absolute;top: 0;left: 0;width: 100%;height: 100%;background: #000; opacity: .5;filter: alpha(opacity=50);}
	.dim-layer .pop-layer {display: block;}
	a.btn-layer-close {display: inline-block;height: 25px;padding: 0 14px 0;border: 1px solid #304a8a;background-color: #3f5a9d;font-size: 13px;color: #fff;line-height: 25px;}
	a.btn-layer-close:hover {border: 1px solid #091940;background-color: #1f326a;color: #fff;}
	.inner-text-color-red *{color:#ff0000 !important}
</style>
<script>
$(document).ready(function() {

function pop(opts) {
	var defaultOptions = {
			title: '',
			content: '',
			w: 200,
			h: 100,
			t: 0,
			l: 0,
			dimed: false,
			target: '_blank',
			url: '#'
	};
	
	var options = $.extend({}, defaultOptions, opts);
	console.log('options', options);
	        
	var $dimLayer = $('div.dim-layer').length > 0 ? $('div.dim-layer') : $('<div class="dim-layer"></div>');
	var $popLayer = $('<div class="pop-layer"><div class="pop-header"><p class="ctxt"></p><a class="btn-header-close" href="#">X</a></div><div class="pop-container"></div><div class="btn-r"><a href="#" class="btn-layer-close">Close</a></div></div>');
	var $popConts = $('<div class="pop-conts"></div>');
	var zIndex = ($dimLayer.data('zindex') || 10) + 1;
	$dimLayer.data('zindex', zIndex);

	if (options.title) {
		$popLayer.find( 'p.ctxt').html(options.title);
	} else {
		$popLayer.find('.pop-header').hide();
	}
	                                                                                                                                                                                                                                                                                                                                                                                                                                                     
	if (options.dimed) {
		if ($('div.dim-layer').find('.dimBg').length == 0) {
			$dimLayer.append('<div class="dimBg"></div>');
		}
	}
	
	$popConts.html(options.content);
	if (options.img) {
		$popConts.append('<img src="${pageContext.request.contextPath}/resources/files/' + options.img + '" />');
	}
	$popLayer.find('div.pop-container').append($popConts);
	$dimLayer.append($popLayer);
	
	$popLayer.css({width: options.w + 'px', height: options.h + 'px', top: options.t + 'px', left: options.l + 'px', zIndex: zIndex});
	
	$popLayer.on('click', function() {
		var zIndex2 = $dimLayer.data('zindex');
		$popLayer.css({zIndex: zIndex2 + 1});
		$dimLayer.data('zindex', zIndex2 + 1);
	});
	
	$popLayer.find('a.btn-layer-close,a.btn-header-close').click(function(){
		if ($dimLayer.find('div.pop-layer').length > 1) {
		} else {
			$dimLayer.fadeOut();
		}
		$popLayer.remove();
        return false;
    });
	
	if ($('div.dim-layer').length == 0) {
		$('body').append($dimLayer);
		$dimLayer.fadeIn();
	}
} 
  //초기화
	function init() {
	//model에서 보낸 값을 json형태로 받는다.
	<c:forEach items="${mainPopup}" var="item">
		var popIdx = "${item.popIdx}";
		var popTp = "${item.popTp}";
		var popNm = "${item.popNm}";
		var popTxt = "${item.popTxt}";
		var popUrl = "${item.popUrl}";
		var popWidth = "${item.popWidth}";
		var popHeight = "${item.popHeight}";
		var popTarget = "${item.popTarget}";
		var popX = "${item.popX}";
		var popY = "${item.popY}";
		var popImg = "${item.saveFile}";
		
		//타입이 레이어일때만!! 
		if(popTp == "layer" ) {
			var opts = {
					title: popNm,
					content: popTxt,
					w: popWidth,
					h: popHeight,
					t: popX,
					l: popY,
					dimed: true,
					target: '_'+popTarget,
					url: popUrl
			};

			if (popImg) {
				opts.img = popImg;
			}
			pop(opts);
		//타입이 윈도우일때만	
		} else {
			// window.open(연결주소, 팝업이름, 팝업옵션);
			var popWin = window.open(popUrl+"?popIdx="+popIdx, popNm, "menubar=no, status=no, toolbar=no, width="+ popWidth +", height=" + popHeight);
			if (!popWin) {
				alert('브라우저 팝업설정을 허용해주세요.');
			}
		}
	</c:forEach>
	}
	
    function layer_popup(el, t, l){
        var $el = $(el);		//레이어의 id를 $el 변수에 저장
        var point = {top: 0, left: 0};
        var defaultPoint = true;
        if (typeof t != 'undefined' && typeof l != 'undefined') {
        	point = {top: t, left: l};
        	defaultPoint = false;
        }
        var isDim = $el.prev().hasClass('dimBg');	//dimmed 레이어를 감지하기 위한 boolean 변수

        isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();

        var $elWidth = ~~($el.outerWidth()), 
            $elHeight = ~~($el.outerHeight()),
            docWidth = $(document).width(),
            docHeight = $(document).height();

        // 화면의 중앙에 레이어를 띄운다
        if (defaultPoint && ($elHeight < docHeight || $elWidth < docWidth)){
            $el.css({
                marginTop: -$elHeight,//-$elHeight /2,
                marginLeft: -$elWidth/2
            })
        } else {
            $el.css(point);
        }

        $el.find('a.btn-layerClose').click(function(){
            isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); //닫기 버튼을 클릭하면 레이어가 닫힘
            return false;
        });

        $('.layer .dimBg').click(function(){
            $('.dim-layer').fadeOut();
            return false;
        });
    }
    init();
});       
</script>
<div id="contentarea" class="l-content">
	<div class="breadcrumb">
		<a href="${pageContext.request.contextPath}/"><span class="path_home">Home</span></a>
	</div> <!-- //breadcrumb -->
	<div class="subcontent_wrap">
		<div class="subcontent_inner">
			<div class="subcontent">
				 
				<div class="subcontent_title_wrap">
					<h3 class="subcontent_title" style="text-align:center">___ S i t e M a p ___ </h3>
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
