package com.spring.dev.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dev.domain.Admin;
import com.spring.dev.domain.Auth;
import com.spring.dev.domain.PageMaker;
import com.spring.dev.domain.SearchCriteria;
import com.spring.dev.service.AuthService;

@Controller
@RequestMapping("/auth")
public class AuthController {
	private static final Logger logger = LoggerFactory.getLogger(AuthController.class);
	
	@Autowired
	AuthService service;
	
	/*타일즈 적용 시 page*/
    @RequestMapping(value = {"/list"})
	public String getAuth(Model model, @ModelAttribute("cri") SearchCriteria cri) {
    	logger.info("AuthController List");
    	
    	int count = service.listCount(cri.getSearchType(), cri.getKeyword());
    	
		model.addAttribute("list", service.getAuth(cri));
		model.addAttribute("count", count);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listCount(cri.getSearchType(), cri.getKeyword()));
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("page", cri.getPage());
		model.addAttribute("searchType", cri.getSearchType());
		model.addAttribute("keyword", cri.getKeyword());
		
		return "/auth/list.page";
	}
    
    @RequestMapping(value = {"/view"})
	public String view(HttpServletRequest request, String admId, Model model) {
    	logger.info("AuthController view");
    	model.addAttribute("view", service.view(admId));
		return "auth/view.page";
	}
    
    @RequestMapping(value = {"/insert"}, method = RequestMethod.GET)
	public String insert(HttpServletRequest request, Admin admin, Model model) throws UnsupportedEncodingException {
    	request.setCharacterEncoding("UTF-8");
    	logger.info("AuthController insert");
		return "auth/insert.page";
	}
    
    @RequestMapping(value = {"/insert"}, method = RequestMethod.POST)
	public String insertProcess(HttpServletRequest request, Auth auth, Model model) throws UnsupportedEncodingException {
    	logger.info("AuthController insertProcess");
    	service.insert(auth);
		return "redirect:/auth/list";
	}
    
    @RequestMapping(value = {"/update"}, method = RequestMethod.POST)
	public String update(HttpServletRequest request, Auth auth,  Model model) {
    	logger.info("AuthController update");
		service.update(auth);
		return "redirect:/auth/list";
	}

    @RequestMapping(value = {"/delete"} , method = RequestMethod.POST)
	public String delete(HttpServletRequest request, String authCd,  Model model) {
    	logger.info("AuthController delete _ authCd : " + authCd);
    	service.delete(authCd);
		return "redirect:/auth/list";
	}
}
