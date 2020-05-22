package com.spring.dev.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.spring.dev.controller.AdminController;

public class AuthLoginInterceptor extends HandlerInterceptorAdapter{
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
    
	// preHandle() : 컨트롤러보다 먼저 수행되는 메서드
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // session 객체를 가져옴
        HttpSession session = request.getSession();
        // login처리를 담당하는 사용자 정보를 담고 있는 객체를 가져옴
        Object admin = session.getAttribute("admin");
          
        if ( admin == null ){
            // 로그인이 안되어 있는 상태임으로 로그인 폼으로 다시 돌려보냄(redirect)
            response.sendRedirect("/admin/login");
            return false; // 더이상 컨트롤러 요청으로 가지 않도록 false로 반환함
		} 
        // preHandle의 return은 컨트롤러 요청 uri로 가도 되냐 안되냐를 허가하는 의미임
        // 따라서 true로하면 컨트롤러 uri로 가게 됨.
        return true;
    }
  
    // 컨트롤러가 수행되고 화면이 보여지기 직전에 수행되는 메서드
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {
        // TODO Auto-generated method stub
    	HttpSession session = request.getSession();
    	Object admin = session.getAttribute("admin");
    	
    	 if (admin !=null) {
         	logger.info("new login success");
         	
         	if (request.getParameter("rememberMe") != null) {
         		logger.info("remember me....");
         		//쿠키 생성
         		Cookie loginCookie = new Cookie("loginCookie", session.getId());
         		loginCookie.setPath("/");
         		loginCookie.setMaxAge(60*60*24*7);
         		//전송
         		response.addCookie(loginCookie);
 			}
    	 }
        super.postHandle(request, response, handler, modelAndView);
    }
} 