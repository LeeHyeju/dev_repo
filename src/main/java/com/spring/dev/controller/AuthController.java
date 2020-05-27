package com.spring.dev.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.dev.service.AuthService;

@Controller
@RequestMapping("/auth")
public class AuthController {
	private static final Logger logger = LoggerFactory.getLogger(AuthController.class);
	
	@Autowired
	AuthService service;
	
	/*타일즈 적용 시 page*/
    @RequestMapping(value = {"/list"})
	public String getAuth(HttpServletRequest request,  Model model) {
    	logger.info("AuthController List");
    	model.addAttribute("list", service.getAuth());
		return "auth/list.page";
	}
}
