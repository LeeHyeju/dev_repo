package com.spring.dev.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.dev.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	AdminService service;
	
	/*타일즈 적용*/
    @RequestMapping(value = {"/list"})
	public String getList(HttpServletRequest request,  Model model) {
    	
    	model.addAttribute("list", service.getList());
		return "admin/list.page";
	}
}
