package com.spring.dev.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.dev.domain.Admin;
import com.spring.dev.service.CmnCdService;

@Controller
@RequestMapping("/cmnCd")
public class CmnCdController {
	private static final Logger logger = LoggerFactory.getLogger(CmnCdController.class);
	
	@Autowired
	CmnCdService service;
	
    @RequestMapping(value = {"/cmn_cd"})
	public String getCmnCd(HttpServletRequest request,  Model model) {
    	logger.info("CmnController list");
    	model.addAttribute("list", service.getCmnCd());
		return "cmnCd/cmn_cd.page";
	}
    
    @RequestMapping(value = {"/insert"}, method = RequestMethod.GET)
	public String insert(HttpServletRequest request, Model model) {
    	logger.info("CmnCdController insert");
		return "/cmnCd/insert.page";
	}
}
